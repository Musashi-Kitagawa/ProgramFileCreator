object ListForm: TListForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ListForm'
  ClientHeight = 663
  ClientWidth = 1362
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
  object Label1: TLabel
    Left = 1186
    Top = 318
    Width = 44
    Height = 17
    Caption = #34920#31034#24418#24335
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 1186
    Top = 232
    Width = 55
    Height = 17
    Caption = #12459#12521#12512#34920#31034
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 1268
    Top = 374
    Width = 9
    Height = 17
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
  end
  object UpLabel: TLabel
    Left = 1185
    Top = 108
    Width = 30
    Height = 51
    Caption = #61702
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12874308
    Font.Height = -48
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = []
    ParentFont = False
    OnMouseDown = UpLabelMouseDown
  end
  object DownLabel: TLabel
    Tag = 1
    Left = 1185
    Top = 176
    Width = 30
    Height = 51
    Caption = #61703
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12874308
    Font.Height = -48
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = []
    ParentFont = False
    OnMouseDown = UpLabelMouseDown
  end
  object Label5: TLabel
    Left = 104
    Top = 522
    Width = 118
    Height = 17
    Caption = 'ENTER '#12391#30906#23450#12375#12414#12377#12290
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
  end
  object NamePanel: TPanel
    Left = 48
    Top = 85
    Width = 217
    Height = 24
    BevelOuter = bvNone
    Caption = #12459#12521#12512#12479#12452#12488#12523
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object SelectComboBox: TComboBox
    Left = 1186
    Top = 342
    Width = 171
    Height = 26
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 1186
    Top = 397
    Width = 171
    Height = 26
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object KugiriCheckBox: TCheckBox
    Left = 1186
    Top = 261
    Width = 140
    Height = 17
    Caption = #21306#20999#12426#25991#23383
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object IDCheckBox: TCheckBox
    Tag = 1
    Left = 1186
    Top = 284
    Width = 140
    Height = 17
    Caption = 'ID'#21517#31216#25991#23383#25968
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object NameCheckBox: TCheckBox
    Tag = 2
    Left = 1201
    Top = 447
    Width = 140
    Height = 17
    Caption = 'NAME'#36865#20449#23550#35937
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object XptCheckBox: TCheckBox
    Tag = 3
    Left = 1201
    Top = 494
    Width = 140
    Height = 17
    Caption = 'XPT'#36865#20449#23550#35937
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object XptKugiriCheckBox: TCheckBox
    Tag = 4
    Left = 1201
    Top = 534
    Width = 140
    Height = 17
    Caption = 'XPT'#21306#20999#12426
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object ListPanel: TPanel
    Left = 46
    Top = 576
    Width = 1282
    Height = 58
    BevelOuter = bvNone
    Color = 16777151
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 8
    object PanelTmp: TPanel
      Left = 1
      Top = 1
      Width = 120
      Height = 56
      BevelKind = bkFlat
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      Visible = False
      OnMouseDown = PanelTmpMouseDown
    end
  end
  object CSScrollBox: TScrollBox
    Left = 48
    Top = 115
    Width = 1119
    Height = 401
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = 15066597
    ParentColor = False
    TabOrder = 9
    OnMouseWheel = CSScrollBoxMouseWheel
    object Panel1: TPanel
      Left = 3
      Top = 16
      Width = 1092
      Height = 35
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = clRed
      ParentBackground = False
      TabOrder = 0
      Visible = False
      OnClick = Panel1Click
      object Label4: TLabel
        Left = 236
        Top = 10
        Width = 35
        Height = 17
        Caption = 'Label4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 36
        Top = 5
        Width = 178
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = #31471#23376#30058#21495
        OnKeyPress = Edit1KeyPress
      end
      object CheckBox1: TCheckBox
        Left = 14
        Top = 9
        Width = 19
        Height = 17
        Caption = 'F_DstPortNo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object ComboBox2: TComboBox
        Left = 459
        Top = 5
        Width = 70
        Height = 25
        Style = csDropDownList
        DropDownCount = 9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = #12394#12375
        Items.Strings = (
          #12394#12375
          'Alias1'
          'Alias2'
          'Alias3'
          'Alias4'
          'Alias5'
          'Alias6'
          'Alias7'
          'Alias8')
      end
      object RadioButton1: TRadioButton
        Left = 656
        Top = 10
        Width = 113
        Height = 17
        TabOrder = 3
        OnClick = RadioButton1Click
      end
    end
  end
  object AllCheckBox: TCheckBox
    Tag = 4
    Left = 1186
    Top = 85
    Width = 140
    Height = 17
    Caption = #20840#12390#22793#26356#12377#12427
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 10
  end
  object Panel4: TPanel
    Left = 266
    Top = 85
    Width = 239
    Height = 24
    BevelOuter = bvNone
    Caption = #12459#12521#12512#21517#65288#12458#12540#12480#12540#30058#21495#65289
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
  object Panel5: TPanel
    Left = 506
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'Alias1'
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 12
  end
  object Panel3: TPanel
    Left = 577
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'Alias2'
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 13
  end
  object Panel6: TPanel
    Left = 648
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'Alias3'
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 14
  end
  object Panel7: TPanel
    Left = 719
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'Alias4'
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 15
  end
  object Panel8: TPanel
    Left = 790
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'Alias5'
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 16
  end
  object Panel9: TPanel
    Left = 861
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'Alias6'
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 17
  end
  object Panel10: TPanel
    Left = 932
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'Alias7'
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 18
  end
  object Panel11: TPanel
    Left = 1003
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'Alias8'
    Color = 12874308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 19
  end
  object Panel12: TPanel
    Left = 1074
    Top = 85
    Width = 70
    Height = 24
    BevelOuter = bvNone
    Caption = 'None'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 20
  end
end