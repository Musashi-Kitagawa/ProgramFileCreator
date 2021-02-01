unit SBusDbUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.ComCtrls;

type
  TSBusDbForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListView: TListView;
    ListView1: TListView;
    TabSheet3: TTabSheet;
    ListView2: TListView;
    TabSheet4: TTabSheet;
    ListView3: TListView;
    TabSheet5: TTabSheet;
    ListView4: TListView;
    TabSheet6: TTabSheet;
    ListView5: TListView;
    TabSheet7: TTabSheet;
    ListView6: TListView;
    TabSheet8: TTabSheet;
    ListView7: TListView;
    TabSheet9: TTabSheet;
    ListView8: TListView;
    TabSheet10: TTabSheet;
    ListView9: TListView;
    TabSheet11: TTabSheet;
    ListView10: TListView;
    TabSheet12: TTabSheet;
    ListView11: TListView;
    TabSheet13: TTabSheet;
    ListView12: TListView;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    TabSheet16: TTabSheet;
    ListView13: TListView;
    ListView14: TListView;
    ListView15: TListView;
    TabSheet17: TTabSheet;
    ListView16: TListView;
    TabSheet18: TTabSheet;
    ListView17: TListView;
    TabSheet19: TTabSheet;
    ListView18: TListView;
    TabSheet20: TTabSheet;
    ListView19: TListView;
    TabSheet21: TTabSheet;
    ListView20: TListView;
    TabSheet22: TTabSheet;
    ListView21: TListView;
  private
    { Private êÈåæ }

    procedure   MakeSBusDeviceList( dev : TSbDeviceList );
    procedure   MakeSBusPanelTypeList( typ : TSbPanelTypeList );
    procedure   MakeSBusDeviceTypeList( dev : TSbDeviceTypeList );
    procedure   MakeSBusSettingsList( dev : TSbSettingsList );
    procedure   MakeSbSrcNameBusList( src : TSbSrcNameBusList );
    procedure   MakeSbDstNameBusList( dst : TSbDstNameBusList );
    procedure   MakeSbSrcNameGroupList( src : TSbSrcNameGroupList );
    procedure   MakeSbDstNameGroupList( src : TSbDstNameGroupList );
    procedure   MakeSbDstInhibitList( src : TSbDstInhibitList );
    procedure   MakeSbAlarmDefine( src : TSbAlarmDefineList );
    procedure   MakeSbPanelPageNameList( src : TSbPanelPageNameList );
    procedure   MakeSbDevicePanelPageNameList( src : TSbDevicePanelPageNameList );
    procedure   MakeSbSrcColorList( src : TSbSrcColorList );
    procedure   MakeSbDstControlTargeList( src : TSbDstControlTargetList );
    procedure   MakeSbEditSrcSetGroupList( src : TSbEditSrcSetGroupList );
    procedure   MakeSbEditDstSetGroupList( src : TSbEditDstSetGroupList );
    procedure   MakeSbEditSrcLevelDefineList( src : TSbEditSrcLevelDefineList );
    procedure   MakeSbEditDstLevelDefineList( src : TSbEditDstLevelDefineList );
    procedure   MakeSbSystemModeList( src : TSbSystemModeList );
    procedure   MakeSbMultiLevelDstList( src : TSbMultiLevelDstList );
    procedure   MakeSbMultiLevelSrcList( src : TSbMultiLevelSrcList );
    procedure   MakeSbXptBusList( src : TSbXptBusList );


  public
    { Public êÈåæ }

    procedure Start( sb : TSBusDb );

  end;

var
  SBusDbForm: TSBusDbForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.Start( sb : TSBusDb );
begin
    ListView.Items.Clear;
    ListView1.Items.Clear;
    ListView2.Items.Clear;
    ListView3.Items.Clear;
    ListView4.Items.Clear;
    ListView5.Items.Clear;
    ListView6.Items.Clear;
    ListView7.Items.Clear;
    ListView8.Items.Clear;
    ListView9.Items.Clear;
    ListView10.Items.Clear;
    ListView11.Items.Clear;
    ListView12.Items.Clear;
    ListView13.Items.Clear;
    ListView14.Items.Clear;

    MakeSBusDeviceList( sb.SbDeviceList );
    MakeSBusPanelTypeList( sb.SbPanelTypeList );
    MakeSBusDeviceTypeList( sb.SbDeviceTypeList );
    MakeSBusSettingsList( sb.SbSettingsList );
    MakeSbSrcNameBusList( sb.SbSrcNameBusList );
    MakeSbDstNameBusList( sb.SbDstNameBusList );
    MakeSbSrcNameGroupList( sb.SbSrcNameGroupList );
    MakeSbDstNameGroupList( sb.SbDstNameGroupList );
    MakeSbDstInhibitList( sb.SbDstInhibitList );
    MakeSbAlarmDefine( sb.SbAlarmDefineList );
    MakeSbPanelPageNameList( sb.SbPanelPageNameList );
    MakeSbDevicePanelPageNameList( sb.SbDevicePanelPageNameList );
    MakeSbSrcColorList( sb.SbSrcColorList );
    MakeSbDstControlTargeList( sb.SbDstControlTargetList );
    MakeSbEditSrcSetGroupList( sb.SbEditSrcSetGroupList );
    MakeSbEditDstSetGroupList( sb.SbEditDstSetGroupList );
    MakeSbEditSrcLevelDefineList( sb.SbEditSrcLevelDefineList );
    MakeSbEditDstLevelDefineList( sb.SbEditDstLevelDefineList );
    MakeSbSystemModeList( sb.SbSystemModeList );
    MakeSbMultiLevelDstList( sb.SbMultiLevelDstList );
    MakeSbMultiLevelSrcList( sb.SbMultiLevelSrcList );
    MakeSbXptBusList( sb.SbXptBusList );

    Show;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSBusPanelTypeList( typ : TSbPanelTypeList );
var
    s : TSbPanelType;
    i : integer;
    li : TListItem;

begin

    for i:=0 to typ.Count-1 do begin

        s   := typ.Data[i];

        li  := ListView1.Items.Add;
        li.SubItems.Add( IntToStr(i + 1) );
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_Name );
        li.SubItems.Add( s.F_Note );
        li.SubItems.Add( s.F_UiKey );
        li.SubItems.Add( s.F_PageCount );
        li.SubItems.Add( s.F_KeyCount );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSBusDeviceList( dev : TSbDeviceList );
var
    s : TSbDevice;
    i : integer;
    li : TListItem;

begin

    for i:=0 to dev.Count-1 do begin

        s   := dev.Data[i];

        li  := ListView.Items.Add;
        li.SubItems.Add( IntToStr(i + 1) );
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_TypeName );
        li.SubItems.Add( s.F_Name );
        li.SubItems.Add( s.F_DeviceCategoryName );
        li.SubItems.Add( s.F_KeyAssignPageCount );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSBusDeviceTypeList( dev : TSbDeviceTypeList );
var
    s : TSbDeviceType;
    i : integer;
    li : TListItem;

begin

    for i:=0 to dev.Count-1 do begin

        s   := dev.Data[i];

        li  := ListView2.Items.Add;
        li.SubItems.Add( IntToStr(i + 1) );
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_Name );
        li.SubItems.Add( s.F_PanelTypeId );
        li.SubItems.Add( s.F_IsSubnetControllable );
        li.SubItems.Add( s.F_IsSoapSupported );
        li.SubItems.Add( s.F_IsNsbusDevice );
        li.SubItems.Add( s.F_IsPanelTypeVisible );
    end;
end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSBusSettingsList( dev : TSbSettingsList );
var
    s : TSbSettings;
    i : integer;
    li : TListItem;

begin

    for i:=0 to dev.Count-1 do begin

        s   := dev.Data[i];

        li  := ListView3.Items.Add;
        li.SubItems.Add( IntToStr(i + 1) );
        li.SubItems.Add( s.F_ValueId );
        li.SubItems.Add( s.F_Value );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbSrcNameBusList( src : TSbSrcNameBusList );
var
    s : TSbSrcNameBus;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView4.Items.Add;
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_Name );
        li.SubItems.Add( s.F_AliasNo );
        li.SubItems.Add( s.F_SrcPortNoRange );
        li.SubItems.Add( s.F_IsProgramSendTarget );
        li.SubItems.Add( s.F_Note );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbDstNameBusList( dst : TSbDstNameBusList );
var
    s : TSbDstNameBus;
    i : integer;
    li : TListItem;

begin

    for i:=0 to dst.Count-1 do begin

        s   := dst.Data[i];

        li  := ListView5.Items.Add;
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_Name );
        li.SubItems.Add( s.F_AliasNo );
        li.SubItems.Add( s.F_DstPortNoRange );
        li.SubItems.Add( s.F_IsProgramSendTarget );
        li.SubItems.Add( s.F_Note );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbSrcNameGroupList( src : TSbSrcNameGroupList );
var
    s : TSbSrcNameGroup;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView6.Items.Add;
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_Name );
        li.SubItems.Add( s.F_SrcPortNoRange );
        li.SubItems.Add( s.F_Note );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbDstNameGroupList( src : TSbDstNameGroupList );
var
    s : TSbDstNameGroup;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView7.Items.Add;
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_Name );
        li.SubItems.Add( s.F_DstPortNoRange );
        li.SubItems.Add( s.F_Note );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbDstInhibitList( src : TSbDstInhibitList );
var
    s : TSbDstInhibit;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView8.Items.Add;
        li.SubItems.Add( s.F_DstPortNo );
        li.SubItems.Add( s.F_IsInhibit );
        li.SubItems.Add( s.F_IsReadOnly );
        li.SubItems.Add( s.F_XptCategor );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbAlarmDefine( src : TSbAlarmDefineList );
var
    s : TSbAlarmDefine;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView9.Items.Add;
        li.SubItems.Add( s.F_AlarmCode );
        li.SubItems.Add( s.F_Level );
        li.SubItems.Add( s.F_Message );
        li.SubItems.Add( s.F_IsRecoverable );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbPanelPageNameList( src : TSbPanelPageNameList );
var
    s : TSbPanelPageName;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView10.Items.Add;
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_PanelTypeId );
        li.SubItems.Add( s.F_PageNo );
        li.SubItems.Add( s.F_PageName );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbDevicePanelPageNameList( src : TSbDevicePanelPageNameList );
var
    s : TSbDevicePanelPageName;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView11.Items.Add;
        li.SubItems.Add( s.F_DeviceId );
        li.SubItems.Add( s.F_PageNo );
        li.SubItems.Add( s.F_PageName );
        li.SubItems.Add( s.F_DisplayOrder );
        li.SubItems.Add( s.F_IsVisible );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbSrcColorList( src : TSbSrcColorList );
var
    s : TSbSrcColor;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView12.Items.Add;
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_ScreenRgba );
        li.SubItems.Add( s.F_ScreenTextRgba );
        li.SubItems.Add( s.F_ScreenSelectedRgba );
        li.SubItems.Add( s.F_ScreenTextSelectedRgba );
        li.SubItems.Add( s.F_AliasText );
        li.SubItems.Add( s.F_DisplayName );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbDstControlTargeList( src : TSbDstControlTargetList );
var
    s : TSbDstControlTarget;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView13.Items.Add;
        li.SubItems.Add( s.F_DstPortNo );
        li.SubItems.Add( s.F_IsSbusTarget );
        li.SubItems.Add( s.F_IsNsBusTarget );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbEditSrcSetGroupList( src : TSbEditSrcSetGroupList );
var
    s : TSbEditSrcSetGroup;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView14.Items.Add;
        li.SubItems.Add( s.F_SrcNo );
        li.SubItems.Add( s.F_LevelDefineId );
        li.SubItems.Add( s.F_GroupName );
        li.SubItems.Add( s.F_ChCount );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbEditDstSetGroupList( src : TSbEditDstSetGroupList );
var
    s : TSbEditdstSetGroup;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView15.Items.Add;
        li.SubItems.Add( s.F_DstNo );
        li.SubItems.Add( s.F_LevelDefineId );
        li.SubItems.Add( s.F_GroupName );
        li.SubItems.Add( s.F_ChCount );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbEditSrcLevelDefineList( src : TSbEditSrcLevelDefineList );
var
    s : TSbEditSrcLevelDefine;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView16.Items.Add;
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_EditPortRanges );
        li.SubItems.Add( s.F_VideoTargetPortRanges );
        li.SubItems.Add( s.F_VideoLevelRange );
        li.SubItems.Add( s.F_AudioTargetPortRanges );
        li.SubItems.Add( s.F_Audio1LevelRange );
        li.SubItems.Add( s.F_Audio2LevelRange );
        li.SubItems.Add( s.F_Audio3LevelRange );
        li.SubItems.Add( s.F_Audio4LevelRange );
        li.SubItems.Add( s.F_Audio5LevelRange );
        li.SubItems.Add( s.F_Audio6LevelRange );
        li.SubItems.Add( s.F_Audio7LevelRange );
        li.SubItems.Add( s.F_Audio8LevelRange );
        li.SubItems.Add( s.F_Audio9LevelRange );
        li.SubItems.Add( s.F_Audio10LevelRange );
        li.SubItems.Add( s.F_Audio11LevelRange );
        li.SubItems.Add( s.F_Audio12LevelRange );
        li.SubItems.Add( s.F_Audio13LevelRange );
        li.SubItems.Add( s.F_Audio14LevelRange );
        li.SubItems.Add( s.F_Audio15LevelRange );
        li.SubItems.Add( s.F_Audio16LevelRange );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbEditDstLevelDefineList( src : TSbEditDstLevelDefineList );
var
    s : TSbEditDstLevelDefine;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView17.Items.Add;
        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_EditPortRanges );
        li.SubItems.Add( s.F_VideoTargetPortRanges );
        li.SubItems.Add( s.F_VideoLevelRange );
        li.SubItems.Add( s.F_AudioTargetPortRanges );
        li.SubItems.Add( s.F_Audio1LevelRange );
        li.SubItems.Add( s.F_Audio2LevelRange );
        li.SubItems.Add( s.F_Audio3LevelRange );
        li.SubItems.Add( s.F_Audio4LevelRange );
        li.SubItems.Add( s.F_Audio5LevelRange );
        li.SubItems.Add( s.F_Audio6LevelRange );
        li.SubItems.Add( s.F_Audio7LevelRange );
        li.SubItems.Add( s.F_Audio8LevelRange );
        li.SubItems.Add( s.F_Audio9LevelRange );
        li.SubItems.Add( s.F_Audio10LevelRange );
        li.SubItems.Add( s.F_Audio11LevelRange );
        li.SubItems.Add( s.F_Audio12LevelRange );
        li.SubItems.Add( s.F_Audio13LevelRange );
        li.SubItems.Add( s.F_Audio14LevelRange );
        li.SubItems.Add( s.F_Audio15LevelRange );
        li.SubItems.Add( s.F_Audio16LevelRange );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbSystemModeList( src : TSbSystemModeList );
var
    s : TSbSystemMode;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView18.Items.Add;

        li.SubItems.Add( s.F_Id );
        li.SubItems.Add( s.F_Name );
        li.SubItems.Add( s.F_Order );
        li.SubItems.Add( s.F_DisplayName );
        li.SubItems.Add( s.F_SrcPortNoRange );
        li.SubItems.Add( s.F_DefaultProgramId );
        li.SubItems.Add( s.F_DefaultProgramRowHeaderDisplayName );
        li.SubItems.Add( s.F_DefaultProgramTitleDisplayName );
        li.SubItems.Add( s.F_Note );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbMultiLevelDstList( src : TSbMultiLevelDstList );
var
    s : TSbMultiLevelDst;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView19.Items.Add;

        li.SubItems.Add( s.F_DstNo );
        li.SubItems.Add( s.F_DivDstLevel );
        li.SubItems.Add( s.F_DivDstNoRange );
        li.SubItems.Add( s.F_Note );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbMultiLevelSrcList( src : TSbMultiLevelSrcList );
var
    s : TSbMultiLevelSrc;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView20.Items.Add;

        li.SubItems.Add( s.F_SrcNo );
        li.SubItems.Add( s.F_DivSrcNoRange );
        li.SubItems.Add( s.F_Note );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSBusDbForm.MakeSbXptBusList( src : TSbXptBusList );
var
    s : TSbXptBus;
    i : integer;
    li : TListItem;

begin

    for i:=0 to src.Count-1 do begin

        s   := src.Data[i];

        li  := ListView21.Items.Add;

        li.SubItems.Add( s.F_Text );
        li.SubItems.Add( s.F_DstPortNoRange );
        li.SubItems.Add( s.F_SrcPortNoRange );
        li.SubItems.Add( s.F_NoAssignDstNo );
        li.SubItems.Add( s.F_NoAssignSrcNo );


{
        F_Id                : string;
        E_Id                : Boolean;

        F_Name              : string;
        E_Name              : Boolean;

        F_Text              : string;
        E_Text              : Boolean;

        F_RecvLevelNo       : string;
        E_RecvLevelNo       : Boolean;

        F_SendLevelBitMask  : string;
        E_SendLevelBitMask  : Boolean;

        F_SendLevelBitMaskOffLine       : string;
        E_SendLevelBitMaskOffLine       : Boolean;

        F_DstPortNoRange    : string;
        E_DstPortNoRange    : Boolean;

        F_SrcPortNoRange    : string;
        E_SrcPortNoRange    : Boolean;

        F_NoAssignDstNo     : string;
        E_NoAssignDstNo     : Boolean;

        F_NoAssignSrcNo     : string;
        E_NoAssignSrcNo     : Boolean;

        F_IsVirtual         : string;
        E_IsVirtual         : Boolean;

        F_ColorName         : string;
        E_ColorName         : Boolean;

}
    end;
end;


end.
