object DisplayEnumTypeForm: TDisplayEnumTypeForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DisplayEnumType'
  ClientHeight = 143
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 15
    Top = 21
    Width = 94
    Height = 17
    Caption = 'F_Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 125
    Top = 16
    Width = 400
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'F_FrameIdEdit'
  end
  object OKButton: TButton
    Left = 71
    Top = 100
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
  end
  object CancelButton: TButton
    Left = 423
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object CheckBox2: TCheckBox
    Left = 15
    Top = 48
    Width = 94
    Height = 17
    Caption = 'F_Note'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 125
    Top = 43
    Width = 400
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'F_FrameIdEdit'
  end
end