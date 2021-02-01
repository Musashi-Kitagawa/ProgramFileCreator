program ProgramFileCreator;

uses
  Windows,
  Vcl.Forms,
  GroupCategoryUnit in 'GroupCategoryUnit.pas' {GroupCategoryForm},
  GroupUnit in 'GroupUnit.pas' {GroupForm},
  MainUnit in 'MainUnit.pas' {MainForm},
  ListUnit in 'ListUnit.pas' {ListForm},
  XPTLayoutUnit in 'XPTLayoutUnit.pas' {XPTLayoutForm},
  CommonUnit in 'Common\CommonUnit.pas',
  ConfigDataUnit in 'Common\ConfigDataUnit.pas',
  MessageUnit in 'Common\MessageUnit.pas' {MessageForm},
  ConfigUnit in 'Common\ConfigUnit.pas' {ConfigForm},
  UiDstButtonListUnit in 'UiDstButtonListUnit.pas' {UiDstButtonListForm},
  LogUtilUnit in 'Common\LogUtilUnit.pas',
  ProgramListUnit in 'ProgramListUnit.pas' {ProgramListForm},
  ProgramCategoryUnit in 'ProgramCategoryUnit.pas' {ProgramCategoryForm},
  DisplayDspSettingsUnit in 'DisplayDb\DisplayDspSettingsUnit.pas' {DisplayDspSettingsForm},
  DisplayEnumTypeUnit in 'DisplayDb\DisplayEnumTypeUnit.pas' {DisplayEnumTypeForm},
  DisplayEnumvalueUnit in 'DisplayDb\DisplayEnumvalueUnit.pas' {DisplayEnumvalueForm},
  DisplayMessageUnit in 'DisplayDb\DisplayMessageUnit.pas' {DisplayMessageForm},
  DisplayDbUnit in 'DisplayDb\DisplayDbUnit.pas' {DisplayDBForm},
  ScreenDbUnit in 'ScreenDb\ScreenDbUnit.pas',
  UiContentUnit in 'ScreenDb\UiContentUnit.pas' {UiContentForm},
  UiDstButtonUnit in 'ScreenDb\UiDstButtonUnit.pas' {UiDstButtonForm},
  UiFrameUnit in 'ScreenDb\UiFrameUnit.pas' {UiFrameForm},
  UiListCellButtonUnit in 'ScreenDb\UiListCellButtonUnit.pas' {UiListCellButtonForm},
  UiListColumnUnit in 'ScreenDb\UiListColumnUnit.pas' {UiListColumnForm},
  UiListUnit in 'ScreenDb\UiListUnit.pas' {UiListForm},
  UiPanelDstButtonUnit in 'ScreenDb\UiPanelDstButtonUnit.pas' {UiPanelDstButtonForm},
  UiPanelSrcButtonUnit in 'ScreenDb\UiPanelSrcButtonUnit.pas' {UiPanelSrcButtonForm},
  UiSrcButtonUnit in 'ScreenDb\UiSrcButtonUnit.pas' {UiSrcButtonForm},
  ScreenButtonUnit in 'ScreenDb\ScreenButtonUnit.pas' {ScreenButtonForm},
  PiCategoryUnit in 'ProgramIndexDb\PiCategoryUnit.pas' {PiCategoryForm},
  SBusDbUnit in 'SBusDb\SBusDbUnit.pas' {SBusDbForm},
  PanelLayoutUnit in 'PanelLayoutUnit.pas' {PanelLayoutForm},
  UiPanelKeyButtonUnit in 'ScreenDb\UiPanelKeyButtonUnit.pas' {UiPanelKeyButtonForm},
  SbDeviceUnit in 'SBusDb\SbDeviceUnit.pas' {SbDeviceForm},
  SbDeviceTypeUnit in 'SBusDb\SbDeviceTypeUnit.pas' {SbDeviceTypeForm},
  SbPanelTypeUnit in 'SBusDb\SbPanelTypeUnit.pas' {SbPanelTypeForm};

{$R *.res}

const
	MuteXName	= 'Program File Creator by MUSASHI Co.,LTD,';

var
	hMuteX	: THandle;

begin

  ReportMemoryLeaksOnShutDown := (1 = ParamCount) and ('MEMORY' = ParamStr(1));

  hMuteX := OpenMuteX( MUTEX_ALL_ACCESS, False, MuteXName );
  if hMuteX <> 0 then begin
  	CloseHandle( hMuteX );
    Exit;
  end;

  hMuteX := CreateMuteX( nil, False, MuteXName );

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  Application.CreateForm(TGroupCategoryForm, GroupCategoryForm);
//  Application.CreateForm(TGroupForm, GroupForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMessageForm, MessageForm);
  Application.CreateForm(TConfigForm, ConfigForm);
  Application.CreateForm(TUiDstButtonListForm, UiDstButtonListForm);
  Application.CreateForm(TProgramCategoryForm, ProgramCategoryForm);
  Application.CreateForm(TDisplayDspSettingsForm, DisplayDspSettingsForm);
  Application.CreateForm(TDisplayEnumTypeForm, DisplayEnumTypeForm);
  Application.CreateForm(TDisplayEnumvalueForm, DisplayEnumvalueForm);
  Application.CreateForm(TDisplayMessageForm, DisplayMessageForm);
  Application.CreateForm(TDisplayDBForm, DisplayDBForm);
  Application.CreateForm(TUiContentForm, UiContentForm);
  Application.CreateForm(TUiDstButtonForm, UiDstButtonForm);
  Application.CreateForm(TUiFrameForm, UiFrameForm);
  Application.CreateForm(TUiListCellButtonForm, UiListCellButtonForm);
  Application.CreateForm(TUiListColumnForm, UiListColumnForm);
  Application.CreateForm(TUiListForm, UiListForm);
  Application.CreateForm(TUiPanelDstButtonForm, UiPanelDstButtonForm);
  Application.CreateForm(TUiPanelSrcButtonForm, UiPanelSrcButtonForm);
  Application.CreateForm(TUiSrcButtonForm, UiSrcButtonForm);
  Application.CreateForm(TScreenButtonForm, ScreenButtonForm);
  Application.CreateForm(TPiCategoryForm, PiCategoryForm);
  Application.CreateForm(TSBusDbForm, SBusDbForm);
  Application.CreateForm(TPanelLayoutForm, PanelLayoutForm);
  Application.CreateForm(TUiPanelKeyButtonForm, UiPanelKeyButtonForm);
  Application.CreateForm(TSbDeviceForm, SbDeviceForm);
  Application.CreateForm(TSbDeviceTypeForm, SbDeviceTypeForm);
  Application.CreateForm(TSbPanelTypeForm, SbPanelTypeForm);
  //Application.CreateForm(TProgramListForm, ProgramListForm);
  //  Application.CreateForm(TXPTLayoutForm, XPTLayoutForm);
  //  Application.CreateForm(TListForm, ListForm);
  Application.Run;

  ReleaseMuteX( hMuteX );

end.
