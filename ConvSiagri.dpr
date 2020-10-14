program ConvSiagri;

uses
  Forms,
  UConversor in 'UConversor.pas' {frmConversor},
  DmdDatabase_EBS in 'DmdDatabase_EBS.pas' {dmDatabase_EBS: TDataModule},
  UDMFolha in 'UDMFolha.pas' {DMFolha: TDataModule},
  rsDBUtils in '..\..\rslib\nova\rsDBUtils.pas',
  UConfiguracao in 'UConfiguracao.pas' {frmConfiguracao},
  ULePlanoContas in 'ULePlanoContas.pas' {frmLePlanoContas},
  ULeHistorico in 'ULeHistorico.pas' {frmLeHistorico};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ConvSiagri';
  Application.CreateForm(TdmDatabase_EBS, dmDatabase_EBS);
  Application.CreateForm(TfrmConversor, frmConversor);
  Application.Run;
end.
