object XPTLayoutForm: TXPTLayoutForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #12524#12452#12450#12454#12488
  ClientHeight = 651
  ClientWidth = 1317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1080
    Top = 65
    Width = 31
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object Label2: TLabel
    Left = 1080
    Top = 84
    Width = 31
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object CatePanel: TPanel
    Left = 14
    Top = 540
    Width = 1280
    Height = 64
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = 16777151
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    Visible = False
    object PanelTmp2: TPanel
      Left = 4
      Top = 2
      Width = 120
      Height = 56
      BevelKind = bkFlat
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      Visible = False
    end
  end
  object GrpPanel: TPanel
    Left = 14
    Top = 611
    Width = 1280
    Height = 64
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = 16777151
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 1
    Visible = False
  end
  object LayoutBasePanel: TPanel
    Left = 14
    Top = 150
    Width = 1280
    Height = 360
    BevelOuter = bvNone
    Color = 3158064
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 2
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
      OnMouseDown = LayoutPanelMouseDown
      OnMouseMove = FormMouseMove
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
        OnMouseMove = PanelTmpMouseMove
        OnMouseUp = PanelTmpMouseUp
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
        OnMouseUp = _MovePanelMouseUp
      end
    end
  end
  object PopupMenu: TPopupMenu
    Left = 72
    Top = 72
    object N1: TMenuItem
      Caption = #12501#12523#25972#21015
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N2x21: TMenuItem
      Caption = '2 x 2 '#25972#21015
      OnClick = N2x21Click
    end
    object N3x31: TMenuItem
      Tag = 1
      Caption = '3 x 3 '#25972#21015
      OnClick = N2x21Click
    end
    object N4x41: TMenuItem
      Tag = 2
      Caption = '4 x 4 '#25972#21015
      OnClick = N2x21Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #20491#21029#35373#23450
      OnClick = N4Click
    end
  end
end
