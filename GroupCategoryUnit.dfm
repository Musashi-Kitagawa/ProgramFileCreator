object GroupCategoryForm: TGroupCategoryForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'GroupCategoryForm'
  ClientHeight = 665
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UpLabel: TLabel
    Left = 520
    Top = 107
    Width = 20
    Height = 34
    Caption = #61702
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12874308
    Font.Height = -32
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object DownLabel: TLabel
    Left = 562
    Top = 107
    Width = 20
    Height = 34
    Caption = #61703
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12874308
    Font.Height = -32
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 168
    Top = 566
    Width = 308
    Height = 17
    Caption = #12459#12486#12468#12522#12289#12464#12523#12540#12503#20869#12398#12508#12479#12531#12434#20840#12390#24259#26820#12375#12390#20877#27083#31689#12375#12414#12377#12290
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
  end
  object NoPanel: TPanel
    Left = 60
    Top = 85
    Width = 50
    Height = 30
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'No.'
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    VerticalAlignment = taAlignTop
  end
  object NamePanel: TPanel
    Left = 111
    Top = 85
    Width = 200
    Height = 30
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = #21517#31216
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    VerticalAlignment = taAlignTop
  end
  object DispPanel: TPanel
    Left = 312
    Top = 85
    Width = 80
    Height = 30
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = #34920#31034#38918
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    VerticalAlignment = taAlignTop
  end
  object CatePanel: TPanel
    Left = 60
    Top = 116
    Width = 332
    Height = 32
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 3
    Visible = False
    OnMouseDown = CatePanelMouseDown
  end
  object InputEdit: TEdit
    Left = 400
    Top = 278
    Width = 121
    Height = 30
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'InputEdit'
    OnEnter = InputEditEnter
    OnExit = InputEditExit
    OnKeyDown = InputEditKeyDown
  end
  object RebuildButton: TMusFlatButton
    Tag = 1
    Left = 60
    Top = 556
    Width = 90
    Height = 37
    Caption = #20877#27083#31689
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = RebuildButtonClick
    Color = clBtnFace
    DownColor = 33023
  end
  object IndexPopupMenu: TPopupMenu
    Left = 536
    Top = 440
    object N11: TMenuItem
      Tag = 1
      Caption = '1'
      OnClick = N11Click
    end
    object N12: TMenuItem
      Tag = 2
      Caption = '2'
      OnClick = N11Click
    end
    object N31: TMenuItem
      Tag = 3
      Caption = '3'
      OnClick = N11Click
    end
    object N41: TMenuItem
      Tag = 4
      Caption = '4'
      OnClick = N11Click
    end
    object N42: TMenuItem
      Tag = 5
      Caption = '5'
      OnClick = N11Click
    end
    object N51: TMenuItem
      Tag = 6
      Caption = '6'
      OnClick = N11Click
    end
    object N61: TMenuItem
      Tag = 7
      Caption = '7'
      OnClick = N11Click
    end
    object N81: TMenuItem
      Tag = 8
      Caption = '8'
      OnClick = N11Click
    end
    object N91: TMenuItem
      Tag = 9
      Caption = '9'
      OnClick = N11Click
    end
    object N101: TMenuItem
      Tag = 10
      Caption = '10'
      OnClick = N11Click
    end
  end
end
