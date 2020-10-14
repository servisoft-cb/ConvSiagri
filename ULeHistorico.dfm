object frmLeHistorico: TfrmLeHistorico
  Left = 281
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmLeHistorico'
  ClientHeight = 449
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 87
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 77
      Top = 12
      Width = 144
      Height = 13
      Alignment = taRightJustify
      Caption = 'Arq. do Hist'#243'rico (Excel):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 51
      Top = 32
      Width = 170
      Height = 13
      Alignment = taRightJustify
      Caption = 'Salvar Arq. do Hist'#243'rico (txt):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object FilenameEdit1: TFilenameEdit
      Left = 224
      Top = 4
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
      TabOrder = 0
    end
    object btnLeExcel: TNxButton
      Left = 224
      Top = 45
      Width = 108
      Height = 25
      Caption = 'Ler Hist'#243'rico Excel'
      TabOrder = 1
      OnClick = btnLeExcelClick
    end
    object NxButton2: TNxButton
      Left = 442
      Top = 45
      Width = 108
      Height = 25
      Caption = 'Gravar Hist'#243'rico'
      TabOrder = 2
      OnClick = NxButton2Click
    end
    object FilenameEdit2: TFilenameEdit
      Left = 224
      Top = 24
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
    object btnLeTxt: TNxButton
      Left = 333
      Top = 45
      Width = 108
      Height = 25
      Caption = 'Ler Hist'#243'rico txt'
      TabOrder = 4
      OnClick = btnLeTxtClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 87
    Width = 920
    Height = 362
    Align = alClient
    Ctl3D = False
    DataSource = DMFolha.dsmHistorico
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 3
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 629
        Visible = True
      end>
  end
end
