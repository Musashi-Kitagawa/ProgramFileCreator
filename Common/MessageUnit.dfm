object MessageForm: TMessageForm
  Left = 324
  Top = 366
  BorderStyle = bsNone
  Caption = 'MessageForm'
  ClientHeight = 89
  ClientWidth = 364
  Color = 13172735
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 89
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = 13172735
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object MessLabel: TLabel
      Left = 0
      Top = 23
      Width = 360
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'MessLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #12513#12452#12522#12458
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      Layout = tlCenter
    end
    object Label1: TLabel
      Left = 0
      Top = 53
      Width = 360
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'MessLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      Layout = tlCenter
    end
  end
end
