object frmConversor: TfrmConversor
  Left = 80
  Top = 12
  Width = 1239
  Height = 707
  Caption = 'L'#234' Resumo da Folha (13/10/2020) V.5'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 1231
    Height = 676
    ActivePage = TS_PlanoContas
    ActivePageDefault = TS_Contabil
    Align = alClient
    UseColoredTabs = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    FlatColor = clBlue
    ParentFont = False
    TabIndex = 3
    TabOrder = 0
    FixedDimension = 22
    object TS_ResumoFolha: TRzTabSheet
      Caption = 'Resumo da Folha'
      object pnlPrincipal: TAdvPanel
        Left = 0
        Top = 84
        Width = 1227
        Height = 566
        Align = alClient
        BevelWidth = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UseDockManager = True
        Version = '1.6.0.3'
        Caption.Color = clHighlight
        Caption.ColorTo = clNone
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clHighlightText
        Caption.Font.Height = -11
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = []
        Caption.GradientDirection = gdVertical
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = clWindowText
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        FullHeight = 0
        object SMDBGrid2: TSMDBGrid
          Left = 10
          Top = 10
          Width = 1207
          Height = 546
          Align = alClient
          Ctl3D = False
          DataSource = DMFolha.dsmAuxiliar
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 8
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'Cod_Fornecedor'
              Title.Color = 10813439
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome_Fornecedor'
              Title.Color = 10813439
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome_Conta'
              Title.Color = 10813439
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor'
              Title.Color = 10813439
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Numero_Doc'
              Title.Alignment = taCenter
              Title.Caption = 'Ident. Documento'
              Title.Color = 10813439
              Width = 101
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Data'
              Title.Alignment = taCenter
              Title.Color = 10813439
              Width = 99
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_VECTO'
              Title.Alignment = taCenter
              Title.Caption = 'Data Vencimento'
              Title.Color = 10813439
              Width = 101
              Visible = True
            end>
        end
      end
      object NxPanel1: TNxPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 84
        Align = alTop
        BorderPen.Style = psClear
        UseDockManager = False
        ParentBackground = False
        TabOrder = 1
        object Label2: TLabel
          Left = 17
          Top = 11
          Width = 213
          Height = 13
          Alignment = taRightJustify
          Caption = 'Arquivo do Resumo da Folha (Excel):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 78
          Top = 32
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
          Left = 816
          Top = 13
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
        object Label3: TLabel
          Left = 834
          Top = 31
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
        object Label5: TLabel
          Left = 851
          Top = 49
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
        object btnSalvarTabela: TNxButton
          Left = 231
          Top = 46
          Width = 189
          Height = 30
          Caption = 'L'#234' Resumo da Folha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060000000FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080
            8080000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF606060808080808080000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080808080808080
            8080000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF6060608080808080808080808080800000000000000000000000000000
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080808080808080808080808080
            8080000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF202020
            4040404040404040406060608080808080800000000000000000000000000000
            00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
            8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
            8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
            8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040808080B0
            B0B0303030000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF404040B0B0B0C0C0C0C0C0C0303030000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060C0C0C0C0
            C0C0C0C0C0C0C0C0303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = btnSalvarTabelaClick
        end
        object btnSalvarEBS: TNxButton
          Left = 423
          Top = 46
          Width = 189
          Height = 30
          Caption = 'Salvar Arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            AE060000424DAE06000000000000360000002800000017000000170000000100
            1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
            224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
            3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
            5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
            4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
            402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
            4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
            4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
            0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
            0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
            04550500550505560707540B065309065008044D06034D050042002F65312860
            2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
            54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
            044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
            0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
            550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
            2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
            C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
            00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
            FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
            002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
            FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
            07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
            DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
            C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
            5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
            FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
            000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
            056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
            022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
            9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
            B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
            8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
            FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
            B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
            2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
            0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
            5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
            299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
            C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
            36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
            4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
            984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
            FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
            7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
            B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
            CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 1
          Transparent = True
          OnClick = btnSalvarEBSClick
        end
        object FilenameEdit1: TFilenameEdit
          Left = 232
          Top = 3
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
          TabOrder = 2
        end
        object edtDiretorio_EBS: TDirectoryEdit
          Left = 232
          Top = 23
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
          TabOrder = 3
        end
        object CurrencyEdit1: TCurrencyEdit
          Left = 963
          Top = 5
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
          TabOrder = 4
        end
        object edtNomeArq: TEdit
          Left = 963
          Top = 25
          Width = 179
          Height = 22
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object edtCNPJ: TEdit
          Left = 963
          Top = 43
          Width = 179
          Height = 22
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
      end
    end
    object TS_Fornecedores: TRzTabSheet
      Caption = 'Fornecedores'
      object AdvPanel1: TAdvPanel
        Left = 0
        Top = 52
        Width = 1227
        Height = 598
        Align = alClient
        BevelWidth = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UseDockManager = True
        Version = '1.6.0.3'
        Caption.Color = clHighlight
        Caption.ColorTo = clNone
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clHighlightText
        Caption.Font.Height = -11
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = []
        Caption.GradientDirection = gdVertical
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = clWindowText
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        FullHeight = 0
        object SMDBGrid1: TSMDBGrid
          Left = 10
          Top = 10
          Width = 1207
          Height = 578
          Align = alClient
          Ctl3D = False
          DataSource = DMFolha.dsmForn
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'Tipo'
              Title.Color = 11337561
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Codigo'
              Title.Color = 11337561
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Title.Color = 11337561
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ_CPF'
              Title.Color = 11337561
              Visible = True
            end>
        end
      end
      object NxPanel2: TNxPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 52
        Align = alTop
        BorderPen.Style = psClear
        UseDockManager = False
        ParentBackground = False
        TabOrder = 1
        object btnGravar_Forn: TNxButton
          Left = 9
          Top = 14
          Width = 389
          Height = 30
          Caption = 'Regravar Arquivo dos Fornecedores'
          Down = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            AE060000424DAE06000000000000360000002800000017000000170000000100
            1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
            224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
            3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
            5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
            4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
            402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
            4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
            4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
            0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
            0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
            04550500550505560707540B065309065008044D06034D050042002F65312860
            2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
            54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
            044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
            0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
            550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
            2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
            C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
            00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
            FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
            002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
            FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
            07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
            DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
            C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
            5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
            FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
            000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
            056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
            022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
            9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
            B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
            8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
            FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
            B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
            2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
            0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
            5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
            299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
            C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
            36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
            4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
            984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
            FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
            7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
            B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
            CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = btnGravar_FornClick
        end
      end
    end
    object TS_Contabil: TRzTabSheet
      Caption = 'Ler Lan'#231'amento Cont'#225'bil'
      object NxPanel3: TNxPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 84
        Align = alTop
        BorderPen.Style = psClear
        UseDockManager = False
        ParentBackground = False
        TabOrder = 0
        object Label6: TLabel
          Left = 14
          Top = 11
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
          Top = 32
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
        object Label8: TLabel
          Left = 776
          Top = 13
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
          Left = 794
          Top = 31
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
          Left = 811
          Top = 49
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
        object Label11: TLabel
          Left = 810
          Top = 67
          Width = 105
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Lan'#231'amento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object btnLeLancContabil: TNxButton
          Left = 231
          Top = 48
          Width = 189
          Height = 30
          Caption = 'L'#234' Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060000000FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080
            8080000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF606060808080808080000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080808080808080
            8080000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF6060608080808080808080808080800000000000000000000000000000
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080808080808080808080808080
            8080000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF202020
            4040404040404040406060608080808080800000000000000000000000000000
            00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
            8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
            8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
            8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040808080B0
            B0B0303030000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF404040B0B0B0C0C0C0C0C0C0303030000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060C0C0C0C0
            C0C0C0C0C0C0C0C0303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = btnLeLancContabilClick
        end
        object btnSalvarArqContabil: TNxButton
          Left = 424
          Top = 48
          Width = 189
          Height = 30
          Caption = 'Salvar Arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            AE060000424DAE06000000000000360000002800000017000000170000000100
            1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
            224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
            3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
            5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
            4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
            402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
            4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
            4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
            0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
            0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
            04550500550505560707540B065309065008044D06034D050042002F65312860
            2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
            54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
            044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
            0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
            550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
            2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
            C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
            00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
            FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
            002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
            FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
            07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
            DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
            C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
            5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
            FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
            000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
            056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
            022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
            9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
            B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
            8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
            FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
            B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
            2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
            0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
            5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
            299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
            C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
            36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
            4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
            984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
            FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
            7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
            B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
            CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 1
          Transparent = True
          OnClick = btnSalvarArqContabilClick
        end
        object FilenameEdit2: TFilenameEdit
          Left = 232
          Top = 3
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
          TabOrder = 2
        end
        object edtDiretorioContabil: TDirectoryEdit
          Left = 232
          Top = 23
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
          TabOrder = 3
        end
        object CurrencyEdit2: TCurrencyEdit
          Left = 923
          Top = 5
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
          TabOrder = 4
        end
        object edtNomeArqCont: TEdit
          Left = 923
          Top = 25
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
          TabOrder = 5
        end
        object Edit2: TEdit
          Left = 923
          Top = 43
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
          TabOrder = 6
        end
        object DateEdit1: TDateEdit
          Left = 923
          Top = 61
          Width = 121
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object btnConfiguracao: TNxButton
          Left = 1150
          Top = 6
          Width = 69
          Height = 57
          Cursor = crHandPoint
          Hint = 'Configura'#231#227'o dos Dados'
          Down = True
          Glyph.Data = {
            460C0000424D460C0000000000003604000028000000300000002B0000000100
            0800000000001008000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFF6F6
            F6F6FFFFFFF6F6F6FFFFFFFFF6F6F6F6FFFFFFF6F6F6F6FFFFFFFFF6FFF6FFFF
            FFFFFFFFF6F6FFFFFFFFFFFFFFFFF6F6F6F6FFFFFFF6F6F6FFFFFFFFF6F6F6F6
            FFFFFFF6F6F6F6FFFFFFFFFF5BF6FFFFFFFFA4A4FFFFFFFFFFFFF6F6F6F6FFFF
            FFF6F6F6F6FFFFFFF6F6F6F6FFFFFFFFF6F6F6FFFFFFFFF6FF9B00000000F7FF
            FFA400000000A4FFF6FFF6F6F6F6FFFFFFF6F6F6F6FFFFFFF6F6F6F6FFFFFFF6
            F6F6F6FFFFFFFFF6F6084900000000ADA40000000000F7FFF6FFF6F6F6F6FFFF
            FFF6F6F6F6FFFFF6F6F6F6F6FFFFFFFFF6F6F6FFFFFFFFF6F6FF9B0000000000
            000000000049FFF6F6FFF6F6F6F6FFFFFFF6F6F6F6FFFFFFF6F6F6F6FFFFFFFF
            F6F6F6FFFFFFFFF6F6F60700000000000000000000FFF6F6F6FFFFFFFFF6F6F6
            F6F6FFFFFFF6FFFFFFFFFFFFFFF6F6F6FFFFFFF6F6F6F6FFFFFF080000000000
            0000000000FFFFFFFFFFFFFFFFFFF6F6F6FFFFFFFFFF070000000000F7FFF6F6
            FFFFFFF6F6F6F6079B0000000007FFFFFFF60000000049F707F6FFFFFFFFF6FF
            FFFFFFFFFFFF070000000000A3FFF6F6FFFFFFFFF6FFF6000000000052F6FFFF
            FFFFA400000000000007F6F6F6F6FF07004907FFF6FF07000000000000FFFFFF
            FF520049FFFFFF00000000009BFFF6F6F6FF0800000000000007F6F6F6FF0752
            000000F7FFFF5A000000000000F7FFFF5B000000ADF6FF00000000005BFFFFF6
            F6FF9B00000000000007F6F6F6F7000000000000524900000000000000005252
            000000000049F60707F75200009BFFFFFF0700000000070707F6F6FFF6000000
            0000000000000000000000000000000000000000000000FFFFFFF70000000007
            9B00000000F6FFFFFFFFFFFFF600000000000000000000000000000000000000
            00000000000000FFFFFFF700000000000000000000F6FFFFFFFFFFFFFFF70000
            00000000000000000000000000000000000000000000F6FFFFFF9B0000000000
            00000000005BFFFFFFFFF6F6FFFFF70A00000000000000A4A4A4A4A452000000
            000000009B08FFF6FFF700000000A4F7F75200000000ADFFF6FFF6F6F6FFF600
            000000000000FFFFFFFFFFFFF6ED00000000000052FFFFF6F608F700009BFFFF
            FFF7000000F5F6F6F6FFFFFFF6F75200000000000007FFFFF6F6F6F6FFF6A400
            0000000000A4F7F6FFF6FFF65208FFF6F6F6A35207FFF6F6F6FFF75249000000
            00000000F7FFFFFFF6F6F6F6FFFFFF49000000000000004952F6F6FFFFFFF6F6
            F6F6FFFFFFFFF6F6F6FF00000000000000000000FFFFFFFFF6F6F6F6FFFFFF07
            00000000000000000007FFFFFFFFF6F6F6F6FFFFFFFFF6F6F6FF000000000000
            00000007FFF6F6F6FFFFFFFFF6F6F6F649000000000000000007FFF6F6F6FFFF
            FFFFF6F6F6F6FFFFFFFF000000000000000000F6FFF6F6F6FFFFFFFFF6F6F6F6
            52000000000000000007FFF6F6F6FFFFFFFFF6F6F6F6FFFFFFFF000000000000
            00000049FFF6F6F6FFFFFFFFF6F6FFF600000000000000000007FFF6F6F6FFFF
            FFFFFFF6F6F6FFFFF6FF0A00000000000000000008FFFFFFF6F6F6F6FFFFFF9B
            000000000000000000F6F6FFFFFFF6F6F6F6FFFFFFFFF6F6F6FFFFF6F7520000
            0000000052F6FFFFF6F6F6F6FFFF08000000000000529BF6FFF6F6FFF7F6F6F6
            F6F607F7F6FFF6F6F6FFF6F6FFFF0700000000000000FFFFF6F6F6F6FFF60000
            0000000000FFFFF6F6FFF65200F7FFF6FF07000000FFFFF6F6FFF6F6F6FFF600
            00000000000052F608F60808A400000000000000F7F6FFF6FFA40000000007F6
            F69C00000000A4FFF6FFFFFFFF08000000000000000000000000000000000000
            00000000005BFFFFFFFF5B0000000000000000000049F6FFFFFFFFFFF6000000
            00000000000000000000000000000000000000000000A4FFFFFFA40000000000
            000000000008FFFFFFFFF6FFF600000000000000000000000000000000000000
            00000000000000FFFFFF0800000000525200000000F6FFFFFFFFF6F6F6490000
            0000000000000000000000000000000000000000000007FFFFFF5B00000008FF
            F65B0000005BFFFFFFFFF6F6F6FFA400000000A4FFF6000000000000005BFFF6
            0000000052FFFF00000000005BFFFFF6F6FF5200000000000007F6F6F6F6FFA4
            0000A4F6F6FF07000000000000FFFFFFF6000000FFFFFF00000000009BFFF6F6
            F6F60700000000000007FFFFFFFFF6F6F6F6FFFFFFFF0700000000009BFFF6F6
            FFF6F6F6FFF6F600000000005BFFFFFFFFFF0700000000000007FFFFFFFFF6F6
            F6F6FFFFFFFF070000000000F7FFF6F6FFFFFFFFF6F6F6520A0000000008FFFF
            FFFF0000000000529BF6FFFFFFF6F6F6F6FFFFFFFFF6F60708080807F6F6F6F6
            FFFFFFF6F6F6F6FFF6089B0000494A4952490000000808FFFFFFF6F6F6F6FFFF
            FFF6F6F6F6FFFFFFF6F6F6F6FFFFFFF6F6F6F6F6FFFFFFF6F6FFF60000000000
            0000000000FFF6F6F6FFF6F6F6F6FFFFFFF6F6F6F6FFFFFFF6F6F6F6FFFFFFFF
            F6F6F6FFFFFFFFF6F6FFA400000000000000000000A4FFF6F6FFF6F6F6F6FFFF
            FFF6F6F6F6FFFFFFF6F6F6F6FFFFFFFFF6F6F6FFFFFFFFF6FFF652000000004A
            49000000000007F6F6FFF6F6F6F6FFFFFFF6F6F6F6FFFFFFF6F6F6F6FFFFFFFF
            F6F6F6FFFFFFFFF6FF9B000000009BFFF65200000000A4FFF6FFFFFFFFF6F6F6
            F6FFFFFFFFF6F6F6FFFFFFFFF6F6F6F6FFFFFFF6F6F6F6FFFFF6F6080007FFFF
            FFFF49520808F6FFFFFFFFFFFFFFF6F6F6F6FFFFFFF6F6F6FFFFFFFFF6F6F6F6
            FFFFFFF6F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFFFFFFFFFFFFF6F6
            F6F6FFFFFFF6F6F6FFFFFFFFF6F6F6F6FFFFFFF6F6F6F6FFFFFFFFF6F6F6FFFF
            FFFFF6F6F6F6FFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = btnConfiguracaoClick
        end
      end
      object AdvPanel2: TAdvPanel
        Left = 0
        Top = 84
        Width = 1227
        Height = 566
        Align = alClient
        BevelWidth = 11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UseDockManager = True
        Version = '1.6.0.3'
        Caption.Color = clHighlight
        Caption.ColorTo = clNone
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clHighlightText
        Caption.Font.Height = -11
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = []
        Caption.GradientDirection = gdVertical
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = clWindowText
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        FullHeight = 0
        object SMDBGrid3: TSMDBGrid
          Left = 11
          Top = 11
          Width = 1205
          Height = 544
          Align = alClient
          Ctl3D = False
          DataSource = DMFolha.dsmContabil
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 11
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'Cod_Empresa_Siagri'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Empresa Siagri'
              Title.Color = 14402992
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cod_Conta'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd Conta'
              Title.Color = 14402992
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vlr_Lancamento'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Lan'#231'amento'
              Title.Color = 14402992
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sinal_Lancamento'
              Title.Alignment = taCenter
              Title.Caption = 'D'#233'bito/Cr'#233'dito'
              Title.Color = 14402992
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_Historico'
              Title.Alignment = taCenter
              Title.Caption = 'ID Hist'#243'rico'
              Title.Color = 14402992
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Complemento_Hist'
              Title.Alignment = taCenter
              Title.Caption = 'Complemento Hist'#243'rico'
              Title.Color = 14402992
              Width = 222
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cod_CCusto'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Centro Custo'
              Title.Color = 14402992
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vlr_CCusto'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Centro Custo'
              Title.Color = 14402992
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ_Correntista'
              Title.Alignment = taCenter
              Title.Caption = 'CNPJ Correntista'
              Title.Color = 14402992
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vlr_Correntista'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Correntista'
              Title.Color = 14402992
              Visible = True
            end>
        end
      end
    end
    object TS_PlanoContas: TRzTabSheet
      Caption = 'Plano Contas'
      object SMDBGrid4: TSMDBGrid
        Left = 0
        Top = 41
        Width = 1227
        Height = 609
        Align = alClient
        Ctl3D = False
        DataSource = DMFolha.dsmPlano
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold]
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 20
        ScrollBars = ssHorizontal
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'CodRed'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Color = 16777088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CodPlano'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Color = 16777088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeConta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Color = 16777088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object NxPanel4: TNxPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 41
        Align = alTop
        UseDockManager = False
        ParentBackground = False
        TabOrder = 1
        object btnGravar: TNxButton
          Left = 5
          Top = 6
          Width = 249
          Caption = 'Gravar Arquivo Plano txt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnGravarClick
        end
      end
    end
    object TS_Historico: TRzTabSheet
      Caption = 'Hist'#243'rico'
      object NxPanel5: TNxPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 41
        Align = alTop
        UseDockManager = False
        ParentBackground = False
        TabOrder = 0
        object NxButton1: TNxButton
          Left = 5
          Top = 6
          Width = 249
          Caption = 'Gravar Arquivo Hist'#243'rico txt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnGravarClick
        end
      end
      object SMDBGrid5: TSMDBGrid
        Left = 0
        Top = 41
        Width = 1227
        Height = 609
        Align = alClient
        Ctl3D = False
        DataSource = DMFolha.dsmHistorico
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold]
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 20
        ScrollBars = ssHorizontal
        ColCount = 3
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 668
            Visible = True
          end>
      end
    end
  end
end
