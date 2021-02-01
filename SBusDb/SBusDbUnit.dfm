object SBusDbForm: TSBusDbForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'SBusDb'
  ClientHeight = 531
  ClientWidth = 880
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 880
    Height = 531
    ActivePage = TabSheet22
    Align = alClient
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #12513#12452#12522#12458
    Font.Style = []
    MultiLine = True
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    TabWidth = 200
    object TabSheet1: TTabSheet
      Caption = 'SBUS DEVICE'
      object ListView: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        BiDiMode = bdLeftToRight
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
            Caption = 'F_Id'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'F_TypeName'
            MaxWidth = 200
            MinWidth = 200
            Width = 200
          end
          item
            Caption = 'F_Name'
            MaxWidth = 200
            MinWidth = 200
            Width = 200
          end
          item
            Caption = 'SBUS/NAS'
            MaxWidth = 100
            MinWidth = 100
            Width = 100
          end
          item
            Caption = 'PAGE COUNT'
            MaxWidth = 100
            MinWidth = 100
            Width = 100
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #12513#12452#12522#12458
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'SBUS DEVICE TYPE'
      ImageIndex = 1
      object ListView1: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'No.'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'ID'
          end
          item
            Caption = 'NAME'
            MaxWidth = 100
            MinWidth = 100
            Width = 100
          end
          item
            Caption = 'NOTE'
            MaxWidth = 100
            MinWidth = 100
            Width = 100
          end
          item
            Caption = 'UiKey'
            MaxWidth = 200
            MinWidth = 200
            Width = 200
          end
          item
            Caption = 'PAGE COUNT'
            MaxWidth = 100
            MinWidth = 100
            Width = 100
          end
          item
            Caption = 'KEY COUNT'
            MaxWidth = 100
            MinWidth = 100
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'SBUS DEVICE TYPE'
      ImageIndex = 2
      object ListView2: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'No.'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'ID'
          end
          item
            Caption = 'NAME'
            MaxWidth = 200
            MinWidth = 200
            Width = 200
          end
          item
            Caption = 'PNEL TYPE ID'
            MaxWidth = 200
            MinWidth = 200
            Width = 200
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'SBUS SETTINGS'
      ImageIndex = 3
      object ListView3: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'No.'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'ID'
            Width = 100
          end
          item
            Caption = 'VALUE'
            Width = 200
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'SbSrcNameBus'
      ImageIndex = 4
      object ListView4: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'F_Name'
            Width = 130
          end
          item
            Caption = 'F_AliasNo'
            Width = 70
          end
          item
            Caption = 'F_SrcPortNoRange'
            Width = 120
          end
          item
            Caption = 'F_IsProgramSendTarget'
            Width = 120
          end
          item
            Caption = 'F_Note'
            Width = 210
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'SbDstNameBus'
      ImageIndex = 5
      object ListView5: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'F_Name'
            Width = 130
          end
          item
            Caption = 'F_AliasNo'
            Width = 70
          end
          item
            Caption = 'F_SrcPortNoRange'
            Width = 120
          end
          item
            Caption = 'F_IsProgramSendTarget'
            Width = 120
          end
          item
            Caption = 'F_Note'
            Width = 210
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'SbSrcNameGroup'
      ImageIndex = 6
      object ListView6: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'F_Name'
            Width = 130
          end
          item
            Caption = 'F_SrcPortNoRange'
            Width = 240
          end
          item
            Caption = 'F_Note'
            Width = 210
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'SbDstNameGroup'
      ImageIndex = 7
      object ListView7: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'F_Name'
            Width = 130
          end
          item
            Caption = 'F_DstPortNoRange'
            Width = 240
          end
          item
            Caption = 'F_Note'
            Width = 210
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'SbDstInhibit'
      ImageIndex = 8
      object ListView8: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_DstPortNo'
            Width = 150
          end
          item
            Caption = 'F_IsInhibit'
            Width = 130
          end
          item
            Caption = 'F_IsReadOnly'
            Width = 200
          end
          item
            Caption = 'F_XptCategory'
            Width = 210
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'SbAlarmDefine'
      ImageIndex = 9
      object ListView9: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_AlarmCode'
            Width = 150
          end
          item
            Caption = 'F_Level'
            Width = 60
          end
          item
            Caption = 'F_Message'
            Width = 400
          end
          item
            Caption = 'F_IsRecoverable'
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'SbPanelPageName'
      ImageIndex = 10
      object ListView10: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
          end
          item
            Caption = 'F_PanelTypeId'
            Width = 100
          end
          item
            Caption = 'F_PageNo'
            Width = 100
          end
          item
            Caption = 'F_PageName'
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet12: TTabSheet
      Caption = 'SbDevicePanelPageName'
      ImageIndex = 11
      object ListView11: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_DeviceId'
            Width = 100
          end
          item
            Caption = 'F_PageNo'
            Width = 100
          end
          item
            Caption = 'F_PageName'
            Width = 100
          end
          item
            Caption = 'F_DisplayOrder'
            Width = 100
          end
          item
            Caption = 'F_IsVisible'
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet13: TTabSheet
      Caption = 'SbSrcColor'
      ImageIndex = 12
      object ListView12: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
            Width = 100
          end
          item
            Caption = 'F_ScreenRgba'
            Width = 100
          end
          item
            Caption = 'F_ScreenTextRgba'
            Width = 100
          end
          item
            Caption = 'F_ScreenSelectedRgba'
            Width = 100
          end
          item
            Caption = 'F_ScreenTextSelectedRgba'
            Width = 100
          end
          item
            Caption = 'F_AliasText'
          end
          item
            Caption = 'F_DisplayName'
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet14: TTabSheet
      Caption = 'SbDstControlTarge'
      ImageIndex = 13
      object ListView13: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_DstPortNo'
            Width = 100
          end
          item
            Caption = 'F_IsSbusTarget'
            Width = 100
          end
          item
            Caption = 'F_IsNsBusTarget'
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet15: TTabSheet
      Caption = 'SbEditSrcSetGroup'
      ImageIndex = 14
      object ListView14: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_SrcNo'
            Width = 100
          end
          item
            Caption = 'F_LevelDefineId'
            Width = 100
          end
          item
            Caption = 'F_GroupName'
            Width = 100
          end
          item
            Caption = 'F_ChCount'
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet16: TTabSheet
      Caption = 'SbEditDstSetGroup'
      ImageIndex = 15
      object ListView15: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_DstNo'
            Width = 100
          end
          item
            Caption = 'F_LevelDefineId'
            Width = 100
          end
          item
            Caption = 'F_GroupName'
            Width = 100
          end
          item
            Caption = 'F_ChCount'
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet17: TTabSheet
      Caption = 'SbEditSrcLevelDefine'
      ImageIndex = 16
      object ListView16: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
            Width = 100
          end
          item
            Caption = 'F_EditPortRanges'
            Width = 100
          end
          item
            Caption = 'F_VideoTargetPortRanges'
          end
          item
            Caption = 'F_VideoLevelRange'
          end
          item
            Caption = 'F_AudioTargetPortRanges'
            Width = 100
          end
          item
            Caption = '1'
            Width = 100
          end
          item
            Caption = '2'
          end
          item
            Caption = '3'
          end
          item
            Caption = '4'
          end
          item
            Caption = '5'
          end
          item
            Caption = '6'
          end
          item
            Caption = '7'
          end
          item
            Caption = '8'
          end
          item
            Caption = '9'
          end
          item
            Caption = '10'
          end
          item
            Caption = '11'
          end
          item
            Caption = '12'
          end
          item
            Caption = '13'
          end
          item
            Caption = '14'
          end
          item
            Caption = '15'
          end
          item
            Caption = '16'
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet18: TTabSheet
      Caption = 'SbEditDstLevelDefine'
      ImageIndex = 17
      object ListView17: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
            Width = 100
          end
          item
            Caption = 'F_EditPortRanges'
            Width = 100
          end
          item
            Caption = 'F_VideoTargetPortRanges'
          end
          item
            Caption = 'F_VideoLevelRange'
          end
          item
            Caption = 'F_AudioTargetPortRanges'
            Width = 100
          end
          item
            Caption = '1'
            Width = 100
          end
          item
            Caption = '2'
          end
          item
            Caption = '3'
          end
          item
            Caption = '4'
          end
          item
            Caption = '5'
          end
          item
            Caption = '6'
          end
          item
            Caption = '7'
          end
          item
            Caption = '8'
          end
          item
            Caption = '9'
          end
          item
            Caption = '10'
          end
          item
            Caption = '11'
          end
          item
            Caption = '12'
          end
          item
            Caption = '13'
          end
          item
            Caption = '14'
          end
          item
            Caption = '15'
          end
          item
            Caption = '16'
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet19: TTabSheet
      Caption = 'SbSystemMode'
      ImageIndex = 18
      object ListView18: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Id'
          end
          item
            Caption = 'F_Name'
            Width = 80
          end
          item
            Caption = 'F_Order'
            Width = 100
          end
          item
            Caption = 'F_DisplayName'
            Width = 100
          end
          item
            Caption = 'F_SrcPortNoRange'
          end
          item
            Caption = 'F_DefaultProgramId'
            Width = 80
          end
          item
            Caption = 'F_DefaultProgramRowHeaderDisplayName'
            Width = 80
          end
          item
            Caption = 'F_DefaultProgramTitleDisplayName'
            Width = 80
          end
          item
            Caption = 'F_Note'
            Width = 80
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet20: TTabSheet
      Caption = 'SbMultiLevelDst'
      ImageIndex = 19
      object ListView19: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_DstNo'
            Width = 150
          end
          item
            Caption = 'F_DivDstLevel'
            Width = 150
          end
          item
            Caption = 'F_DivDstNoRange'
            Width = 150
          end
          item
            Caption = 'F_Note'
            Width = 150
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet21: TTabSheet
      Caption = 'SbMultiLevelSrc'
      ImageIndex = 20
      object ListView20: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_SrcNo'
            Width = 150
          end
          item
            Caption = 'F_DivSrcNoRange'
            Width = 150
          end
          item
            Caption = 'F_Note'
            Width = 150
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet22: TTabSheet
      Caption = 'XptBus'
      ImageIndex = 21
      object ListView21: TListView
        Left = 0
        Top = 0
        Width = 872
        Height = 389
        Align = alClient
        Columns = <
          item
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = 'F_Text'
            Width = 150
          end
          item
            Caption = 'F_DstPortNoRange'
            Width = 200
          end
          item
            Caption = 'F_SrcPortNoRange'
            Width = 200
          end
          item
            Caption = 'F_NoAssignDstNo'
            Width = 100
          end
          item
            Caption = 'F_NoAssignSrcNo'
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
end
