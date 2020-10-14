unit UDMFolha;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Forms, IniFiles, Dialogs;

type
  TDMFolha = class(TDataModule)
    sdsCliForG: TSQLDataSet;
    dspCliForG: TDataSetProvider;
    cdsCliForG: TClientDataSet;
    dsCliForG: TDataSource;
    sdsCliForGcd_clifor: TIntegerField;
    sdsCliForGrazao: TStringField;
    sdsCliForGfantasia: TStringField;
    sdsCliForGcgc_cpf: TStringField;
    sdsCliForGinscricao_est: TStringField;
    sdsCliForGestado: TStringField;
    sdsCliForGcd_municipio: TIntegerField;
    sdsCliForGendereco: TStringField;
    sdsCliForGbairro: TStringField;
    sdsCliForGcidade: TStringField;
    sdsCliForGcep: TIntegerField;
    sdsCliForGprodutor_rural: TStringField;
    sdsCliForGddd: TSmallintField;
    sdsCliForGtelefone: TStringField;
    sdsCliForGinscricao_mun: TStringField;
    sdsCliForGstatus: TStringField;
    sdsCliForGopcao_plano: TStringField;
    sdsCliForGidentificacao_exterior: TStringField;
    sdsCliForGcd_pais: TIntegerField;
    sdsCliForGsuframa: TStringField;
    sdsCliForGnumero: TIntegerField;
    sdsCliForGcomplemento: TStringField;
    sdsCliForGnat_juridica: TIntegerField;
    sdsCliForGopcao_simples_nacional: TIntegerField;
    sdsCliForGcooperativa_trabalho: TStringField;
    cdsCliForGcd_clifor: TIntegerField;
    cdsCliForGrazao: TStringField;
    cdsCliForGfantasia: TStringField;
    cdsCliForGcgc_cpf: TStringField;
    cdsCliForGinscricao_est: TStringField;
    cdsCliForGestado: TStringField;
    cdsCliForGcd_municipio: TIntegerField;
    cdsCliForGendereco: TStringField;
    cdsCliForGbairro: TStringField;
    cdsCliForGcidade: TStringField;
    cdsCliForGcep: TIntegerField;
    cdsCliForGprodutor_rural: TStringField;
    cdsCliForGddd: TSmallintField;
    cdsCliForGtelefone: TStringField;
    cdsCliForGinscricao_mun: TStringField;
    cdsCliForGstatus: TStringField;
    cdsCliForGopcao_plano: TStringField;
    cdsCliForGidentificacao_exterior: TStringField;
    cdsCliForGcd_pais: TIntegerField;
    cdsCliForGsuframa: TStringField;
    cdsCliForGnumero: TIntegerField;
    cdsCliForGcomplemento: TStringField;
    cdsCliForGnat_juridica: TIntegerField;
    cdsCliForGopcao_simples_nacional: TIntegerField;
    cdsCliForGcooperativa_trabalho: TStringField;
    mAuxiliar: TClientDataSet;
    dsmAuxiliar: TDataSource;
    mCliente: TClientDataSet;
    dsmCliente: TDataSource;
    mClienteCNPJ_CPF: TStringField;
    mClienteRazao: TStringField;
    mClienteFantasia: TStringField;
    mClienteUF: TStringField;
    mClienteInscEstadual: TStringField;
    mClienteEndereco: TStringField;
    mClienteBairro: TStringField;
    mClienteCidade: TStringField;
    mClienteCep: TStringField;
    mClienteCodMunicipio: TStringField;
    mClienteFone: TStringField;
    mClienteDDD: TStringField;
    mClienteContaCliente: TStringField;
    mClienteHistoricoCliente: TStringField;
    mClienteContaFornecedor: TStringField;
    mClienteHistoricoFornecedor: TStringField;
    mClienteProdutor: TStringField;
    mClientePais: TStringField;
    mClienteNumero_End: TStringField;
    mClienteComplemento: TStringField;
    mClienteSuframa: TStringField;
    mClienteCodPais: TStringField;
    mClienteNaturezaJuridica: TStringField;
    mClienteCodMunicipioIBGE: TStringField;
    mClientePessoa: TStringField;
    mAuxiliarCod_Fornecedor: TIntegerField;
    mAuxiliarNome_Fornecedor: TStringField;
    mAuxiliarNome_Conta: TStringField;
    mAuxiliarValor: TFloatField;
    mAuxiliarOBS: TMemoField;
    mForn: TClientDataSet;
    mFornCodigo: TIntegerField;
    mFornNome: TStringField;
    mFornCNPJ_CPF: TStringField;
    dsmForn: TDataSource;
    mFornTipo: TStringField;
    mAuxiliarNumero_Doc: TStringField;
    mAuxiliarData: TDateField;
    mAuxiliarDATA_VECTO: TDateField;
    mContabil: TClientDataSet;
    mContabilCod_Empresa_Siagri: TIntegerField;
    mContabilCod_Conta: TStringField;
    mContabilVlr_Lancamento: TFloatField;
    mContabilSinal_Lancamento: TStringField;
    mContabilID_Historico: TIntegerField;
    mContabilComplemento_Hist: TStringField;
    mContabilCod_CCusto: TStringField;
    mContabilVlr_CCusto: TFloatField;
    mContabilCNPJ_Correntista: TStringField;
    mContabilVlr_Correntista: TFloatField;
    dsmContabil: TDataSource;
    mContabilItem: TIntegerField;
    mPlano: TClientDataSet;
    mPlanoCodPlano: TStringField;
    mPlanoNomeConta: TStringField;
    dsmPlano: TDataSource;
    mPlanoCodRed: TStringField;
    mHistorico: TClientDataSet;
    mHistoricoCodigo: TIntegerField;
    mHistoricoNome: TStringField;
    dsmHistorico: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCodEmpresa: String;
    vNomeArqCont: String;
    vCNPJParceiro: String;
    vArqContabilSage: String;
    vPastaSalvarArq: String;
    vPlanoContas: String;
    vArqHistorico: String;
    vRegistro: String;

    function Fnc_ArquivoConfiguracao: string;

    procedure prc_Le_PlanoTxt(Arquivo : String);
    procedure prc_Gravar_PlanoTxt(Arquivo : String);

    procedure prc_Le_HistoricoTxt(Arquivo : String);
    procedure prc_Gravar_HistoricoTxt(Arquivo : String);

    function Monta_Numero(Campo: String; Tamanho: Integer): String;
    function Monta_Texto(Campo: String; Tamanho: Integer): String;
    function fnc_Montar_Campo: String;

  end;

var
  DMFolha: TDMFolha;

const
  cArquivoConfiguracao = 'ArqSiagri.ini';

implementation

uses DmdDatabase_EBS;

{$R *.dfm}

{ TDMFolha }

function TDMFolha.Fnc_ArquivoConfiguracao: string;
begin
  Result := ExtractFilePath(Application.ExeName) + cArquivoConfiguracao;
end;

procedure TDMFolha.DataModuleCreate(Sender: TObject);
var
  vTexto : String;
  ArqIni: TIniFile;
begin
  vTexto := Fnc_ArquivoConfiguracao;
  if not FileExists(Fnc_ArquivoConfiguracao) then
  begin
    MessageDlg(' Arquivo ArqSiagri.ini não encontrado!',mtInformation,[mbOk],0);
    Exit;
  end;

  ArqIni := TIniFile.Create(Fnc_ArquivoConfiguracao);
  try
    vCodEmpresa      := ArqIni.ReadString('Siagri', 'CodEmpresa', '');
    vNomeArqCont     := ArqIni.ReadString('Siagri', 'NomeArqSiagri', '');
    vCNPJParceiro    := ArqIni.ReadString('Siagri', 'CNPJParceiro', '');
    vArqContabilSage := ArqIni.ReadString('Siagri', 'ArqContabilSage', '');
    vPastaSalvarArq  := ArqIni.ReadString('Siagri', 'PastaSalvarArq', '');
    vPlanoContas     := ArqIni.ReadString('Siagri', 'PlanoContas', '');
    vArqHistorico    := ArqIni.ReadString('Siagri', 'ArqHistorico', '');

  finally
    FreeAndNil(ArqIni);
  end;
  
end;

procedure TDMFolha.prc_Le_PlanoTxt(Arquivo: String);
var
  vArq : String;
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
begin
  vArq := Arquivo;
  if not FileExists(vArq) then
  begin
    MessageDlg('Arquivo ' + vArq + '  não encontrado!', mtInformation, [mbOk], 0);
    exit;
  end;
  mPlano.EmptyDataSet;
  vStrArq := TStringList.Create;
  try
    vStrArq.LoadFromFile(vArq);
    for i := 0 to vStrArq.Count - 1 do
    begin
      vRegistro := vStrArq[i];
      vTexto := Monta_Numero(fnc_Montar_Campo,0);
      if trim(vTexto) <> '' then
      begin
        mPlano.Insert;
        mPlanoCodRed.AsString    := vTexto;
        mPlanoCodPlano.AsString  := fnc_Montar_Campo;
        mPlanoNomeConta.AsString := fnc_Montar_Campo;
        mPlano.Post;
      end;
    end;
  finally
    FreeAndNil(vStrArq);
  end;
end;

procedure TDMFolha.prc_Gravar_PlanoTxt(Arquivo: String);
var
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
  vArquivo : String;
begin
  vArquivo := Arquivo;
  vStrArq := TStringList.Create;
  try
    mPlano.First;
    while not mPlano.Eof do
    begin
      vTexto := mPlanoCodRed.AsString + ';';
      vTexto := vTexto + mPlanoCodPlano.AsString + ';';
      vTexto := vTexto + mPlanoNomeConta.AsString;
      vStrArq.Add(vTexto);
      mPlano.Next;
    end;
    vStrArq.SaveToFile(vArquivo);
  finally
    FreeAndNil(vStrArq);
  end;

  MessageDlg('Arquivos ' + vArquivo + '   ... Gerado... !', mtConfirmation, [mbOk], 0);
end;

function TDMFolha.Monta_Numero(Campo: String; Tamanho: Integer): String;
var
  texto2: String;
  i: Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      Texto2 := Texto2 + Copy(Campo,i,1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

function TDMFolha.fnc_Montar_Campo: String;
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

function TDMFolha.Monta_Texto(Campo: String; Tamanho: Integer): String;
var
  texto2: String;
  i: Integer;
begin
  texto2 := Campo;
  for i := 1 to Tamanho - Length(Campo) do
    texto2 := texto2 + ' ';
  Result := texto2;
end;

procedure TDMFolha.prc_Le_HistoricoTxt(Arquivo: String);
var
  vArq : String;
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
begin
  vArq := Arquivo;
  if not FileExists(vArq) then
  begin
    MessageDlg('Arquivo ' + vArq + '  não encontrado!', mtInformation, [mbOk], 0);
    exit;
  end;
  mHistorico.EmptyDataSet;
  vStrArq := TStringList.Create;
  try
    vStrArq.LoadFromFile(vArq);
    for i := 0 to vStrArq.Count - 1 do
    begin
      vRegistro := vStrArq[i];
      vTexto := Monta_Numero(fnc_Montar_Campo,0);
      if trim(vTexto) <> '' then
      begin
        mHistorico.Insert;
        mHistoricoCodigo.AsInteger := StrToInt(vTexto);
        mHistoricoNome.AsString    := fnc_Montar_Campo;
        mHistorico.Post;
      end;
    end;
  finally
    FreeAndNil(vStrArq);
  end;

end;

procedure TDMFolha.prc_Gravar_HistoricoTxt(Arquivo: String);
var
  vStrArq: TStringList;
  i : Integer;
  vTexto : String;
  vArquivo : String;
begin
  vArquivo := Arquivo;
  vStrArq := TStringList.Create;
  try
    mHistorico.First;
    while not mHistorico.Eof do
    begin
      vTexto := mHistoricoCodigo.AsString + ';';
      vTexto := vTexto + mHistoricoNome.AsString;
      vStrArq.Add(vTexto);
      mHistorico.Next;
    end;
    vStrArq.SaveToFile(vArquivo);
  finally
    FreeAndNil(vStrArq);
  end;

  MessageDlg('Arquivos ' + vArquivo + '   ... Gerado... !', mtConfirmation, [mbOk], 0);
end;

end.
