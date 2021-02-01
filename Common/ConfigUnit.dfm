object ConfigForm: TConfigForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #29872#22659#35373#23450
  ClientHeight = 585
  ClientWidth = 721
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 721
    Height = 552
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    Style = tsButtons
    TabOrder = 0
    TabWidth = 100
    ExplicitHeight = 438
    object TabSheet1: TTabSheet
      Caption = #25805#20316
      ExplicitLeft = 8
      ExplicitTop = 29
      object Label4: TLabel
        Left = 10
        Top = 40
        Width = 116
        Height = 17
        Caption = 'UNDO/REDO '#26368#22823#38542#23652
      end
      object Label5: TLabel
        Left = 22
        Top = 158
        Width = 200
        Height = 17
        Caption = #12459#12486#12468#12522#12508#12479#12531#39640#12373#12288#12288#12288#12288#12288#12288#12288#12288'px'
      end
      object Label6: TLabel
        Left = 22
        Top = 191
        Width = 201
        Height = 17
        Caption = #12464#12523#12540#12503#12508#12479#12531#39640#12373#12288#12288'  '#12288#12288#12288#12288' '#12288'px'
      end
      object Label8: TLabel
        Left = 10
        Top = 132
        Width = 23
        Height = 17
        Caption = 'XPT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 22
        Top = 224
        Width = 201
        Height = 17
        Caption = 'DESTINATION '#39640#12373#12288#12288#12288#12288#12288#12288#12288#12288'px'
      end
      object Label10: TLabel
        Left = 22
        Top = 257
        Width = 202
        Height = 17
        Caption = 'SOURCE '#39640#12373#12288#12288#12288#12288#12288#12288#12288#12288' '#12288' '#12288'px'
      end
      object Label11: TLabel
        Left = 22
        Top = 333
        Width = 193
        Height = 17
        Caption = #12508#12479#12531' '#27178#12473#12506#12540#12473#12288#12288#12288#12288'     '#12288#12288' %'
      end
      object Label12: TLabel
        Left = 22
        Top = 366
        Width = 193
        Height = 17
        Caption = #12508#12479#12531' '#32294#12473#12506#12540#12473#12288#12288#12288#12288'     '#12288#12288' %'
      end
      object Label13: TLabel
        Left = 293
        Top = 40
        Width = 106
        Height = 17
        Caption = #12459#12486#12468#12522#21517#31216' PRIFIX'
      end
      object Label14: TLabel
        Left = 293
        Top = 71
        Width = 101
        Height = 17
        Caption = 'GROUP'#21517#31216' PRIFIX'
      end
      object Label17: TLabel
        Left = 326
        Top = 158
        Width = 200
        Height = 17
        Caption = #12459#12486#12468#12522#12508#12479#12531#39640#12373#12288#12288#12288#12288#12288#12288#12288#12288'px'
      end
      object Label18: TLabel
        Left = 326
        Top = 191
        Width = 204
        Height = 17
        Caption = #12464#12523#12540#12503#12508#12479#12531#39640#12373#12288#12288#12288#12288#12288#12288#12288' '#12288'px'
      end
      object Label19: TLabel
        Left = 314
        Top = 132
        Width = 39
        Height = 17
        Caption = 'PANEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 326
        Top = 224
        Width = 201
        Height = 17
        Caption = 'DESTINATION '#39640#12373#12288#12288#12288#12288#12288#12288#12288#12288'px'
        Enabled = False
      end
      object Label21: TLabel
        Left = 326
        Top = 257
        Width = 202
        Height = 17
        Caption = 'SOURCE '#39640#12373#12288#12288#12288#12288#12288#12288#12288#12288' '#12288' '#12288'px'
        Enabled = False
      end
      object Label26: TLabel
        Left = 22
        Top = 413
        Width = 193
        Height = 17
        Caption = #12508#12479#12531' '#19978#19979#12510#12540#12472#12531#12288#12288#12288'     '#12288#12288' '#8240
      end
      object Label27: TLabel
        Left = 22
        Top = 446
        Width = 193
        Height = 17
        Caption = #12508#12479#12531' '#24038#21491#12510#12540#12472#12531#12288#12288#12288'     '#12288#12288' '#8240
      end
      object UndoSpinEdit: TSpinEdit
        Left = 144
        Top = 37
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object XptCateHSpinEdit: TSpinEdit
        Left = 132
        Top = 155
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object XptGrpHSpinEdit: TSpinEdit
        Left = 132
        Top = 188
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object XptDstHSpinEdit: TSpinEdit
        Left = 132
        Top = 221
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object XptSrcHSpinEdit: TSpinEdit
        Left = 132
        Top = 254
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 0
      end
      object XptXSpaceSpinEdit: TSpinEdit
        Left = 132
        Top = 330
        Width = 68
        Height = 27
        MaxValue = 100
        MinValue = 0
        TabOrder = 5
        Value = 0
      end
      object XptYSpaceSpinEdit: TSpinEdit
        Left = 132
        Top = 363
        Width = 68
        Height = 27
        MaxValue = 100
        MinValue = 0
        TabOrder = 6
        Value = 0
      end
      object CatePrifixEdit: TEdit
        Left = 420
        Top = 37
        Width = 121
        Height = 25
        TabOrder = 7
        Text = 'DbPathEdit'
      end
      object GrpPrifixEdit: TEdit
        Left = 420
        Top = 68
        Width = 121
        Height = 25
        TabOrder = 8
        Text = 'DbPathEdit'
      end
      object PanelCateHSpinEdit: TSpinEdit
        Left = 436
        Top = 155
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 9
        Value = 0
      end
      object PanelGrpHSpinEdit: TSpinEdit
        Left = 436
        Top = 188
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 10
        Value = 0
      end
      object PanelDstHSpinEdit: TSpinEdit
        Left = 436
        Top = 221
        Width = 68
        Height = 27
        Enabled = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 11
        Value = 0
      end
      object SpinEdit4: TSpinEdit
        Left = 436
        Top = 254
        Width = 68
        Height = 27
        Enabled = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 12
        Value = 0
      end
      object TopMarginSpinEdit: TSpinEdit
        Left = 132
        Top = 410
        Width = 68
        Height = 27
        MaxValue = 1000
        MinValue = 0
        TabOrder = 13
        Value = 0
      end
      object LeftMarginSpinEdit: TSpinEdit
        Left = 132
        Top = 443
        Width = 68
        Height = 27
        MaxValue = 1000
        MinValue = 0
        TabOrder = 14
        Value = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = #12487#12540#12479#12505#12540#12473
      ImageIndex = 1
      ExplicitHeight = 403
      object Label2: TLabel
        Left = 26
        Top = 112
        Width = 117
        Height = 17
        Caption = 'XPT '#12459#12486#12468#12522' '#12501#12524#12540#12512
      end
      object Label3: TLabel
        Left = 26
        Top = 152
        Width = 129
        Height = 17
        Caption = #12497#12493#12523' '#12459#12486#12468#12522' '#12501#12524#12540#12512
      end
      object Label1: TLabel
        Left = 26
        Top = 24
        Width = 121
        Height = 17
        Caption = #12487#12540#12479#12505#12540#12473#26684#32013#20808#12497#12473
      end
      object Label15: TLabel
        Left = 26
        Top = 320
        Width = 66
        Height = 17
        Caption = #26368#22823#12459#12486#12468#12522
      end
      object Label16: TLabel
        Left = 26
        Top = 353
        Width = 66
        Height = 17
        Caption = #26368#22823#12464#12523#12540#12503
      end
      object Label22: TLabel
        Left = 26
        Top = 201
        Width = 141
        Height = 17
        Caption = 'MAINTENANCE PORT LIST'
      end
      object Label23: TLabel
        Left = 26
        Top = 232
        Width = 59
        Height = 17
        Caption = 'NAME LIST'
      end
      object Label24: TLabel
        Left = 218
        Top = 320
        Width = 132
        Height = 17
        Caption = #12464#12523#12540#12503#20869#12398'DST'#12508#12479#12531#25968
      end
      object Label25: TLabel
        Left = 218
        Top = 353
        Width = 132
        Height = 17
        Caption = #12464#12523#12540#12503#20869#12398'SRC'#12508#12479#12531#25968
      end
      object XPTRootEdit: TEdit
        Left = 184
        Top = 111
        Width = 499
        Height = 25
        TabOrder = 0
        Text = 'DbPathEdit'
      end
      object PanelRootEdit: TEdit
        Left = 184
        Top = 149
        Width = 499
        Height = 25
        TabOrder = 1
        Text = 'DbPathEdit'
      end
      object DbPathEdit: TEdit
        Left = 26
        Top = 47
        Width = 639
        Height = 25
        TabOrder = 2
        Text = 'DbPathEdit'
      end
      object MaxCateSpinEdit: TSpinEdit
        Left = 112
        Top = 317
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object MaxGrpSpinEdit: TSpinEdit
        Left = 112
        Top = 350
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 0
      end
      object Button1: TButton
        Left = 666
        Top = 47
        Width = 29
        Height = 25
        Caption = #8230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = Button1Click
      end
      object DstSetPortEdit: TEdit
        Left = 184
        Top = 198
        Width = 121
        Height = 25
        TabOrder = 6
        Text = 'DbPathEdit'
      end
      object DstNameEdit: TEdit
        Left = 184
        Top = 229
        Width = 121
        Height = 25
        TabOrder = 7
        Text = 'DbPathEdit'
      end
      object SrcSetPortEdit: TEdit
        Left = 311
        Top = 198
        Width = 121
        Height = 25
        TabOrder = 8
        Text = 'DbPathEdit'
      end
      object SrcNameEdit: TEdit
        Left = 311
        Top = 229
        Width = 121
        Height = 25
        TabOrder = 9
        Text = 'DbPathEdit'
      end
      object DstGroupButtonSpinEdit: TSpinEdit
        Left = 364
        Top = 317
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 10
        Value = 0
      end
      object SrcGroupButtonSpinEdit: TSpinEdit
        Left = 364
        Top = 350
        Width = 68
        Height = 27
        MaxValue = 0
        MinValue = 0
        TabOrder = 11
        Value = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = #33394
      ImageIndex = 2
      ExplicitHeight = 403
      object Shape1: TShape
        Left = 40
        Top = 48
        Width = 27
        Height = 25
        OnMouseDown = Shape1MouseDown
      end
      object Label7: TLabel
        Left = 73
        Top = 52
        Width = 92
        Height = 17
        Caption = #12524#12452#12450#12454#12488' '#31227#21205#33394
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 552
    Width = 721
    Height = 33
    Align = alBottom
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 438
    object OKButton: TButton
      Left = 14
      Top = 5
      Width = 75
      Height = 25
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 630
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 140
    Top = 15
  end
  object ColorDialog: TColorDialog
    Left = 204
    Top = 15
  end
end
