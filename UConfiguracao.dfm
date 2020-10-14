object frmConfiguracao: TfrmConfiguracao
  Left = 321
  Top = 215
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmConfiguracao'
  ClientHeight = 220
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 39
    Top = 33
    Width = 141
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'd. Empresa no Siagri:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 57
    Top = 51
    Width = 123
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nome Arquivo Siagri:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 74
    Top = 69
    Width = 106
    Height = 13
    Alignment = taRightJustify
    Caption = 'CNPJ da Empresa:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 14
    Top = 95
    Width = 215
    Height = 13
    Alignment = taRightJustify
    Caption = 'Arq. Lan'#231'amento Cont'#225'bil Sage (txt):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 78
    Top = 116
    Width = 152
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pasta para salvar arquivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 56
    Top = 135
    Width = 173
    Height = 13
    Alignment = taRightJustify
    Caption = 'Arq. (txt) do Plano de Contas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 100
    Top = 155
    Width = 129
    Height = 13
    Alignment = taRightJustify
    Caption = 'Arq. (txt) do Hist'#243'rico:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 183
    Top = 24
    Width = 83
    Height = 21
    AutoSize = False
    Ctl3D = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object edtNomeArqCont: TEdit
    Left = 183
    Top = 44
    Width = 179
    Height = 19
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 183
    Top = 62
    Width = 179
    Height = 19
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
  end
  object FilenameEdit2: TFilenameEdit
    Left = 232
    Top = 87
    Width = 503
    Height = 21
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
  end
  object edtDiretorioContabil: TDirectoryEdit
    Left = 232
    Top = 107
    Width = 503
    Height = 21
    DialogKind = dkWin32
    InitialDir = 'C:\'
    MultipleDirs = True
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
  end
  object FilenameEdit1: TFilenameEdit
    Left = 232
    Top = 127
    Width = 503
    Height = 21
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
  end
  object NxPanel1: TNxPanel
    Left = 0
    Top = 179
    Width = 747
    Height = 41
    Align = alBottom
    UseDockManager = False
    ParentBackground = False
    TabOrder = 6
    object bhtnConfirmar: TNxButton
      Left = 272
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bhtnConfirmarClick
    end
    object btnFechar: TNxButton
      Left = 371
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object btnLePlano: TNxButton
    Left = 521
    Top = 20
    Width = 202
    Cursor = crHandPoint
    Caption = 'Ler Arq Excel do Plano de Contas'
    TabOrder = 7
    OnClick = btnLePlanoClick
  end
  object btnLeHistorico: TNxButton
    Left = 522
    Top = 44
    Width = 202
    Cursor = crHandPoint
    Caption = 'Ler Arq Excel do Hist'#243'rico'
    TabOrder = 8
    OnClick = btnLeHistoricoClick
  end
  object FilenameEdit3: TFilenameEdit
    Left = 232
    Top = 147
    Width = 503
    Height = 21
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 9
  end
end
