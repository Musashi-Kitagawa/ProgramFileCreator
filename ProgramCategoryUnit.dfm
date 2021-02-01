object ProgramCategoryForm: TProgramCategoryForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ProgramCategoryForm'
  ClientHeight = 790
  ClientWidth = 1359
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
  object Label4: TLabel
    Left = 75
    Top = 442
    Width = 223
    Height = 17
    Caption = #8251'ID = 0'#12399#12289#12487#12501#12457#12523#12488#12398#38917#30446#12395#12394#12426#12414#12377#12290
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
  end
  object PlusLabel: TLabel
    Left = 473
    Top = 112
    Width = 28
    Height = 34
    Caption = #61543
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12874308
    Font.Height = -32
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = []
    ParentFont = False
    OnClick = MinusLabelClick
  end
  object MinusLabel: TLabel
    Tag = 1
    Left = 537
    Top = 112
    Width = 28
    Height = 34
    Caption = #61944
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12874308
    Font.Height = -32
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = []
    ParentFont = False
    OnClick = MinusLabelClick
  end
  object Label1: TLabel
    Tag = 2
    Left = 601
    Top = 112
    Width = 32
    Height = 34
    Caption = #62211
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12874308
    Font.Height = -32
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = []
    ParentFont = False
    OnClick = MinusLabelClick
  end
  object CaScrollBox: TScrollBox
    Left = 60
    Top = 148
    Width = 372
    Height = 269
    VertScrollBar.Tracking = True
    BevelInner = bvNone
    BorderStyle = bsNone
    DoubleBuffered = True
    Color = clWhite
    ParentBackground = True
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object TerPanel: TPanel
      Left = 1
      Top = 1
      Width = 331
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
      OnMouseDown = TerPanelMouseDown
    end
  end
  object DispPanel: TPanel
    Left = 312
    Top = 112
    Width = 94
    Height = 30
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = #34920#31034#38918'(Order)'
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
  object NamePanel: TPanel
    Left = 111
    Top = 112
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
    TabOrder = 2
    VerticalAlignment = taAlignTop
  end
  object NoPanel: TPanel
    Left = 60
    Top = 112
    Width = 50
    Height = 30
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'ID'
    Color = 14511872
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    VerticalAlignment = taAlignTop
  end
  object Cate1Button: TMusFlatButton
    Left = 60
    Top = 34
    Width = 100
    Height = 37
    Caption = #61564' '#12459#12486#12468#12522#65297
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Cate1ButtonClick
    Color = clBtnFace
    DownColor = 33023
  end
  object Cate2Button: TMusFlatButton
    Tag = 1
    Left = 176
    Top = 34
    Width = 100
    Height = 37
    Caption = #61564' '#12459#12486#12468#12522#65298
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Cate1ButtonClick
    Color = clBtnFace
    DownColor = 33023
  end
  object Cate3Button: TMusFlatButton
    Tag = 2
    Left = 292
    Top = 34
    Width = 100
    Height = 37
    Caption = #61564' '#12459#12486#12468#12522#65299
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Cate1ButtonClick
    Color = clBtnFace
    DownColor = 33023
  end
  object InputEdit: TEdit
    Left = 452
    Top = 249
    Width = 121
    Height = 30
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 'InputEdit'
  end
end
