object DMFolha: TDMFolha
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 257
  Top = 159
  Height = 525
  Width = 796
  object sdsCliForG: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT [cd_clifor]'#13#10'      ,[razao]'#13#10'      ,[fantasia]'#13#10'      ,[c' +
      'gc_cpf]'#13#10'      ,[inscricao_est]'#13#10'      ,[estado]'#13#10'      ,[cd_mun' +
      'icipio]'#13#10'      ,[endereco]'#13#10'      ,[bairro]'#13#10'      ,[cidade]'#13#10'  ' +
      '    ,[cep]'#13#10'      ,[produtor_rural]'#13#10'      ,[ddd]'#13#10'      ,[telef' +
      'one]'#13#10'      ,[inscricao_mun]'#13#10'      ,[status]'#13#10'      ,[opcao_pla' +
      'no]'#13#10'      ,[identificacao_exterior]'#13#10'      ,[cd_pais]'#13#10'      ,[' +
      'suframa]'#13#10'      ,[numero]'#13#10'      ,[complemento]'#13#10'      ,[nat_jur' +
      'idica]'#13#10'      ,[opcao_simples_nacional]'#13#10'      ,[cooperativa_tra' +
      'balho]'#13#10'  FROM[dbo].[CliForG]'#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase_EBS.Conexao_MSSQL
    Left = 80
    Top = 40
    object sdsCliForGcd_clifor: TIntegerField
      FieldName = 'cd_clifor'
      Required = True
    end
    object sdsCliForGrazao: TStringField
      FieldName = 'razao'
      FixedChar = True
      Size = 40
    end
    object sdsCliForGfantasia: TStringField
      FieldName = 'fantasia'
      FixedChar = True
    end
    object sdsCliForGcgc_cpf: TStringField
      FieldName = 'cgc_cpf'
      FixedChar = True
      Size = 18
    end
    object sdsCliForGinscricao_est: TStringField
      FieldName = 'inscricao_est'
      FixedChar = True
    end
    object sdsCliForGestado: TStringField
      FieldName = 'estado'
      FixedChar = True
      Size = 2
    end
    object sdsCliForGcd_municipio: TIntegerField
      FieldName = 'cd_municipio'
    end
    object sdsCliForGendereco: TStringField
      FieldName = 'endereco'
      FixedChar = True
      Size = 40
    end
    object sdsCliForGbairro: TStringField
      FieldName = 'bairro'
      FixedChar = True
    end
    object sdsCliForGcidade: TStringField
      FieldName = 'cidade'
      FixedChar = True
      Size = 40
    end
    object sdsCliForGcep: TIntegerField
      FieldName = 'cep'
    end
    object sdsCliForGprodutor_rural: TStringField
      FieldName = 'produtor_rural'
      FixedChar = True
      Size = 1
    end
    object sdsCliForGddd: TSmallintField
      FieldName = 'ddd'
    end
    object sdsCliForGtelefone: TStringField
      FieldName = 'telefone'
      FixedChar = True
      Size = 10
    end
    object sdsCliForGinscricao_mun: TStringField
      FieldName = 'inscricao_mun'
      FixedChar = True
    end
    object sdsCliForGstatus: TStringField
      FieldName = 'status'
      FixedChar = True
      Size = 1
    end
    object sdsCliForGopcao_plano: TStringField
      FieldName = 'opcao_plano'
      FixedChar = True
      Size = 1
    end
    object sdsCliForGidentificacao_exterior: TStringField
      FieldName = 'identificacao_exterior'
      FixedChar = True
      Size = 18
    end
    object sdsCliForGcd_pais: TIntegerField
      FieldName = 'cd_pais'
    end
    object sdsCliForGsuframa: TStringField
      FieldName = 'suframa'
      FixedChar = True
      Size = 9
    end
    object sdsCliForGnumero: TIntegerField
      FieldName = 'numero'
    end
    object sdsCliForGcomplemento: TStringField
      FieldName = 'complemento'
      FixedChar = True
    end
    object sdsCliForGnat_juridica: TIntegerField
      FieldName = 'nat_juridica'
    end
    object sdsCliForGopcao_simples_nacional: TIntegerField
      FieldName = 'opcao_simples_nacional'
    end
    object sdsCliForGcooperativa_trabalho: TStringField
      FieldName = 'cooperativa_trabalho'
      FixedChar = True
      Size = 1
    end
  end
  object dspCliForG: TDataSetProvider
    DataSet = sdsCliForG
    Left = 136
    Top = 40
  end
  object cdsCliForG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliForG'
    Left = 192
    Top = 40
    object cdsCliForGcd_clifor: TIntegerField
      FieldName = 'cd_clifor'
      Required = True
    end
    object cdsCliForGrazao: TStringField
      FieldName = 'razao'
      FixedChar = True
      Size = 40
    end
    object cdsCliForGfantasia: TStringField
      FieldName = 'fantasia'
      FixedChar = True
    end
    object cdsCliForGcgc_cpf: TStringField
      FieldName = 'cgc_cpf'
      FixedChar = True
      Size = 18
    end
    object cdsCliForGinscricao_est: TStringField
      FieldName = 'inscricao_est'
      FixedChar = True
    end
    object cdsCliForGestado: TStringField
      FieldName = 'estado'
      FixedChar = True
      Size = 2
    end
    object cdsCliForGcd_municipio: TIntegerField
      FieldName = 'cd_municipio'
    end
    object cdsCliForGendereco: TStringField
      FieldName = 'endereco'
      FixedChar = True
      Size = 40
    end
    object cdsCliForGbairro: TStringField
      FieldName = 'bairro'
      FixedChar = True
    end
    object cdsCliForGcidade: TStringField
      FieldName = 'cidade'
      FixedChar = True
      Size = 40
    end
    object cdsCliForGcep: TIntegerField
      FieldName = 'cep'
    end
    object cdsCliForGprodutor_rural: TStringField
      FieldName = 'produtor_rural'
      FixedChar = True
      Size = 1
    end
    object cdsCliForGddd: TSmallintField
      FieldName = 'ddd'
    end
    object cdsCliForGtelefone: TStringField
      FieldName = 'telefone'
      FixedChar = True
      Size = 10
    end
    object cdsCliForGinscricao_mun: TStringField
      FieldName = 'inscricao_mun'
      FixedChar = True
    end
    object cdsCliForGstatus: TStringField
      FieldName = 'status'
      FixedChar = True
      Size = 1
    end
    object cdsCliForGopcao_plano: TStringField
      FieldName = 'opcao_plano'
      FixedChar = True
      Size = 1
    end
    object cdsCliForGidentificacao_exterior: TStringField
      FieldName = 'identificacao_exterior'
      FixedChar = True
      Size = 18
    end
    object cdsCliForGcd_pais: TIntegerField
      FieldName = 'cd_pais'
    end
    object cdsCliForGsuframa: TStringField
      FieldName = 'suframa'
      FixedChar = True
      Size = 9
    end
    object cdsCliForGnumero: TIntegerField
      FieldName = 'numero'
    end
    object cdsCliForGcomplemento: TStringField
      FieldName = 'complemento'
      FixedChar = True
    end
    object cdsCliForGnat_juridica: TIntegerField
      FieldName = 'nat_juridica'
    end
    object cdsCliForGopcao_simples_nacional: TIntegerField
      FieldName = 'opcao_simples_nacional'
    end
    object cdsCliForGcooperativa_trabalho: TStringField
      FieldName = 'cooperativa_trabalho'
      FixedChar = True
      Size = 1
    end
  end
  object dsCliForG: TDataSource
    DataSet = cdsCliForG
    Left = 256
    Top = 40
  end
  object mAuxiliar: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cod_Fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Fornecedor'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Nome_Conta'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end
      item
        Name = 'OBS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'Numero_Doc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'DATA_VECTO'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 497
    Top = 128
    Data = {
      EC0000009619E0BD010000001800000008000000000003000000EC000E436F64
      5F466F726E656365646F7204000100000000000F4E6F6D655F466F726E656365
      646F720100490000000100055749445448020002003C000A4E6F6D655F436F6E
      746101004900000001000557494454480200020028000556616C6F7208000400
      00000000034F425304004B000000020007535542545950450200490005005465
      7874000557494454480200020001000A4E756D65726F5F446F63010049000000
      0100055749445448020002000A00044461746104000600000000000A44415441
      5F564543544F04000600000000000000}
    object mAuxiliarCod_Fornecedor: TIntegerField
      FieldName = 'Cod_Fornecedor'
    end
    object mAuxiliarNome_Fornecedor: TStringField
      FieldName = 'Nome_Fornecedor'
      Size = 60
    end
    object mAuxiliarNome_Conta: TStringField
      FieldName = 'Nome_Conta'
      Size = 40
    end
    object mAuxiliarValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '###,###,##0.00'
    end
    object mAuxiliarOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object mAuxiliarNumero_Doc: TStringField
      FieldName = 'Numero_Doc'
      Size = 10
    end
    object mAuxiliarData: TDateField
      FieldName = 'Data'
    end
    object mAuxiliarDATA_VECTO: TDateField
      FieldName = 'DATA_VECTO'
    end
  end
  object dsmAuxiliar: TDataSource
    DataSet = mAuxiliar
    Left = 520
    Top = 128
  end
  object mCliente: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CNPJ_CPF'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Razao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Fantasia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'InscEstadual'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodMunicipio'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DDD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Fone'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ContaCliente'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'HistoricoCliente'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ContaFornecedor'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'HistoricoFornecedor'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Produtor'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Numero_End'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Complemento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Suframa'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CodPais'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NaturezaJuridica'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CodMunicipioIBGE'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'Pessoa'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 489
    Top = 200
    Data = {
      070300009619E0BD010000001800000019000000000003000000070308434E50
      4A5F43504601004900000001000557494454480200020012000552617A616F01
      004900000001000557494454480200020028000846616E746173696101004900
      0000010005574944544802000200140002554601004900000001000557494454
      480200020002000C496E7363457374616475616C010049000000010005574944
      544802000200140008456E64657265636F010049000000010005574944544802
      00020028000642616972726F0100490000000100055749445448020002001400
      0643696461646501004900000001000557494454480200020014000343657001
      004900000001000557494454480200020008000C436F644D756E69636970696F
      0100490000000100055749445448020002000400034444440100490000000100
      05574944544802000200040004466F6E65010049000000010005574944544802
      0002000A000C436F6E7461436C69656E74650100490000000100055749445448
      02000200060010486973746F7269636F436C69656E7465010049000000010005
      57494454480200020003000F436F6E7461466F726E656365646F720100490000
      00010005574944544802000200060013486973746F7269636F466F726E656365
      646F7201004900000001000557494454480200020003000850726F6475746F72
      0100490000000100055749445448020002000100045061697301004900000001
      000557494454480200020012000A4E756D65726F5F456E640100490000000100
      0557494454480200020005000B436F6D706C656D656E746F0100490000000100
      0557494454480200020014000753756672616D61010049000000010005574944
      544802000200090007436F645061697301004900000001000557494454480200
      02000500104E61747572657A614A757269646963610100490000000100055749
      44544802000200010010436F644D756E69636970696F49424745010049000000
      010005574944544802000200070006506573736F610100490000000100055749
      4454480200020001000000}
    object mClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object mClienteRazao: TStringField
      FieldName = 'Razao'
      Size = 40
    end
    object mClienteFantasia: TStringField
      FieldName = 'Fantasia'
    end
    object mClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mClienteInscEstadual: TStringField
      FieldName = 'InscEstadual'
    end
    object mClienteEndereco: TStringField
      FieldName = 'Endereco'
      Size = 40
    end
    object mClienteBairro: TStringField
      FieldName = 'Bairro'
    end
    object mClienteCidade: TStringField
      FieldName = 'Cidade'
    end
    object mClienteCep: TStringField
      FieldName = 'Cep'
      Size = 8
    end
    object mClienteCodMunicipio: TStringField
      FieldName = 'CodMunicipio'
      Size = 4
    end
    object mClienteDDD: TStringField
      FieldName = 'DDD'
      Size = 4
    end
    object mClienteFone: TStringField
      FieldName = 'Fone'
      Size = 10
    end
    object mClienteContaCliente: TStringField
      FieldName = 'ContaCliente'
      Size = 6
    end
    object mClienteHistoricoCliente: TStringField
      FieldName = 'HistoricoCliente'
      Size = 3
    end
    object mClienteContaFornecedor: TStringField
      FieldName = 'ContaFornecedor'
      Size = 6
    end
    object mClienteHistoricoFornecedor: TStringField
      FieldName = 'HistoricoFornecedor'
      Size = 3
    end
    object mClienteProdutor: TStringField
      FieldName = 'Produtor'
      Size = 1
    end
    object mClientePais: TStringField
      FieldName = 'Pais'
      Size = 18
    end
    object mClienteNumero_End: TStringField
      FieldName = 'Numero_End'
      Size = 5
    end
    object mClienteComplemento: TStringField
      FieldName = 'Complemento'
    end
    object mClienteSuframa: TStringField
      FieldName = 'Suframa'
      Size = 9
    end
    object mClienteCodPais: TStringField
      FieldName = 'CodPais'
      Size = 5
    end
    object mClienteNaturezaJuridica: TStringField
      FieldName = 'NaturezaJuridica'
      Size = 1
    end
    object mClienteCodMunicipioIBGE: TStringField
      FieldName = 'CodMunicipioIBGE'
      Size = 7
    end
    object mClientePessoa: TStringField
      FieldName = 'Pessoa'
      Size = 1
    end
  end
  object dsmCliente: TDataSource
    DataSet = mCliente
    Left = 512
    Top = 200
  end
  object mForn: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CNPJ_CPF'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 219
    Data = {
      780000009619E0BD010000001800000004000000000003000000780006436F64
      69676F0400010000000000044E6F6D6501004900000001000557494454480200
      02003C0008434E504A5F43504601004900000001000557494454480200020012
      00045469706F01004900000001000557494454480200020005000000}
    object mFornCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object mFornNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object mFornCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object mFornTipo: TStringField
      FieldName = 'Tipo'
      Size = 5
    end
  end
  object dsmForn: TDataSource
    DataSet = mForn
    Left = 329
    Top = 221
  end
  object mContabil: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cod_Empresa_Siagri'
        DataType = ftInteger
      end
      item
        Name = 'Cod_Conta'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Vlr_Lancamento'
        DataType = ftFloat
      end
      item
        Name = 'Sinal_Lancamento'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_Historico'
        DataType = ftInteger
      end
      item
        Name = 'Complemento_Hist'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Cod_CCusto'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Vlr_CCusto'
        DataType = ftFloat
      end
      item
        Name = 'CNPJ_Correntista'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Vlr_Correntista'
        DataType = ftFloat
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'Item'
    Params = <>
    StoreDefs = True
    Left = 525
    Top = 312
    Data = {
      450100009619E0BD01000000180000000B000000000003000000450112436F64
      5F456D70726573615F536961677269040001000000000009436F645F436F6E74
      610100490000000100055749445448020002000C000E566C725F4C616E63616D
      656E746F08000400000000001053696E616C5F4C616E63616D656E746F010049
      00000001000557494454480200020001000C49445F486973746F7269636F0400
      01000000000010436F6D706C656D656E746F5F48697374010049000000010005
      574944544802000200FA000A436F645F43437573746F01004900000001000557
      49445448020002000C000A566C725F43437573746F080004000000000010434E
      504A5F436F7272656E7469737461010049000000010005574944544802000200
      0E000F566C725F436F7272656E74697374610800040000000000044974656D04
      000100000000000000}
    object mContabilCod_Empresa_Siagri: TIntegerField
      FieldName = 'Cod_Empresa_Siagri'
    end
    object mContabilCod_Conta: TStringField
      FieldName = 'Cod_Conta'
      Size = 12
    end
    object mContabilVlr_Lancamento: TFloatField
      FieldName = 'Vlr_Lancamento'
    end
    object mContabilSinal_Lancamento: TStringField
      FieldName = 'Sinal_Lancamento'
      Size = 1
    end
    object mContabilID_Historico: TIntegerField
      FieldName = 'ID_Historico'
    end
    object mContabilComplemento_Hist: TStringField
      FieldName = 'Complemento_Hist'
      Size = 250
    end
    object mContabilCod_CCusto: TStringField
      FieldName = 'Cod_CCusto'
      Size = 12
    end
    object mContabilVlr_CCusto: TFloatField
      FieldName = 'Vlr_CCusto'
    end
    object mContabilCNPJ_Correntista: TStringField
      FieldName = 'CNPJ_Correntista'
      Size = 14
    end
    object mContabilVlr_Correntista: TFloatField
      FieldName = 'Vlr_Correntista'
    end
    object mContabilItem: TIntegerField
      FieldName = 'Item'
    end
  end
  object dsmContabil: TDataSource
    DataSet = mContabil
    Left = 557
    Top = 311
  end
  object mPlano: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodRed'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CodPlano'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NomeConta'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 141
    Top = 171
    Data = {
      700000009619E0BD010000001800000003000000000003000000700006436F64
      526564010049000000010005574944544802000200060008436F64506C616E6F
      0100490000000100055749445448020002001400094E6F6D65436F6E74610100
      490000000100055749445448020002003C000000}
    object mPlanoCodRed: TStringField
      FieldName = 'CodRed'
      Size = 6
    end
    object mPlanoCodPlano: TStringField
      FieldName = 'CodPlano'
    end
    object mPlanoNomeConta: TStringField
      FieldName = 'NomeConta'
      Size = 60
    end
  end
  object dsmPlano: TDataSource
    DataSet = mPlano
    Left = 168
    Top = 171
  end
  object mHistorico: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 138
    Top = 232
    Data = {
      420000009619E0BD010000001800000002000000000003000000420006436F64
      69676F0400010000000000044E6F6D6501004900000001000557494454480200
      0200C8000000}
    object mHistoricoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object mHistoricoNome: TStringField
      FieldName = 'Nome'
      Size = 200
    end
  end
  object dsmHistorico: TDataSource
    DataSet = mHistorico
    Left = 170
    Top = 234
  end
end
