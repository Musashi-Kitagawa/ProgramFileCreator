object DisplayDBForm: TDisplayDBForm
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 1007
    Height = 561
    ActivePage = TabSheet7
    Align = alClient
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
        Width = 999
        Height = 528
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
        OnDblClick = MessListViewDblClick
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'ENUM TYPE'
      ImageIndex = 1
      object TypeListView: TListView
        Left = 0
        Top = 0
        Width = 999
        Height = 528
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
        OnDblClick = MessListViewDblClick
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'ENUM VALUE'
      ImageIndex = 2
      object ValueListView: TListView
        Left = 0
        Top = 0
        Width = 999
        Height = 528
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
          end
          item
            Caption = 'HIDDEN'
            Width = 100
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
        OnDblClick = MessListViewDblClick
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'DISPLAY SETTINGs'
      ImageIndex = 3
      object ColorListView: TListView
        Left = 0
        Top = 0
        Width = 999
        Height = 528
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
        OnDblClick = MessListViewDblClick
      end
    end
  end
end
