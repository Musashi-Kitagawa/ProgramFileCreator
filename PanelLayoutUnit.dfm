object PanelLayoutForm: TPanelLayoutForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #12497#12493#12523#12524#12452#12450#12454#12488
  ClientHeight = 742
  ClientWidth = 1392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LayoutBasePanel: TPanel
    Left = 22
    Top = 302
    Width = 1280
    Height = 360
    BevelOuter = bvNone
    Color = 3158064
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object LayoutPanel: TPanel
      Left = 28
      Top = 28
      Width = 1280
      Height = 360
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = 16777151
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 0
      object PanelTmp: TPanel
        Left = -2
        Top = -2
        Width = 128
        Height = 72
        BevelKind = bkFlat
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        Visible = False
        OnMouseDown = PanelTmpMouseDown
      end
      object _MovePanel: TPanel
        Left = 171
        Top = 106
        Width = 89
        Height = 50
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clLime
        ParentBackground = False
        TabOrder = 1
        Visible = False
      end
    end
  end
  object GScrollBox: TScrollBox
    Left = 20
    Top = 64
    Width = 933
    Height = 217
    VertScrollBar.Tracking = True
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    DoubleBuffered = True
    Color = clWhite
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 1
    OnMouseWheel = GScrollBoxMouseWheel
    object TerPanel: TPanel
      Left = 1
      Top = 1
      Width = 908
      Height = 30
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = TerPanelClick
    end
  end
  object NoPanel: TPanel
    Left = 20
    Top = 38
    Width = 42
    Height = 20
    BevelOuter = bvNone
    Caption = 'St.ID'
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object NamePanel: TPanel
    Left = 63
    Top = 38
    Width = 195
    Height = 20
    BevelOuter = bvNone
    Caption = 'NAME'
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
  end
  object TypePanel: TPanel
    Left = 259
    Top = 38
    Width = 253
    Height = 20
    BevelOuter = bvNone
    Caption = 'TYPE'
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object IDPanel: TPanel
    Left = 513
    Top = 38
    Width = 73
    Height = 20
    BevelOuter = bvNone
    Caption = 'PANEL ID'
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object KeyPanel: TPanel
    Left = 587
    Top = 38
    Width = 171
    Height = 20
    BevelOuter = bvNone
    Caption = 'KEY'
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object SbDeviceButton: TMusFlatButton
    Left = 1152
    Top = 114
    Width = 90
    Height = 37
    Caption = 'SbDevice'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = SbDeviceButtonClick
    Color = clBtnFace
    DownColor = 33023
  end
  object SbDeviceTypeButton: TMusFlatButton
    Tag = 1
    Left = 1152
    Top = 170
    Width = 90
    Height = 37
    Caption = 'SbDeviceType'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = SbDeviceButtonClick
    Color = clBtnFace
    DownColor = 33023
  end
  object SbPanelTypeButton: TMusFlatButton
    Tag = 2
    Left = 1152
    Top = 226
    Width = 90
    Height = 37
    Caption = 'SbPanelType'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = SbDeviceButtonClick
    Color = clBtnFace
    DownColor = 33023
  end
  object IPPanel: TPanel
    Left = 759
    Top = 38
    Width = 171
    Height = 20
    BevelOuter = bvNone
    Caption = 'IP ADDRESS'
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 10
  end
  object PopupMenu: TPopupMenu
    Left = 1240
    Top = 56
    object N1: TMenuItem
      Caption = #12501#12523#25972#21015
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #20491#21029#35373#23450
      OnClick = N4Click
    end
  end
end
