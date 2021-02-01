object ColorSetForm: TColorSetForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'DisplayDB '#32232#38598
  ClientHeight = 561
  ClientWidth = 1007
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 65
    Top = 123
    Width = 920
    Height = 520
    ActivePage = TabSheet5
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    TabWidth = 200
    object TabSheet5: TTabSheet
      Caption = 'MESSAGE'
      object MessListView: TListView
        Left = 0
        Top = 0
        Width = 912
        Height = 487
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'ID'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'MESSAGE CODE'
            MaxWidth = 300
            MinWidth = 300
            Width = 300
          end
          item
            Caption = 'MESSAGE'
            Width = 400
          end
          item
            Caption = 'MEMO'
            Width = 200
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'ENUM TYPE'
      ImageIndex = 1
      object TypeListView: TListView
        Left = 0
        Top = 0
        Width = 912
        Height = 487
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'NAME'
            MaxWidth = 200
            MinWidth = 200
            Width = 200
          end
          item
            Caption = 'NOTE'
            Width = 400
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'ENUM VALUE'
      ImageIndex = 2
      object ValueListView: TListView
        Left = 0
        Top = 0
        Width = 912
        Height = 487
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'NAME'
            MaxWidth = 200
            MinWidth = 200
            Width = 200
          end
          item
            Caption = 'ORDER'
            MaxWidth = 100
            MinWidth = 100
            Width = 100
          end
          item
            Caption = 'VALUE'
            MaxWidth = 100
            MinWidth = 100
            Width = 100
          end
          item
            Caption = 'TEXT'
            Width = 200
          end
          item
            Caption = 'ATTRIVUTE'
            Width = 200
          end
          item
            Caption = 'TAG'
            Width = 150
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'DISPLAY SETTINGs'
      ImageIndex = 3
      object ColorListView: TListView
        Left = 0
        Top = 0
        Width = 912
        Height = 487
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'ID'
            Width = 300
          end
          item
            Caption = 'VALUE'
            Width = 150
          end
          item
            Caption = 'ORDER'
            Width = 150
          end
          item
            Caption = 'NOTE'
            Width = 300
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
  object BasePanel: TPanel
    Left = 0
    Top = 0
    Width = 1007
    Height = 561
    Align = alClient
    BevelOuter = bvNone
    Caption = 'BasePanel'
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 520
      Width = 1007
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      object OKButton: TMusFlatButton
        Tag = 3
        Left = 16
        Top = 9
        Width = 78
        Height = 25
        Cancel = True
        Caption = 'SAVE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        DownColor = 33023
      end
      object CancelButton: TMusFlatButton
        Tag = 3
        Left = 912
        Top = 9
        Width = 78
        Height = 25
        Cancel = True
        Caption = 'Cancel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        DownColor = 33023
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 1007
      Height = 520
      ActivePage = TabSheet2
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabWidth = 150
      ExplicitLeft = 160
      ExplicitTop = 529
      object TabSheet2: TTabSheet
        Caption = 'Message'
        object MESScrollBox: TScrollBox
          Left = 0
          Top = 19
          Width = 999
          Height = 472
          VertScrollBar.Tracking = True
          Align = alClient
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 0
          OnMouseWheel = ScrollBoxMouseWheel
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 999
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel1'
          Color = clBlack
          ParentBackground = False
          TabOrder = 1
          object Panel6: TPanel
            Left = 53
            Top = 2
            Width = 246
            Height = 15
            BevelOuter = bvNone
            Caption = 'MESSAGE CODE'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
          object Panel7: TPanel
            Left = 300
            Top = 2
            Width = 697
            Height = 15
            BevelOuter = bvNone
            Caption = 'MESSAGE'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
          object Panel8: TPanel
            Left = 2
            Top = 2
            Width = 50
            Height = 15
            BevelOuter = bvNone
            Caption = 'ID'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'EnumType'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ETScrollBox: TScrollBox
          Left = 0
          Top = 19
          Width = 999
          Height = 472
          VertScrollBar.Tracking = True
          Align = alClient
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 0
          OnMouseWheel = ScrollBoxMouseWheel
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 999
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel1'
          Color = clBlack
          ParentBackground = False
          TabOrder = 1
          object Panel9: TPanel
            Left = 2
            Top = 2
            Width = 271
            Height = 15
            BevelOuter = bvNone
            Caption = 'NAME'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
          object Panel10: TPanel
            Left = 274
            Top = 2
            Width = 723
            Height = 15
            BevelOuter = bvNone
            Caption = 'NOTE'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'EnumValue'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object EVScrollBox: TScrollBox
          Left = 0
          Top = 19
          Width = 999
          Height = 472
          VertScrollBar.Tracking = True
          Align = alClient
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 0
          OnMouseWheel = ScrollBoxMouseWheel
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 999
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel1'
          Color = clBlack
          ParentBackground = False
          TabOrder = 1
          object Panel12: TPanel
            Left = 2
            Top = 2
            Width = 223
            Height = 15
            BevelOuter = bvNone
            Caption = 'ENUM NAME'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
          object Panel13: TPanel
            Left = 226
            Top = 2
            Width = 253
            Height = 15
            BevelOuter = bvNone
            Caption = 'VALUE'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
          object Panel14: TPanel
            Left = 480
            Top = 2
            Width = 513
            Height = 15
            BevelOuter = bvNone
            Caption = 'TEXT'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'DisplayDspSettings'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ScrollBox: TScrollBox
          Left = 0
          Top = 19
          Width = 999
          Height = 472
          VertScrollBar.Tracking = True
          Align = alClient
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 0
          OnMouseWheel = ScrollBoxMouseWheel
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 999
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel1'
          Color = clBlack
          ParentBackground = False
          TabOrder = 1
          object Panel15: TPanel
            Left = 1
            Top = 2
            Width = 280
            Height = 15
            BevelOuter = bvNone
            Caption = 'VALUE ID'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
          object Panel16: TPanel
            Left = 282
            Top = 2
            Width = 202
            Height = 15
            BevelOuter = bvNone
            Caption = 'VALUE'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
          object Panel17: TPanel
            Left = 485
            Top = 2
            Width = 512
            Height = 15
            BevelOuter = bvNone
            Caption = 'NOTE'
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -8
            Font.Name = 'AERO'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
          end
        end
      end
    end
  end
end
