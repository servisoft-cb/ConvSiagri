unit UConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, StdCtrls, Mask, CurrEdit, NxCollection, UDMFolha, IniFiles;

type
  TfrmConfiguracao = class(TForm)
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    edtNomeArqCont: TEdit;
    Edit2: TEdit;
    Label6: TLabel;
    FilenameEdit2: TFilenameEdit;
    edtDiretorioContabil: TDirectoryEdit;
    Label7: TLabel;
    Label1: TLabel;
    FilenameEdit1: TFilenameEdit;
    NxPanel1: TNxPanel;
    bhtnConfirmar: TNxButton;
    btnFechar: TNxButton;
    btnLePlano: TNxButton;
    btnLeHistorico: TNxButton;
    Label2: TLabel;
    FilenameEdit3: TFilenameEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bhtnConfirmarClick(Sender: TObject);
    procedure btnLePlanoClick(Sender: TObject);
    procedure btnLeHistoricoClick(Sender: TObject);
  private
    { Private declarations }

    procedure gravarIni(Tabela, Campo, Valor: String);

  public
    { Public declarations }
    fDMFolha : TDMFolha;

  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

uses rsDBUtils, ULePlanoContas, ULeHistorico;

{$R *.dfm}

procedure TfrmConfiguracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConfiguracao.FormShow(Sender: TObject);
begin
  if trim(fDMFolha.vCodEmpresa) <> '' then
    CurrencyEdit2.Text := fDMFolha.vCodEmpresa;

  edtNomeArqCont.Text       := fDMFolha.vNomeArqCont;
  Edit2.Text                := fDMFolha.vCNPJParceiro;
  FilenameEdit2.Text        := fDMFolha.vArqContabilSage;
  edtDiretorioContabil.Text := fDMFolha.vPastaSalvarArq;
  FilenameEdit1.Text        := fDMFolha.vPlanoContas;
  FilenameEdit3.Text        := fDMFolha.vArqHistorico;

end;

procedure TfrmConfiguracao.gravarIni(Tabela, Campo, Valor: String);
var
  ArqIni: TIniFile;
begin
  try
    ArqIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'ArqSiagri.ini');
    ArqIni.WriteString(Tabela,Campo,Valor);
    ArqIni.UpdateFile;
  finally
    ArqIni.Free;
  end;
end;

procedure TfrmConfiguracao.bhtnConfirmarClick(Sender: TObject);
begin
  fDMFolha.vCodEmpresa      := CurrencyEdit2.Text;
  fDMFolha.vNomeArqCont     := edtNomeArqCont.Text;
  fDMFolha.vCNPJParceiro    := Edit2.Text;
  fDMFolha.vArqContabilSage := FilenameEdit2.Text;
  fDMFolha.vPastaSalvarArq  := edtDiretorioContabil.Text;
  fDMFolha.vPlanoContas     := FilenameEdit1.Text;
  fDMFolha.vArqHistorico    := FilenameEdit3.Text;

  gravarIni('Siagri','CodEmpresa',CurrencyEdit2.Text);
  gravarIni('Siagri','NomeArqSiagri',edtNomeArqCont.Text);
  gravarIni('Siagri','CNPJParceiro',Edit2.Text);
  gravarIni('Siagri','ArqContabilSage',FilenameEdit2.Text);
  gravarIni('Siagri','PastaSalvarArq',edtDiretorioContabil.Text);
  gravarIni('Siagri','PlanoContas',FilenameEdit1.Text);
  gravarIni('Siagri','ArqHistorico',FilenameEdit3.Text);
  Close;
end;

procedure TfrmConfiguracao.btnLePlanoClick(Sender: TObject);
begin
  frmLePlanoContas := TfrmLePlanoContas.Create(self);
  frmLePlanoContas.fDMFolha := fDMFolha;
  frmLePlanoContas.ShowModal;
  FreeAndNil(frmLePlanoContas);
end;

procedure TfrmConfiguracao.btnLeHistoricoClick(Sender: TObject);
begin
  frmLeHistorico := TfrmLeHistorico.Create(self);
  frmLeHistorico.fDMFolha := fDMFolha;
  frmLeHistorico.ShowModal;
  FreeAndNil(frmLeHistorico);
end;

end.
