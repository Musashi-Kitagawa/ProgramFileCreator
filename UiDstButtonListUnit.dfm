object UiDstButtonListForm: TUiDstButtonListForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'DESTINATION LIST'
  ClientHeight = 411
  ClientWidth = 852
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
  object ListView: TListView
    Left = 0
    Top = 0
    Width = 852
    Height = 411
    Align = alClient
    Columns = <
      item
        MaxWidth = 1
        MinWidth = 1
        Width = 1
      end
      item
        Alignment = taCenter
        Caption = 'No.'
        MaxWidth = 50
        MinWidth = 50
      end
      item
        Caption = 'ID'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = 'Frame ID'
        Width = 300
      end
      item
        Caption = 'Dest Port No.'
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
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsReport
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 144
    Top = 136
    object N1: TMenuItem
      Caption = #22793#26356
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #21066#38500
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Tag = 2
      Caption = #36861#21152
      OnClick = N4Click
    end
  end
end
