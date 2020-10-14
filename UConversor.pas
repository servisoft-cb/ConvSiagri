unit UConversor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, Grids, DBGrids, SMDBGrid, NxCollection, UDMFolha,
  ExtCtrls, StdCtrls, Mask, ToolEdit, ComObj, Buttons, DB, SqlExpr,
  CurrEdit, midaslib, NxEdit, AdvPanel;

type
  TfrmConversor = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_ResumoFolha: TRzTabSheet;
    pnlPrincipal: TAdvPanel;
    SMDBGrid2: TSMDBGrid;
    NxPanel1: TNxPanel;
    Label2: TLabel;
    Label4: TLabel;
    btnSalvarTabela: TNxButton;
    btnSalvarEBS: TNxButton;
    FilenameEdit1: TFilenameEdit;
    edtDiretorio_EBS: TDirectoryEdit;
    TS_Fornecedores: TRzTabSheet;
    AdvPanel1: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel2: TNxPanel;
    btnGravar_Forn: TNxButton;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    edtNomeArq: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    edtCNPJ: TEdit;
    TS_Contabil: TRzTabSheet;
    NxPanel3: TNxPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnLeLancContabil: TNxButton;
    btnSalvarArqContabil: TNxButton;
    FilenameEdit2: TFilenameEdit;
    edtDiretorioContabil: TDirectoryEdit;
    CurrencyEdit2: TCurrencyEdit;
    edtNomeArqCont: TEdit;
    Edit2: TEdit;
    AdvPanel2: TAdvPanel;
    SMDBGrid3: TSMDBGrid;
    Label11: TLabel;
    DateEdit1: TDateEdit;
    btnConfiguracao: TNxButton;
    TS_PlanoContas: TRzTabSheet;
    SMDBGrid4: TSMDBGrid;
    NxPanel4: TNxPanel;
    btnGravar: TNxButton;
    TS_Historico: TRzTabSheet;
    NxPanel5: TNxPanel;
    NxButton1: TNxButton;
    SMDBGrid5: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarTabelaClick(Sender: TObject);
    procedure btnSalvarEBSClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravar_FornClick(Sender: TObject);
    procedure btnLeLancContabilClick(Sender: TObject);
    procedure btnSalvarArqContabilClick(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    fDMFolha : TDMFolha;
    Txt  : TextFile;
    vRegistro : String;
    vArquivo : String;
    vArquivo_XLS : String;
    vContador  : Integer;
    vVlrContabil : Real;

    gGrid: TStringGrid;
    linha  : Integer;


    procedure prc_Le_Arq_Planilha;

    function fnc_verifica_Arquivo(NomeArquivo, Le_Grava : String) : String;

    function Replace(Str, Ant, Novo: string): string;
    function XlsToStringGrid2(AGrid: TStringGrid; AXLSFile: string; WorkSheet: Integer): Boolean;

    procedure prc_Montar_Header; //Tipo 0
    procedure prc_Montar_Emitente; //Tipo 4
    procedure prc_Montar_NotasFiscais; //Tipo 1
    procedure prc_Montar_DadosComplementares; //Tipo 5
    procedure prc_Montar_Trailler; //Tipo 3

    procedure prc_Montar_CliFor;

    function Formatar_Campo(Campo: String; Tamanho: Integer): String;
    function CharEspeciais(Texto:String):String;

    procedure prc_Gravar_mAuxiliar(Nome_Conta, Valor : String);
    procedure prc_Monta_mForn;
    procedure prc_Salvar_Arq_Siagri;
    procedure prc_Carrega_Campo;
    function fnc_Cab : String;
    function fnc_Parcelas : String;
    function fnc_Contabilidade : String;
    function fnc_CCusto : String;
    function fnc_Correntista : String;

    procedure prc_Salvar_Arq_Siagri_Contabil;
    function fnc_Cab2 : String;
    function fnc_Contabilidade2 : String;
    function fnc_CCusto2 : String;
    function fnc_Correntista2 : String;

  public
    { Public declarations }
  end;

var
  frmConversor: TfrmConversor;

implementation

uses rsDBUtils, StrUtils, DmdDatabase_EBS, DateUtils, UConfiguracao;

{$R *.dfm}


procedure TfrmConversor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConversor.FormCreate(Sender: TObject);
begin
  fDMFolha := TDMFolha.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMFolha);
end;

procedure TfrmConversor.btnSalvarTabelaClick(Sender: TObject);
begin
  if trim(FilenameEdit1.Text) = '' then
  begin
    MessageDlg('Arquivos dos pagamentos não informado!', mtInformation, [mbOk], 0);
    exit;
  end;
  fDMFolha.mAuxiliar.EmptyDataSet;
  gGrid := TStringGrid.Create(gGrid);
  vArquivo_XLS := fnc_verifica_Arquivo(FilenameEdit1.Text,'L');
  XlsToStringGrid2(gGrid,vArquivo_XLS,1);
  prc_Le_Arq_Planilha;
  FreeAndNil(gGrid);
end;

function TfrmConversor.fnc_verifica_Arquivo(NomeArquivo, Le_Grava : String) : String;
begin
  if copy(NomeArquivo,1,1) = '"' then
    delete(NomeArquivo,1,1);
  if copy(NomeArquivo,Length(NomeArquivo),1) = '"' then
    delete(NomeArquivo,Length(NomeArquivo),1);
  if (Le_Grava = 'G') and (copy(NomeArquivo,Length(NomeArquivo),1) = '\') then
    delete(NomeArquivo,Length(NomeArquivo),1);
  Result := NomeArquivo;
end;

function TfrmConversor.Replace(Str, Ant, Novo: string): string;
var
  iPos: Integer;
begin
  while Pos(Ant, Str) > 0 do
  begin
    iPos := Pos(Ant, Str);
    Str := copy(Str, 1, iPos - 1) + Novo + copy(Str, iPos + 1, Length(Str) - iPos);
  end;
  Result := Str;
end;

procedure TfrmConversor.prc_Le_Arq_Planilha;
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
    if Linha > 1 then
    begin
      try
        vTexto1 := gGrid.Cells[4,Linha];
        if trim(vTexto1) = 'TRIBUTOS' then
          vAchou := vAchou + 1
        else
        if trim(vTexto1) = 'TOTAIS' then
          vAchou := vAchou + 1
        else
        if vAchou = 3 then
        begin
          vTexto1 := gGrid.Cells[0,Linha];
          if (vTexto1 = 'VALOR DE INSS - DESCONTADO') or
             (vTexto1 = 'VALOR DE INSS - FPAS') or
             (vTexto1 = 'VALOR DE INSS - TERCEIROS') or
             (vTexto1 = 'VALOR DE INSS - RAT') then
          begin
            vValor := gGrid.Cells[3,Linha];
            prc_Gravar_mAuxiliar('INSS',vValor);
          end;
          vTexto1 := gGrid.Cells[4,Linha];
          if vTexto1 = 'VALOR DO FGTS' then
          begin
            vValor := gGrid.Cells[7,Linha];
            prc_Gravar_mAuxiliar('FGTS',vValor);
          end;
        end
        else
        if vAchou = 4 then
        begin
          vTexto1 := gGrid.Cells[4,Linha];
          if vTexto1 = 'TOTAL LíQUIDO' then
          begin
            vValor := gGrid.Cells[7,Linha];
            prc_Gravar_mAuxiliar('TOTAL LIQUIDO',vValor);
          end;
        end;

      except
        on e: Exception do
        ShowMessage('Ocorreu o seguinte erro ao gravar, cliente ' + fDMFolha.mAuxiliarNome_Conta.AsString + ', na linha ' + IntToStr(linha) + ' :' + #13 + e.Message);
      end;
    end;
  end;
  MessageDlg('Tabela gravada!', mtInformation, [mbOk], 0);
end;

function TfrmConversor.XlsToStringGrid2(AGrid: TStringGrid;
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

procedure TfrmConversor.btnSalvarEBSClick(Sender: TObject);
begin
  if trim(edtDiretorio_EBS.Text) = '' then
  begin
    MessageDlg('Pasta para salvar o arquivo não informada!', mtError, [mbOk], 0);
    exit;
  end;
  if trim(edtNomeArq.Text) = '' then
  begin
    MessageDlg('Nome do arquivo não informado!', mtError, [mbOk], 0);
    edtNomeArq.SetFocus;
    exit;
  end;

  vContador    := 0;
  vVlrContabil := 0;
  vRegistro    := '';
  vArquivo   := edtDiretorio_EBS.Text;
  if Copy(vArquivo,(Length(vArquivo)),1) <> '\' then
    vArquivo := vArquivo + '\';
  vArquivo := vArquivo + edtNomeArq.Text;

  prc_Salvar_Arq_Siagri;

  MessageDlg(vArquivo + ', Gerado!' , mtConfirmation, [mbOk], 0);

  {AssignFile(Txt,vArquivo + 'NOTASAI.TXT');
  ReWrite(Txt);

  prc_Montar_Header;

  fDMFolha.mAuxiliar.IndexFieldNames := 'DtEmissao';
  fDMFolha.mAuxiliar.First;
  while not fDMFolha.mAuxiliar.Eof do
  begin
    if trim(fDMFolha.mAuxiliarVlr_Total.AsString) <> '' then
      vVlrContabil := vVlrContabil + fDMFolha.mAuxiliarVlr_Total.AsFloat;

    prc_Montar_Emitente; //Tipo 4
    prc_Montar_NotasFiscais; //Tipo 1
    prc_Montar_DadosComplementares; //Tipo 5

    fDMFolha.mAuxiliar.Next;
  end;

  prc_Montar_Trailler;

  CloseFile(Txt);

  MessageDlg('Arquivo TXT gerado!', mtInformation, [mbOk], 0);}
end;

procedure TfrmConversor.prc_Montar_DadosComplementares;
var
  texto1 : String;
begin
{  //Tipo Registro   Tamanho 1 - 1 a 1
  Texto1 := '5';
  //Valor Mercadorias   Tamanho 12 - 2 a 13
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',12);
  //Desconto   Tamanho 12 - 14 a 25
  if trim(fDMFolha.mAuxiliarVlr_Desconto.AsString) <> '' then
    Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mAuxiliarVlr_Desconto.AsFloat),12)
  else
    Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Frete   Tamanho 12 - 26 a 37
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',12);
  //Despesas   Tamanho 12 - 38 a 49
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',12);
  //Seguro   Tamanho 12 - 50 a 61
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',12);
  //Peso Bruto   Tamanho 8 - 62 a 69
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',8);
  //Peso Líquido   Tamanho 8 - 70 a 77
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',8);
  //CNPJ/CPF Transportador   Tamanho 18 - 78 a 95
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',18);
  //Meio de Transporte   Tamanho 1 - 96 a 96
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',1);
  //Placa   Tamanho 15 - 97 a 111
  Texto1 := Texto1 + Formatar_Campo('',15);
  //Volumes   Tamanho 6 - 112 a 117
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',6);
  //Espécie   Tamanho 10 - 118 a 127
  Texto1 := Texto1 + Formatar_Campo('',10);
  //Número RE   Tamanho 12 - 128 a 139
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',12);
  //Número de Despacho Tamanho 11 - 140 a 150
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',11);
  //País Destino   Tamanho 6 - 151 a 156
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',6);
  //Moeda    Tamanho 6 - 157 a 162
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',6);
  //Data Despacho    Tamanho 8 - 163 a 170
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',8);
  //Valor Despacho    Tamanho 12 - 171 a 182
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',12);
  //CNPJ/CPF Remetente    Tamanho 18 - 183 a 200
  Texto1 := Texto1 + Formatar_Campo('',18);
  //UF Destino     Tamanho 2 - 201 a 202
  Texto1 := Texto1 + Formatar_Campo('',2);
  //Identificação Exterior Remetente   Tamanho 18 - 203 a 220
  Texto1 := Texto1 + Formatar_Campo('',18);
  //Redespacho     Tamanho 1 - 221 a 221
  Texto1 := Texto1 + Formatar_Campo('N',1);
  //INSS Retido    Tamanho 12 - 222 a 233
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //FUNRURAL    Tamanho 12 - 234 a 245
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Chave NFe    Tamanho 44 - 246 a 289
  Texto1 := texto1 + Formatar_Campo('',44);
  //ISS Retido    Tamanho 1 - 290 a 290
  Texto1 := texto1 + Formatar_Campo('N',1);
  //ISS Devido Prestação  Tamanho 1 - 291 a 291
  Texto1 := texto1 + Formatar_Campo('N',1);
  //UF Prestação  Tamanho 2 - 292 a 293
  Texto1 := texto1 + Formatar_Campo('',2);
  //Municipio Prestação  Tamanho 7 - 294 a 300
  Texto1 := texto1 + fDMFolha.Monta_Numero('',7);
  //UF Origem  Tamanho 2 - 301 a 302
  Texto1 := texto1 + Formatar_Campo('',2);
  //Municipio Origem  Tamanho 7 - 303 a 309
  Texto1 := texto1 + fDMFolha.Monta_Numero('',7);
  //ICMS-ST Retido Antecipadamente  Tamanho 1 - 310 a 310
  Texto1 := texto1 + Formatar_Campo('N',1);
  //Inscrição Estadual Destinatário  Tamanho 20 - 311 a 330
  Texto1 := texto1 + Formatar_Campo('',20);
  //Tipo de Assinante Telecom Tamanho 1 - 331 a 331
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',1);
  //Tipo de Utilização Telecom Tamanho 1 - 332 a 332
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',1);
  //Número Terminal Telecom  Tamanho 10 - 333 a 342
  Texto1 := texto1 + Formatar_Campo('',10);
  //Número Fatura Telecom   Tamanho 9 - 343 a 351
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',9);
  //Consignatário  Tamanho 18 - 352 a 369
  Texto1 := texto1 + Formatar_Campo('',18);
  //Brancos  Tamanho 119 - 370 a 489
  Texto1 := texto1 + Formatar_Campo('',119);
  //Uso EBS  Tamanho 5 - 490 a 494
  Texto1 := texto1 + Formatar_Campo('',5);
  //Sequência   Tamanho 6 - 495 a 500
  vContador := vContador + 1;
  Texto1    := Texto1 + fDMFolha.Monta_Numero(IntToStr(vContador),6);
  Writeln(txt,texto1);}
end;

procedure TfrmConversor.prc_Montar_Emitente;
var
  texto1, texto2 : String;
  vExiste : Boolean;
begin
{  //Tipo Registro   Tamanho 1 - 1 a 1
  Texto1 := '4';
  //CNPJ do Cliente   Tamanho 18 - 2 a 19
  texto2 := fDMFolha.mAuxiliarCNPJ_CPF.AsString;
  texto1 := texto1 + Formatar_Campo(texto2,18);
  vExiste := False;
  if fDMFolha.mCliente.Locate('CNPJ_CPF',fDMFolha.mAuxiliarCNPJ_CPF.AsString,[loCaseInsensitive]) then
    vExiste := True;
  //Razão Social   Tamanho 40 - 20 a 59
  texto1 := texto1 + Formatar_Campo(copy(fDMFolha.mAuxiliarNome_Cliente.AsString,1,40),40);
  //Fantasia   Tamanho 20 - 60 a 79
  if vExiste then
    texto1 := texto1 + Formatar_Campo(copy(fDMFolha.mClienteFantasia.AsString,1,20),20)
  else
    texto1 := texto1 + Formatar_Campo('',20);
  //Estado   Tamanho 2 - 80 a 81
  if vExiste then
    texto1 := texto1 + Formatar_Campo(fDMFolha.mClienteUF.AsString,2)
  else
    texto1 := texto1 + Formatar_Campo('',2);
  //Inscrição   Tamanho 20 - 82 a 101
  if vExiste then
    texto1 := texto1 + Formatar_Campo(fDMFolha.mClienteInscEstadual.AsString,20)
  else
    texto1 := texto1 + Formatar_Campo('',20);
  //Endereço   Tamanho 40 - 102 a 141
  if vExiste then
    texto1 := texto1 + Formatar_Campo(copy(fDMFolha.mClienteEndereco.AsString,1,40),40)
  else
    texto1 := texto1 + Formatar_Campo('',40);
  //Bairro   Tamanho 20 - 142 a 161
  if vExiste then
    texto1 := texto1 + Formatar_Campo(copy(fDMFolha.mClienteBairro.AsString,1,20),20)
  else
    texto1 := texto1 + Formatar_Campo('',20);
  //Cidade   Tamanho 20 - 162 a 181
  if vExiste then
    texto1 := texto1 + Formatar_Campo(copy(fDMFolha.mClienteCidade.AsString,1,20),20)
  else
    texto1 := texto1 + Formatar_Campo('',20);
  //CEP   Tamanho 8 - 182 a 189
  if vExiste then
    texto1 := texto1 + fDMFolha.Monta_Numero(fDMFolha.mClienteCep.AsString,8)
  else
    texto1 := texto1 + fDMFolha.Monta_Numero('',8);
  //Código Municipio SIAFI   Tamanho 4 - 190 a 193
  if vExiste then
    texto1 := texto1 + fDMFolha.Monta_Numero(copy(fDMFolha.mClienteCodMunicipio.AsString,1,4),4)
  else
    texto1 := texto1 + fDMFolha.Monta_Numero('',4);
  //DDD    Tamanho 3 - 194 a 196
  if vExiste then
    texto1 := texto1 + fDMFolha.Monta_Numero(fDMFolha.mClienteDDD.AsString,3)
  else
    texto1 := texto1 + fDMFolha.Monta_Numero('',3);
  //Fone   Tamanho 10 - 197 a 206
  if vExiste then
    texto1 := texto1 + fDMFolha.Monta_Numero(copy(trim(fDMFolha.mClienteFone.AsString),1,10),10)
  else
    texto1 := texto1 + fDMFolha.Monta_Numero('',10);
  //Conta Cliente   Tamanho 6 - 207 a 212
  texto1 := texto1 + fDMFolha.Monta_Numero('',6);
  //Histórico Cliente   Tamanho 3 - 213 a 215
  texto1 := texto1 + fDMFolha.Monta_Numero('',3);
  //Conta Fornecedor   Tamanho 6 - 216 a 221
  texto1 := texto1 + fDMFolha.Monta_Numero('',6);
  //Histórico Cliente   Tamanho 3 - 222 a 224
  texto1 := texto1 + fDMFolha.Monta_Numero('',3);
  //Produto rural    Tamanho 1 - 225 a 225
  texto1 := texto1 + Formatar_Campo('N',1);
  //Identificação Exterior    Tamanho 18 - 226 a 243
  texto1 := texto1 + Formatar_Campo('Brasil',18);
  //Número do endereço    Tamanho 5 - 244 a 248
  if vExiste then
    texto1 := texto1 + fDMFolha.Monta_Numero(copy(fDMFolha.mClienteNumero_End.AsString,1,5),5)
  else
    texto1 := texto1 + fDMFolha.Monta_Numero('',5);
  //Complemento    Tamanho 20 - 249 a 268
  if vExiste then
    texto1 := texto1 + Formatar_Campo(copy(fDMFolha.mClienteComplemento.AsString,1,20),20)
  else
    texto1 := texto1 + Formatar_Campo('',20);
  //Suframa  Tamanho 9 - 269 a 277
  if vExiste then
    texto1 := texto1 + Formatar_Campo(copy(fDMFolha.mClienteSuframa.AsString,1,9),9)
  else
    texto1 := texto1 + Formatar_Campo('',9);
  //Código do Pais  Tamanho 5 - 278 a 282
  texto1 := texto1 + fDMFolha.Monta_Numero('1058',5);
  //Natureza juridica   Tamanho 1 - 283 a 283
  texto1 := texto1 + fDMFolha.Monta_Numero('',1);
  //Municipio IBGE   Tamanho 7 - 284 a 290
  if vExiste then
    texto1 := texto1 + fDMFolha.Monta_Numero(fDMFolha.mClienteCodMunicipioIBGE.AsString,7)
  else
    texto1 := texto1 + fDMFolha.Monta_Numero('',7);
  //Brancos   Tamanho 199 - 291 a 489
  texto1 := texto1 + Formatar_Campo('',199);
  //Uso da EBS   Tamanho 5 - 490 a 494
  texto1 := texto1 + Formatar_Campo('',5);
  //Número do Registro   Tamanho 6 - 495 a 500
  vContador := vContador + 1;
  Texto1    := Texto1 + fDMFolha.Monta_Numero(IntToStr(vContador),6);
  Writeln(txt,texto1);}
end;

procedure TfrmConversor.prc_Montar_Header;
var
  Texto1  : String;
  ano,mes,dia: Word;
begin
{  //Tipo Registro   Tamanho 1 - 1 a 1
  Texto1 := '0';
  //Data de Geração   Tamanho 8 - 2 a 9
  DecodeDate(Date,ano,mes,dia);
  Texto1 := Texto1 + fDMFolha.Monta_Numero(IntToStr(Dia),2);
  Texto1 := Texto1 + fDMFolha.Monta_Numero(IntToStr(Mes),2);
  Texto1 := Texto1 + fDMFolha.Monta_Numero(IntToStr(Ano),4);
  //CNPJ da empresa   Tamanho 18 - 10 a 27
  Texto1 := Texto1 + MaskEdit1.Text;
  //Opção Bases    Tamanho 1 - 28 a 28
  Texto1 := Texto1 + IntToStr(ComboBox2.ItemIndex);
  //Origem     Tamanho 3 - 29 a 31
  Texto1 := Texto1 + Formatar_Campo('',3);
  //Opção Retenção Tamanho 1 - 28 a 28
  Texto1 := Texto1 + '1';
  //Brancos Tamanho 443 - 33 a 474
  Texto1 := Texto1 + Formatar_Campo('',443);
  //Uso  Tamanho 20 - 475 a 494
  Texto1 := Texto1 + Formatar_Campo('',20);
  //Sequência   Tamanho 6 - 495 a 500
  vContador := vContador + 1;
  Texto1    := Texto1 + fDMFolha.Monta_Numero(IntToStr(vContador),6);
  Writeln(txt,texto1);}
end;

procedure TfrmConversor.prc_Montar_NotasFiscais;
var
  texto1, texto2 : String;
begin
{  //Tipo Registro   Tamanho 1 - 1 a 1
  Texto1 := '1';
  //Data Lançamento   Tamanho 8 - 2 a 9
  Texto1 := Texto1 + fDMFolha.Monta_Numero(DateToStr(fDMFolha.mAuxiliarDtEmissao.AsDateTime),8);
  //Número Inicial   Tamanho 6 - 10 a 15
  Texto1 := Texto1 + fDMFolha.Monta_Numero(fDMFolha.mAuxiliarNum_Nota.AsString,6);
  //Número Final   Tamanho 6 - 16 a 21
  Texto1 := Texto1 + fDMFolha.Monta_Numero(fDMFolha.mAuxiliarNum_Nota.AsString,6);
  //Data de Emissão   Tamanho 8 - 22 a 29
  Texto1 := Texto1 + fDMFolha.Monta_Numero(fDMFolha.mAuxiliarDtEmissao.AsString,8);
  //Brancos   Tamanho 3 - 30 a 32
  Texto1 := Texto1 + Formatar_Campo('',3);
  //Modelo   Tamanho 2 - 33 a 34
  Texto1 := Texto1 + fDMFolha.Monta_Numero('01',2);
  //Série   Tamanho 3 - 35 a 37                              
  Texto1 := Texto1 + Formatar_Campo('U',3);
  //Sub-Série   Tamanho 3 - 38 a 40
  Texto1 := Texto1 + Formatar_Campo('',3);
  //Natureza Operação (CFOP)   Tamanho 4 - 41 a 44
  Texto1 := Texto1 + fDMFolha.Monta_Numero(Edit1.Text,4);
  //Variação Natureza Operação (CFOP)   Tamanho 2 - 45 a 46
  Texto1 := Texto1 + fDMFolha.Monta_Numero('',2);
  //Classificação 1 para integração contabil   Tamanho 2 - 47 a 48
  Texto1 := Texto1 + fDMFolha.Monta_Numero('',2);
  //Classificação 2 para integração contabil   Tamanho 2 - 49 a 50
  Texto1 := Texto1 + fDMFolha.Monta_Numero('',2);
  //CNPJ/CPF do destinatário   Tamanho 18 - 51 a 68
  texto2 := fDMFolha.mAuxiliarCNPJ_CPF.AsString;
  texto1 := texto1 + Formatar_Campo(texto2,18);
  //Valor Contábil   Tamanho 12 - 69 a 80
  if trim(fDMFolha.mAuxiliarVlr_Total.AsString) <> '' then
    Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mAuxiliarVlr_Total.AsFloat),12)
  else
    Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base PIS   Tamanho 12 - 81 a 92
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base Cofins   Tamanho 12 - 93 a 104
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base CSLL   Tamanho 12 - 105 a 116
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base IRPJ   Tamanho 12 - 117 a 128
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Brancos  Tamanho 8 - 129 a 136
  Texto1 := Texto1 + Formatar_Campo('',8);
  //Base ICMS A  Tamanho 12 - 137 a 148
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Aliquota ICMS A  Tamanho 4 - 149 a 152
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),4);
  //Valor ICMS A  Tamanho 12 - 153 a 164
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base ICMS B  Tamanho 12 - 165 a 176
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Aliquota ICMS B  Tamanho 4 - 177 a 180
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),4);
  //Valor ICMS B  Tamanho 12 - 181 a 192
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base ICMS C  Tamanho 12 - 193 a 204
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Aliquota ICMS C  Tamanho 4 - 205 a 208
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),4);
  //Valor ICMS C  Tamanho 12 - 209 a 220
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base ICMS D  Tamanho 12 - 221 a 232
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Aliquota ICMS D  Tamanho 4 - 233 a 236
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),4);
  //Valor ICMS D  Tamanho 12 - 237 a 248
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor de isentas de ICMS   Tamanho 12 - 249 a 260
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor de outras de ICMS   Tamanho 12 - 261 a 272
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base IPI   Tamanho 12 - 273 a 284
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor IPI   Tamanho 12 - 285 a 296
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor de isentas de IPI   Tamanho 12 - 297 a 308
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor de outras de IPI   Tamanho 12 - 309 a 320
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor de mercadorias com substituição tributária    Tamanho 12 - 321 a 332
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base da substituição tributária    Tamanho 12 - 333 a 344
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //ICMS da substituição tributária    Tamanho 12 - 345 a 356
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor de mercadorias Diferidas    Tamanho 12 - 357 a 368
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base ISS   Tamanho 12 - 369 a 380
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Aliquota ISS   Tamanho 4 - 381 a 384
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),4);
  //Valor ISS   Tamanho 12 - 385 a 396
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor Isentas ISS   Tamanho 12 - 397 a 408
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor IRRF Retido  Tamanho 12 - 409 a 420
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Observações   Tamanho 50 - 421 a 470
  Texto1 := Texto1 + Formatar_Campo('',50);
  //Espécie  Tamanho 5 - 471 a 475
  Texto1 := Texto1 + Formatar_Campo('NFSE',5);
  //Venda a Vista  Tamanho 1 - 476 a 476
  Texto1 := Texto1 + Formatar_Campo('N',1);
  //Natureza Operação ST (CFOP) Tamanho 4 - 477 a 480
  Texto1 := Texto1 + fDMFolha.Monta_Numero('',4);
  //Base Pis/Cofins ST   Tamanho 8 - 481 a 488
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),8);
  //Modalidade do frete  Tamanho 1 - 489 a 489
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',1);
  //Pis Retido  Tamanho 12 - 490 a 501
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Cofins Retido  Tamanho 12 - 502 a 513
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //CSLL Retido  Tamanho 12 - 514 a 525
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Data de recebimento  Tamanho 8 - 526 a 533
  Texto1 := Texto1 + fDMFolha.Monta_Numero('',8);
  //Operação contábil  Tamanho 4 - 534 a 537
  Texto1 := Texto1 + fDMFolha.Monta_Numero('',4);
  //Valor de materiais na prestação de serviços  Tamanho 12 - 538 a 549
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor de subempreitada  Tamanho 12 - 550 a 561
  Texto1 := Texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Código do serviço  Tamanho 4 - 562 a 565
  Texto1 := Texto1 + fDMFolha.Monta_Numero('',4);
  //CliFor  Tamanho 6 - 566 a 571
  Texto1 := Texto1 + fDMFolha.Monta_Numero('0',6);
  //Identificação Exterior   Tamanho 18 - 572 a 589
  Texto1 := Texto1 + Formatar_Campo('',18);
  //Uso da EBS   Tamanho 5 - 590 a 594
  Texto1 := Texto1 + Formatar_Campo('',5);
  //Sequencia   Tamanho 6 - 595 a 600
  vContador := vContador + 1;
  Texto1    := Texto1 + fDMFolha.Monta_Numero(IntToStr(vContador),6);
  //Número da nota inicial 2   Tamanho 9 - 601 a 609
  Texto1    := Texto1 + fDMFolha.Monta_Numero('0',9);
  //Número da nota final 2   Tamanho 9 - 610 a 618
  Texto1    := Texto1 + fDMFolha.Monta_Numero('0',9);
  //Observação 2     Tamanho 50 - 619 a 669
  Texto1    := Texto1 + Formatar_Campo('',50);
  Writeln(txt,texto1);}
end;

procedure TfrmConversor.prc_Montar_Trailler;
var
  texto1 : String;
begin
{  //Tipo Registro   Tamanho 1 - 1 a 1
  Texto1 := '3';
  //Valor contábil   Tamanho 12 - 2 a 13
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',vVlrContabil),12);
  //Base Pis   Tamanho 12 - 14 a 25
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base Cofins  Tamanho 12 - 26 a 37
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base CSLL  Tamanho 12 - 38 a 49
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base IRPJ  Tamanho 12 - 50 a 61
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Base ICMS A  Tamanho 12 - 62 a 73
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Valor ICMS A  Tamanho 12 - 74 a 85
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Base ICMS B  Tamanho 12 - 86 a 97
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Valor ICMS B  Tamanho 12 - 98 a 109
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Base ICMS C  Tamanho 12 - 110 a 121
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Valor ICMS C  Tamanho 12 - 122 a 133
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Base ICMS D  Tamanho 12 - 134 a 145
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Valor ICMS D  Tamanho 12 - 146 a 157
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Isentas ICMS Tamanho 12 - 158 a 169
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Outras ICMS  Tamanho 12 - 170 a 181
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Base IPI  Tamanho 12 - 182 a 193
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Valor IPI  Tamanho 12 - 194 a 205
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Isentas IPI  Tamanho 12 - 206 a 217
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Outras IPI  Tamanho 12 - 218 a 229
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Mercadorias ST  Tamanho 12 - 230 a 241
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Base ST  Tamanho 12 - 242 a 253
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //ICMS ST  Tamanho 12 - 254 a 265
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Diferidas  Tamanho 12 - 266 a 277
  Texto1 := texto1 + fDMFolha.Monta_Numero('0',12);
  //Base ISS  Tamanho 12 - 278 a 289
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Valor ISS  Tamanho 12 - 290 a 301
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Isentas ISS  Tamanho 12 - 302 a 313
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //IRRF ISS  Tamanho 12 - 314 a 325
  Texto1 := texto1 + fDMFolha.Monta_Numero(FormatFloat('0.00',0),12);
  //Brancos  Tamanho 169 - 326 a 494
  Texto1 := texto1 + Formatar_Campo('',169);
  //Sequência   Tamanho 6 - 495 a 500
  vContador := vContador + 1;
  Texto1    := Texto1 + fDMFolha.Monta_Numero(IntToStr(vContador),6);
  Writeln(txt,texto1);}
end;

function TfrmConversor.Formatar_Campo(Campo: String;
  Tamanho: Integer): String;
var
  i : Integer;
  texto2 : String;
  vAux : Integer;
begin
  if Tamanho <= 0 then
    vAux := Length(Campo)
  else
    vAux := Tamanho;
  Result := '';
  texto2 := Campo;
  for i := 1 to vAux - Length(texto2) do
    texto2 := texto2 + ' ';
  Result := Texto2;
end;

procedure TfrmConversor.prc_Montar_CliFor;
var
  texto1, texto2 : String;
  i : Integer;
begin
  //CNPJ/CPF   Tamanho 18 - 1 a 18
  texto1 := Formatar_Campo(fDMFolha.mClienteCNPJ_CPF.AsString,0);
  for i := 1 to 18 - Length(texto1) do
    texto1 := ' ' + texto1;
  //Razão   Tamanho 40 - 19 a 58
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteRazao.AsString,40);
  //Fantasia   Tamanho 20 - 59 a 78
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteFantasia.AsString,20);
  //Estado   Tamanho 2 - 79 a 80
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteUF.AsString,2);
  //Inscrição Estadual   Tamanho 20 - 81 a 100
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteInscEstadual.AsString,20);
  //Endereço   Tamanho 40 - 101 a 140
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteEndereco.AsString,40);
  //Bairro   Tamanho 20 - 141 a 160
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteBairro.AsString,20);
  //Cidade   Tamanho 20 - 161 a 180
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteCidade.AsString,20);
  //Cep   Tamanho 8 - 181 a 188
  texto1 := Texto1 + fDMFolha.Monta_Numero(fDMFolha.mClienteCep.AsString,8);
  //Municipio   Tamanho 4 - 189 a 192
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteCodMunicipio.AsString),4);
  //DDD   Tamanho 3 - 193 a 195
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteDDD.AsString),3);
  //Fone   Tamanho 10 - 196 a 205
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteFone.AsString),10);
  //Conta Cliente   Tamanho 6 - 206 a 211
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteContaCliente.AsString),6);
  //Historico Cliente   Tamanho 3 - 212 a 214
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteHistoricoCliente.AsString),3);
  //Conta Fornecedor   Tamanho 6 - 215 a 220
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteContaFornecedor.AsString),6);
  //Historico Fornecedor   Tamanho 3 - 221 a 223
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteHistoricoFornecedor.AsString),3);
  //Produtor   Tamanho 1 - 224 a 224
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteProdutor.AsString,1);
  //Identificação Exterior   Tamanho 1 - 225 a 242
  if fDMFolha.mClienteUF.AsString = 'EX' then
    texto1 := Texto1 + Formatar_Campo(fDMFolha.mClientePais.AsString,18)
  else
    texto1 := Texto1 + Formatar_Campo('',18);
  //Número do endereço   Tamanho 5 - 243 a 247
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteNumero_End.AsString),5);
  //Complemento   Tamanho 20 - 248 a 267
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteComplemento.AsString,20);
  //Suframa   Tamanho 9 - 268 a 276
  texto1 := Texto1 + Formatar_Campo(fDMFolha.mClienteSuframa.AsString,9);
  //Código do Pais   Tamanho 5 - 277 a 281
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteCodPais.AsString),5);
  //natureza Juridica   Tamanho 1 - 282 a 282
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteNaturezaJuridica.AsString),1);
  //Código do Município IBGE   Tamanho 7 - 283 a 289
  texto1 := Texto1 + fDMFolha.Monta_Numero(trim(fDMFolha.mClienteCodMunicipioIBGE.AsString),7);
  //Uso EBS   Tamanho 5 - 290 a 294
  texto1 := Texto1 + Formatar_Campo('',5);
  vContador := vContador + 1;
  Texto1    := Texto1 + fDMFolha.Monta_Numero(IntToStr(vContador),6);
  Writeln(txt,texto1);
end;

function TfrmConversor.CharEspeciais(Texto: String): String;
var
  i,t:integer;
begin
  Result := '';
  t:=length(texto);
  i:=1;
  While i <= t do
  begin
   if texto[i] in ['1'..'9','a'..'z','A'..'Z'] Then
     result:=result+Texto[i];
   i:=i+1;
  end;
end;

procedure TfrmConversor.prc_Gravar_mAuxiliar(Nome_Conta, Valor: String);
var
  vAux : String;
begin
  if fDMFolha.mAuxiliar.Locate('Nome_Conta',Nome_Conta,[loCaseInsensitive]) then
    fDMFolha.mAuxiliar.Edit
  else
  begin
    fDMFolha.mAuxiliar.Insert;
    fDMFolha.mAuxiliarCod_Fornecedor.Clear;
    fDMFolha.mAuxiliarNome_Fornecedor.Clear;
    fDMFolha.mAuxiliarNome_Conta.AsString := Nome_Conta;
    fDMFolha.mAuxiliarValor.AsFloat       := 0;
    vAux := Nome_Conta;
    if Nome_Conta = 'TOTAL LIQUIDO' then
      vAux := 'LIQ';
    if fDMFolha.mForn.Locate('Tipo',vAux,[loCaseInsensitive]) then
    begin
      fDMFolha.mAuxiliarCod_Fornecedor.AsInteger := fDMFolha.mFornCodigo.AsInteger;
      fDMFolha.mAuxiliarNome_Fornecedor.AsString := fDMFolha.mFornNome.AsString;
    end;
    fDMFolha.mAuxiliarNumero_Doc.AsString := vAux;
  end;
  fDMFolha.mAuxiliarValor.AsFloat := fDMFolha.mAuxiliarValor.AsFloat + StrToFloat(FormatFloat('0.00',StrToFloat(Valor)));
  fDMFolha.mAuxiliar.Post;
end;

procedure TfrmConversor.FormShow(Sender: TObject);
begin
  prc_Monta_mForn;
  prc_Carrega_Campo;
  if trim(fDMFolha.vPlanoContas) <> '' then
    fDMFolha.prc_Le_PlanoTxt(fDMFolha.vPlanoContas);
  if trim(fDMFolha.vArqHistorico) <> '' then
    fDMFolha.prc_Le_HistoricoTxt(fDMFolha.vArqHistorico);
end;

procedure TfrmConversor.prc_Monta_mForn;
var
  vArq : String;
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Fornecedores.txt';
  if not FileExists(vArq) then
    exit;
  vStrArq := TStringList.Create;
  try
    vStrArq.LoadFromFile(vArq);
    for i := 0 to vStrArq.Count - 1 do
    begin
      vRegistro := vStrArq[i];
      vTexto := fDMFolha.Monta_Numero(fDMFolha.fnc_Montar_Campo,0);
      if trim(vTexto) <> '' then
      begin
        fDMFolha.mForn.Insert;
        fDMFolha.mFornCodigo.AsInteger := StrToInt(vTexto);
        vTexto := fDMFolha.fnc_Montar_Campo;
        fDMFolha.mFornNome.AsString := vTexto;
        vTexto := fDMFolha.fnc_Montar_Campo;
        fDMFolha.mFornCNPJ_CPF.AsString := vTexto;
        vTexto := fDMFolha.fnc_Montar_Campo;
        fDMFolha.mFornTipo.AsString := vTexto;
        fDMFolha.mForn.Post;
      end;
    end;
  finally
    FreeAndNil(vStrArq);
  end;
end;

procedure TfrmConversor.btnGravar_FornClick(Sender: TObject);
var
  vArq : String;
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Fornecedores.txt';
  vStrArq := TStringList.Create;
  try
    fDMFolha.mForn.First;
    while not fDMFolha.mForn.Eof do
    begin
      vTexto := fDMFolha.mFornCodigo.AsString + ';';;
      vTexto := vTexto + fDMFolha.mFornNome.AsString + ';';
      vTexto := vTexto + fDMFolha.mFornCNPJ_CPF.AsString + ';';
      vTexto := vTexto + fDMFolha.mFornTipo.AsString;
      vStrArq.Add(vTexto);
      fDMFolha.mForn.Next;
    end;
    vStrArq.SaveToFile(vArq);

    MessageDlg('Arquivo ' + vArq + ', Gravado!' , mtInformation, [mbOk], 0);
  finally
    FreeAndNil(vStrArq);
  end;

end;

procedure TfrmConversor.prc_Salvar_Arq_Siagri;
var
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
begin
  vStrArq := TStringList.Create;
  try
    fDMFolha.mAuxiliar.First;
    while not fDMFolha.mAuxiliar.Eof do
    begin
      vStrArq.Add(fnc_Cab);
      vStrArq.Add(fnc_Parcelas);
      vStrArq.Add(fnc_Contabilidade);
      vStrArq.Add(fnc_CCusto);
      vStrArq.Add(fnc_Correntista);
      fDMFolha.mAuxiliar.Next;
    end;
    vStrArq.SaveToFile(vArquivo);
  finally
    FreeAndNil(vStrArq);
  end;

end;

function TfrmConversor.fnc_Cab: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'CAB';
  vTexto := vTexto + fDMFolha.Monta_Numero(CurrencyEdit1.Text,3);
  vTexto := vTexto + fDMFolha.Monta_Numero('0',9);
  vTexto := vTexto + 'D';
  vTexto := vTexto + fDMFolha.Monta_Numero(edtCNPJ.Text,14);
  vTexto := vTexto + fDMFolha.Monta_Texto(fDMFolha.mAuxiliarNumero_Doc.AsString,10);
  vTexto := vTexto + fDMFolha.mAuxiliarData.AsString;
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mAuxiliarValor.AsFloat),16);
  vTexto := vTexto + fDMFolha.Monta_Numero('0',9);
  vTexto := vTexto + fDMFolha.Monta_Numero('0',9);
  vTexto := vTexto + fDMFolha.Monta_Numero('0',10);
  vTexto := vTexto + fDMFolha.Monta_Numero('0',10);
  Result := vTexto;
end;

function TfrmConversor.fnc_Parcelas: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'PAR';
  vTexto := vTexto + '001';
  vTexto := vTexto + fDMFolha.mAuxiliarDATA_VECTO.AsString;
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mAuxiliarValor.AsFloat),16);
  vTexto := vTexto + fDMFolha.Monta_Numero(fDMFolha.mAuxiliarCod_Fornecedor.AsString,9);
  vTexto := vTexto + fDMFolha.Monta_Numero('0',9);
  vTexto := vTexto + 'S';
  vTexto := vTexto + '0000000000';
  vTexto := vTexto + '00000'; //Juros até o vencimento
  vTexto := vTexto + '00000'; //Juros após o vencimento
  vTexto := vTexto + '00000'; //Multa
  vTexto := vTexto + '00000'; //Desconto por antecipação
  vTexto := vTexto + '00000'; //Desconto por pontualidade
  vTexto := vTexto + ' '; //Tipo do Desconto
  vTexto := vTexto + fDMFolha.Monta_Texto('',250); //Histórico
  Result := vTexto;
end;

function TfrmConversor.fnc_Contabilidade: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'CON';
  vTexto := vTexto + fDMFolha.Monta_Numero(CurrencyEdit1.Text,3);
  vTexto := vTexto + fDMFolha.Monta_Numero('0',12); //Conta Contábil
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mAuxiliarValor.AsFloat),16); //Valor do lançamento
  vTexto := vTexto + 'C'; //Sinal do lançamento
  vTexto := vTexto + fDMFolha.Monta_Numero('0',9); //Id do histórico
  vTexto := vTexto + fDMFolha.Monta_Texto('',250); //Histórico
  Result := vTexto;
end;

function TfrmConversor.fnc_CCusto: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'CUS';
  vTexto := vTexto + fDMFolha.Monta_Texto('',12);
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mAuxiliarValor.AsFloat),16); //Valor do lançamento
  Result := vTexto;
end;

function TfrmConversor.fnc_Correntista: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'COR';
  vTexto := vTexto + fDMFolha.Monta_Numero(edtCNPJ.Text,14);
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mAuxiliarValor.AsFloat),16); //Valor do lançamento
  Result := vTexto;
end;

procedure TfrmConversor.btnLeLancContabilClick(Sender: TObject);
var
  vArq : String;
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
  vHistorico : String;
  vItem : Integer;
begin
  vVlrContabil := 0;
  fDMFolha.mContabil.EmptyDataSet;
  vArq := fnc_verifica_Arquivo(FilenameEdit2.Text,'L');
  if not FileExists(vArq) then
    exit;
  vStrArq := TStringList.Create;
  try
    vStrArq.LoadFromFile(vArq);
    vItem := 0;
    for i := 0 to vStrArq.Count - 1 do
    begin
      vRegistro      := vStrArq[i];
      if copy(vRegistro,1,1) = 'C' then
      begin
        vTexto         := copy(vRegistro,3,2) + '/' + copy(vRegistro,5,2) + '/' + copy(vRegistro,7,4);
        DateEdit1.Text := vTexto;
      end
      else
      begin
        if copy(vRegistro,1,1) = 'L' then
        begin
          vHistorico := '';
          if fDMFolha.mContabil.State in [dsInsert] then
            fDMFolha.mContabil.Post;
          fDMFolha.mContabil.Insert;
          vItem := vItem + 1;
          fDMFolha.mContabilItem.AsInteger := vItem;
          fDMFolha.mContabilCod_Empresa_Siagri.AsInteger := CurrencyEdit2.AsInteger;
          vTexto := fDMFolha.Monta_Numero(copy(vRegistro,192,6),6);
          if vTexto <> '000000' then
            fDMFolha.mContabilCod_CCusto.AsInteger := StrToInt(vTexto)
          else
          begin
            vTexto := fDMFolha.Monta_Numero(copy(vRegistro,65,3),3);
            if vTexto <> '000' then
              fDMFolha.mContabilCod_CCusto.AsInteger := StrToInt(vTexto)
            else
              fDMFolha.mContabilCod_CCusto.AsInteger := 0;
          end;
          vTexto := fDMFolha.Monta_Numero(copy(vRegistro,10,6),0);
          if vTexto <> '000000' then
            fDMFolha.mContabilSinal_Lancamento.AsString := 'D'
          else
          begin
            fDMFolha.mContabilSinal_Lancamento.AsString := 'C';
            vTexto := fDMFolha.Monta_Numero(copy(vRegistro,16,6),0);
          end;
          //if copy(vTexto,1,1) = '0' then
          //  vTexto := copy(vTexto,2,5);
          if fDMFolha.mPlano.Locate('CodRed',vTexto,[loCaseInsensitive]) then
            fDMFolha.mContabilCod_Conta.AsString := fDMFolha.mPlanoCodPlano.AsString
          else
            fDMFolha.mContabilCod_Conta.AsInteger := StrToInt(vTexto);
          vTexto := copy(vRegistro,50,13) + ',' + copy(vRegistro,63,2);
          fDMFolha.mContabilVlr_Lancamento.AsFloat := StrToFloat(vTexto);
          vVlrContabil := vVlrContabil + fDMFolha.mContabilVlr_Lancamento.AsFloat;
          vTexto := fDMFolha.Monta_Numero(copy(vRegistro,22,3),3);
          fDMFolha.mContabilID_Historico.AsInteger := StrToInt(vTexto);
          vTexto := copy(vRegistro,25,25);
          if trim(vTexto) <> '' then
            vHistorico := TrimRight(vTexto);
          fDMFolha.mContabilVlr_CCusto.AsFloat        := fDMFolha.mContabilVlr_Lancamento.AsFloat;
          fDMFolha.mContabilVlr_Correntista.AsFloat   := fDMFolha.mContabilVlr_Lancamento.AsFloat;
          fDMFolha.mContabilCNPJ_Correntista.AsString := '05625220000124';
        end;
        if copy(vRegistro,1,1) = 'H' then
        begin
          vTexto := copy(vRegistro,2,50);
          if trim(vTexto) <> '' then
            vHistorico := vHistorico + ' ' + TrimRight(vTexto);
          vTexto := TrimRight(vTexto);
          if fDMFolha.mHistorico.Locate('Nome',vTexto,[loCaseInsensitive]) then
            fDMFolha.mContabilID_Historico.AsInteger := fDMFolha.mHistoricoCodigo.AsInteger;
          vHistorico := TrimLeft(vHistorico);
          fDMFolha.mContabilComplemento_Hist.AsString := vHistorico;
          fDMFolha.mContabil.Post;
        end;
      end;
    end;
    if fDMFolha.mContabil.State in [dsInsert] then
      fDMFolha.mContabil.Post;
  finally
    FreeAndNil(vStrArq);
  end;
end;

procedure TfrmConversor.btnSalvarArqContabilClick(Sender: TObject);
begin
  if trim(edtDiretorioContabil.Text) = '' then
  begin
    MessageDlg('Pasta para salvar o arquivo não informada!', mtError, [mbOk], 0);
    edtDiretorioContabil.SetFocus;
    exit;
  end;
  if trim(edtNomeArqCont.Text) = '' then
  begin
    MessageDlg('Nome do arquivo não informado!', mtError, [mbOk], 0);
    edtNomeArqCont.SetFocus;
    exit;
  end;

  vContador    := 0;
  vVlrContabil := 0;
  vRegistro    := '';
  vArquivo   := edtDiretorioContabil.Text;
  if Copy(vArquivo,(Length(vArquivo)),1) <> '\' then
    vArquivo := vArquivo + '\';
  vArquivo := vArquivo + edtNomeArqCont.Text;

  prc_Salvar_Arq_Siagri_Contabil;

  MessageDlg(vArquivo + ', Gerado!' , mtConfirmation, [mbOk], 0);

end;

procedure TfrmConversor.prc_Salvar_Arq_Siagri_Contabil;
var
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
begin
  vStrArq := TStringList.Create;
  try
    fDMFolha.mContabil.First;
    vStrArq.Add(fnc_Cab2);
    while not fDMFolha.mContabil.Eof do
    begin
      vStrArq.Add(fnc_Contabilidade2);
      vStrArq.Add(fnc_CCusto2);
      vStrArq.Add(fnc_Correntista2);
      
      fDMFolha.mContabil.Next;
    end;
    vStrArq.SaveToFile(vArquivo);
  finally
    FreeAndNil(vStrArq);
  end;

end;

function TfrmConversor.fnc_Cab2: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'FOL';
  vTexto := vTexto + fDMFolha.Monta_Numero(CurrencyEdit2.Text,3);
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',vVlrContabil),16); //Valor do lançamento
  vTexto := vTexto + DateEdit1.Text;
  Result := vTexto;
end;

function TfrmConversor.fnc_Contabilidade2: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'CON';
  vTexto := vTexto + fDMFolha.Monta_Numero(CurrencyEdit2.Text,3);
  vTexto := vTexto + fDMFolha.Monta_Texto(fDMFolha.mContabilCod_Conta.AsString,12); //Conta Contábil
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mContabilVlr_Lancamento.AsFloat),16); //Valor do lançamento
  vTexto := vTexto + fDMFolha.mContabilSinal_Lancamento.AsString; //Sinal do lançamento
  vTexto := vTexto + fDMFolha.Monta_Numero(fDMFolha.mContabilID_Historico.AsString,9); //Id do histórico
  vTexto := vTexto + fDMFolha.Monta_Texto(fDMFolha.mContabilComplemento_Hist.AsString,250); //Histórico
  Result := vTexto;
end;

function TfrmConversor.fnc_CCusto2: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'CUS';
  vTexto := vTexto + fDMFolha.Monta_Texto(fDMFolha.mContabilCod_CCusto.AsString,12);
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mContabilVlr_CCusto.AsFloat),16); //Valor do lançamento
  Result := vTexto;
end;

function TfrmConversor.fnc_Correntista2: String;
var
  vTexto : String;
begin
  Result := '';
  vTexto := '';
  vTexto := 'COR';
  vTexto := vTexto + fDMFolha.Monta_Numero(fDMFolha.mContabilCNPJ_Correntista.Text,14);
  vTexto := vTexto + fDMFolha.Monta_Numero(FormatFloat('0.00',fDMFolha.mContabilVlr_Correntista.AsFloat),16); //Valor do lançamento
  Result := vTexto;
end;

procedure TfrmConversor.btnConfiguracaoClick(Sender: TObject);
begin
  frmConfiguracao := TfrmConfiguracao.Create(self);
  frmConfiguracao.fDMFolha := fDMFolha;
  frmConfiguracao.ShowModal;
  FreeAndNil(frmConfiguracao);
  prc_Carrega_Campo;
end;

procedure TfrmConversor.prc_Carrega_Campo;
begin
  FilenameEdit2.Text := fDMFolha.vArqContabilSage;
  edtDiretorioContabil.Text := fDMFolha.vPastaSalvarArq;
  if trim(fDMFolha.vCodEmpresa) <> '' then
  begin
    CurrencyEdit2.Text := fDMFolha.vCodEmpresa;
    CurrencyEdit1.Text := fDMFolha.vCodEmpresa;
  end;
  edtNomeArqCont.Text := fDMFolha.vNomeArqCont;
  Edit2.Text          := fDMFolha.vCNPJParceiro;
  edtCNPJ.Text        := fDMFolha.vCNPJParceiro;
end;

procedure TfrmConversor.btnGravarClick(Sender: TObject);
begin
  if trim(fDMFolha.vPlanoContas) <> '' then
    fDMFolha.prc_Gravar_PlanoTxt(fDMFolha.vPlanoContas);
end;

end.
