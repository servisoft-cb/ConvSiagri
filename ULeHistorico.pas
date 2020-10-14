unit ULeHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, NxCollection, Grids, DBGrids, SMDBGrid, UDMFolha, ComObj;

type
  TfrmLeHistorico = class(TForm)
    NxPanel1: TNxPanel;
    Label1: TLabel;
    FilenameEdit1: TFilenameEdit;
    btnLeExcel: TNxButton;
    NxButton2: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Label2: TLabel;
    FilenameEdit2: TFilenameEdit;
    btnLeTxt: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLeExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure btnLeTxtClick(Sender: TObject);
  private
    { Private declarations }
    gGrid: TStringGrid;
    linha  : Integer;
    vArquivo_XLS : String;
    vRegistro : String;

    procedure prc_Le_Arq_Planilha;

    function fnc_verifica_Arquivo(NomeArquivo, Le_Grava : String) : String;
    function XlsToStringGrid2(AGrid: TStringGrid; AXLSFile: string; WorkSheet: Integer): Boolean;

    function fnc_Montar_Campo: String;

  public
    { Public declarations }
    fDMFolha : TDMFolha;
    
  end;

var
  frmLeHistorico: TfrmLeHistorico;

implementation

uses rsDBUtils, DB;

{$R *.dfm}

procedure TfrmLeHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmLeHistorico.btnLeExcelClick(Sender: TObject);
begin
  if trim(FilenameEdit1.Text) = '' then
  begin
    MessageDlg('Arquivos do histórico em excel não informado!', mtInformation, [mbOk], 0);
    exit;
  end;
  fDMFolha.mHistorico.EmptyDataSet;
  gGrid := TStringGrid.Create(gGrid);
  vArquivo_XLS := fnc_verifica_Arquivo(FilenameEdit1.Text,'L');
  XlsToStringGrid2(gGrid,vArquivo_XLS,1);
  prc_Le_Arq_Planilha;
  FreeAndNil(gGrid);
end;

procedure TfrmLeHistorico.prc_Le_Arq_Planilha;
var
  vTexto1 : String;
  vAchou : Integer;
  vValor : String;
begin
  Linha  := 0;
  vAchou := 0;
  while Linha < gGrid.RowCount -1 do
  begin
    Linha := Linha + 1;
    if Linha >= 1 then
    begin
      try
        vTexto1 := fDMFolha.Monta_Numero(gGrid.Cells[2,Linha],0);
        if trim(vTexto1) <> '' then
        begin
          fDMFolha.mHistorico.Insert;
          vTexto1 := gGrid.Cells[2,Linha];
          fDMFolha.mHistoricoCodigo.AsInteger := StrToInt(vTexto1);
          fDMFolha.mHistoricoNome.AsString    := gGrid.Cells[3,Linha];
          fDMFolha.mHistorico.Post;
        end;
      except
        on e: Exception do
        ShowMessage('Ocorreu o seguinte erro ao gravar Historico!' + #13 + e.Message);
      end;
    end;
  end;
end;

procedure TfrmLeHistorico.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMFolha);

end;

function TfrmLeHistorico.fnc_verifica_Arquivo(NomeArquivo,
  Le_Grava: String): String;
begin
  if copy(NomeArquivo,1,1) = '"' then
    delete(NomeArquivo,1,1);
  if copy(NomeArquivo,Length(NomeArquivo),1) = '"' then
    delete(NomeArquivo,Length(NomeArquivo),1);
  if (Le_Grava = 'G') and (copy(NomeArquivo,Length(NomeArquivo),1) = '\') then
    delete(NomeArquivo,Length(NomeArquivo),1);
  Result := NomeArquivo;
end;

function TfrmLeHistorico.XlsToStringGrid2(AGrid: TStringGrid;
  AXLSFile: string; WorkSheet: Integer): Boolean;
const
	xlCellTypeLastCell = $0000000B;
var
	XLApp, Sheet: OLEVariant;
	RangeMatrix: Variant;
	x, y, k, r: Integer;
begin
	Result := False;
	//Cria Excel- OLE Object
	XLApp  := CreateOleObject('Excel.Application');
	try
		//Esconde Excel
		XLApp.Visible:=False;

		//Abre o Workbook
		XLApp.Workbooks.Open(AXLSFile);

		//Setar na planilha desejada
		XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[WorkSheet].Activate;

		// Para saber a dimensão do WorkSheet (o número de linhas e de colunas),
		//selecionamos a última célula não vazia do worksheet
		Sheet :=  XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[WorkSheet];
		Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Select;

    //Pegar o número da última linha
    x:=XLApp.ActiveCell.Row;
		//x:=fDMExcel.cdsProduto.RecordCount;
    //Pegar o número da última coluna
		y:=XLApp.ActiveCell.Column;

		//Seta Stringgrid linha e coluna
		AGrid.RowCount:=x;
		AGrid.ColCount:=y;

		//Associa a variant WorkSheet com a variant do Delphi
		RangeMatrix:=XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

		//Cria o loop para listar os registros no TStringGrid
		k:=1;
		repeat
		  for r:=1 to y do
		  begin
			 AGrid.Cells[(r - 1),(k - 1)] := RangeMatrix[K, R];

			 //Redimensionar tamanho das colunas do grid dinamicamente
			 If (AGrid.ColWidths[r-1] < (Length(AGrid.Cells[(r - 1),(k - 1)]) * 8)) then
				AGrid.ColWidths[r-1] := Length(AGrid.Cells[(r - 1),(k - 1)]) * 8;

		  end;
		  Inc(k,1);
		until k > x;
		RangeMatrix := Unassigned;
	finally
		//Fecha o Excel
		if not VarIsEmpty(XLApp) then
		   begin
			  XLApp.Quit;
			  XLAPP:=Unassigned;
			  Sheet:=Unassigned;
			  Result:=True;
		   end;
	end;
end;

procedure TfrmLeHistorico.NxButton2Click(Sender: TObject);
begin
  FilenameEdit2.Text := fnc_verifica_Arquivo(FilenameEdit2.Text,'L');
  fDMFolha.prc_Gravar_HistoricoTxt(FilenameEdit2.Text);
end;

procedure TfrmLeHistorico.btnLeTxtClick(Sender: TObject);
begin
  fDMFolha.prc_Le_HistoricoTxt(FilenameEdit2.Text);
end;

function TfrmLeHistorico.fnc_Montar_Campo: String;
var
  i, X: Integer;
  vTexto: String;
begin
  Result := '';
  i      := pos(';',vRegistro);
  if i = 0 then
    i := Length(vRegistro) + 1;
  Result := Copy(vRegistro,1,i-1);
  vTexto := Result;
  Delete(vRegistro,1,i);
  for x := 1 to Length(vTexto) do
  begin
    if Pos(vTexto[x],'''"') > 0 then
    begin
      vTexto[x] := ' ';
    end;
  end;
  if trim(copy(vTexto,1,1)) = '' then
    Delete(vTexto,1,1);
  if trim(copy(vTexto,Length(vTexto),1)) = '' then
    Delete(vTexto,Length(vTexto),1);
  Result := vTexto;
end;


end.
