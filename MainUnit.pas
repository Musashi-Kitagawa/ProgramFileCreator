//*****************************************************************************
//  ニューテレステクノ株式会社殿向け PROGRAM FILE CREATOR」
//  メイン画面
//
//  Dec - 25 - '20
//  武蔵株式会社
//*****************************************************************************
unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Types, Vcl.Graphics, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, System.Contnrs,
//
    ScreenDbUnit, ConfigDataUnit, CommonUnit, MusFlatButton;

type
  TMainForm = class(TForm)
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton12: TToolButton;
    CategoryButton: TToolButton;
    ToolButton14: TToolButton;
    ImageList1: TImageList;
    GroupButton: TToolButton;
    ListButton: TToolButton;
    ToolButton6: TToolButton;
    LayoutButton: TToolButton;
    ListToolButton: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ListPopupMenu: TPopupMenu;
    UiFrame1: TMenuItem;
    N1: TMenuItem;
    UiDstButton1: TMenuItem;
    UiSrcButton1: TMenuItem;
    ToolButton1: TToolButton;
    UiScreenSelectButton1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    UiPanelDstButton1: TMenuItem;
    UiPanelDstButton2: TMenuItem;
    SelectComboBox: TComboBox;
    DSPanel: TPanel;
    DestRadioButton: TRadioButton;
    SrcRadioButton: TRadioButton;
    CategoryComboBox: TComboBox;
    GroupComboBox: TComboBox;
    Panel2: TPanel;
    Label1: TLabel;
    SaveButton: TMusFlatButton;
    UndoButton: TMusFlatButton;
    RedoButton: TMusFlatButton;
    SelectLabel: TLabel;
    CateLabel: TLabel;
    GroupLabel: TLabel;
    SelectLabel2: TLabel;
    SelectComboBox2: TComboBox;
    GroupLabel2: TLabel;
    GroupComboBox2: TComboBox;
    N4: TMenuItem;
    SBusDB1: TMenuItem;
    MusFlatButton1: TMusFlatButton;
    ProgramButton: TToolButton;
    ToolButton9: TToolButton;
    BanPopupMenu: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    UiContent1: TMenuItem;
    N10: TMenuItem;
    N7: TMenuItem;
    DisplayDb1: TMenuItem;
    PanelLayoutButton: TToolButton;
    DevPopupMenu: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ToolButton8: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure CategoryButtonClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UiFrame1Click(Sender: TObject);
    procedure ListToolButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure SelectComboBoxChange(Sender: TObject);
    procedure CategoryComboBoxChange(Sender: TObject);
    procedure GroupComboBoxChange(Sender: TObject);
    procedure DestRadioButtonClick(Sender: TObject);
    procedure UndoButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure RebuildButtonClick(Sender: TObject);
    procedure SelectComboBox2Change(Sender: TObject);
    procedure GroupComboBox2Change(Sender: TObject);
    procedure SBusDB1Click(Sender: TObject);
    procedure MusFlatButton1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DisplayDb1Click(Sender: TObject);
  private
    { Private 宣言 }

    FConfigData         : TConfigData;
    FScreenList         : TScreenList;
//    FProgramList        : TProgramDb;
    FProgramIndexDb     : TProgramIndexDb;
    FSBusDb             : TSbusDb;
    FDisplayList        : TDisplayList;

    // レイアウト管理データ
//    FLayoutData         : array [0..MAX_TYPE-1] of TLayoutData;
//    FListLayout       : array [0..MAX_TYPE-1] of TListLayout;
    FListLayoutList     : array [0..MAX_TYPE-1] of TListLayoutList;
    FLayoutBlockList    : TLayoutBlockList;
    FPgmLayoutList      : TListLayoutList;
    FPanelKeyLayout     : TLayoutData;
    FDeviceLayoutList   : TListLayoutList;

    FXptRangeList       : array [0..1] of TXptRangeList;

    procedure   LoadDatabase;
    procedure   MakeWorkDir;
    procedure   MakeLayoutWorkData;
    procedure   MakePanelLayoutWorkData;
    procedure   MakeNewCategoryPanel;
//    procedure   MakeListLayoutWorkData;
    procedure   MakeListLayoutWorkData2;
    procedure   MakeProgramLayout( lsType : string; loLst : TListLayoutList );
//    procedure   MakeProgramLayout;
//    procedure   MakeDeviceListLayout;

    procedure   MakeProgramIndexList;
    procedure   MakePanelKeyWork;
    function    GetLayoutTable( cate : TLayoutButton; uf2 : TUiFrame; btnFrame : TUiFrame; ds : integer ) : TLayoutData;
    function    MakeGroupButton( id, parentId : integer; frmName : string; txt : string ) : TUiScreenSelectButton;
    function    MakeGroupFrame( id, parentId : integer; name, note : string; ds : integer ) : TUiFrame;
    procedure   CompareLayout( lay : TLayoutData; lst : TScreenList );
    procedure   CompareListLayout( lay : TListLayout );
    function    _GetMaxDestinationId( lay : TLayoutData; dType, ds, startId : integer ) : integer;
    function    GetMaxFrameId{( typ : integer )}: integer;
    function    _GetMaxFrameId( lay : TLayoutData; startId : integer ) : integer;
    function    GetMaxScreenSelectButtonId{( typ : integer )}: integer;
    function    _GetMaxScreenSelectButtonId( lay : TLayoutData; startId : integer ) : integer;
    function    GetCategory : TLayoutButton;
    function    GetCategoryList : TLayoutButtonList;
    function    GetDestSource : integer;
    function    GetCurrentGroup : integer;
    function    GetCurrentCategory : integer;
    function    GetCurrentDataSet : integer;
    function    GetCurrentListType : integer;
    function    GetCurrentListGroup : integer;
    procedure   MakeGroupCombo;
    procedure   MakeGroupListCombo;
    procedure   MakeCategoryCombo;
    function    GetGroup : TLayoutData;
    function    GetDestSourceType : integer;
    function    GetGroupLayoutList : TLayoutButtonList;
    function    GetGroupLayout : TLayoutData;
    function    _GetGroupLayoutList( g : integer ) : TLayoutButtonList;
    function    _GetGroupLayout( g : integer ) : TLayoutData;
//    function    GetColumnList( grp : integer ) : TColumnList;
    function    CurrentSetting : integer;
    procedure   DeleteButton( frid : integer );
    procedure   CategoryAllDelete;
    procedure   CategoryAllDeletePanel;
    function    GetColumnList : TColumnList;
    procedure   ToolButtonProc( nm : string; tg : integer );
    function    GetAlias( key : string; ds : integer ) : integer;

    function    GetListLayoutList : TListLayoutList;

    procedure   MakeNewCategory;
    procedure   MakeXptRangeTable;


  public
    { Public 宣言 }

    FLayoutData         : array [0..MAX_TYPE-1] of TLayoutData;

    function    MAX_CATEGORY : integer;
    function    MAX_GROUP : integer;

    procedure   SaveDataBase;
    procedure   SaveDataBase2;
    procedure   DeleteDataBase( sc : TScreenDb );
    procedure   AddDataBase( sc : TScreenDb );
    procedure   MakeUndo( opt : integer=1 );
    function    GetMaxDestinationId( ds : integer ): integer;
    function    MakeDestinationButton( id : integer; parentId : integer; port : integer; ds : integer ) : TUiButton;
    procedure   RebuildProc;
//    function    CheckXptPortRange( port : integer; ds : integer ) : integer;
    function    CheckXptPortRange( var port : integer; ds : integer ) : Boolean;

    // [PRPERTY]
    property    ConfigData : TConfigData    read FConfigData;
    property    ScreenList : TScreenList    read FScreenList    write FScreenList;
    property    SBusDb : TSBusDb            read FSBusDb        write FSBusDb;
    property    ProgramIndexDb : TProgramIndexDb                read FProgramIndexDb;
    property    CurrentGroup : integer      read GetCurrentGroup;
    property    CurrentCategory : integer   read GetCurrentCategory;
    property    DestSource : integer        read GetDestSource;
    property    CurrentDataSet : integer    read GetCurrentDataSet;
    property    CurrentListType : integer   read GetCurrentListType;
    property    CurrentListGroup : integer  read GetCurrentListGroup;
    property    CategoryList : TLayoutButtonList                read GetCategoryList;
    property    _GroupLayoutList[g:integer] : TLayoutButtonList read _GetGroupLayoutList;
    property    _GroupLayout[g:integer] : TLayoutData           read _GetGroupLayout;
    property    GroupLayoutList : TLayoutButtonList             read GetGroupLayoutList;
    property    GroupLayout : TLayoutData                       read GetGroupLayout;
    property    Group : TLayoutData         read GetGroup;
    property    DestSourceType : integer    read GetDestSourceType;
    property    Category : TLayoutButton    read GetCategory;
    property    ColumnList : TColumnList    read GetColumnList;
    property    ListLayoutList : TListLayoutList                read GetListLayoutList;
    property    ProgramLayoutList : TListLayoutList             read FPgmLayoutList;
    property    PanelKeyLayoutData : TLayoutData                read FPanelKeyLayout;
    property    DeviceLayoutList : TListLayoutList               read FDeviceLayoutList;


//    property    ProgramList : TProgramDb    read FProgramList   write FProgramList;

  const
    typXPT          = 0;     // クロスポイント用データタイプ
    typPanel        = 1;     // パネル用データタイプ

    typMainteList   = 0;
    typNameList     = 1;

    typDst          = 0;
    typSrc          = 1;

  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
    GroupCategoryUnit, GroupUnit, ListUnit, XPTLayoutUnit, ProgramListUnit,
    MessageUnit, LogUtilUnit, ConfigUnit, UiDstButtonListUnit, SBusDbUnit,
    ProgramCategoryUnit, UiFrameUnit, UiContentUnit, DisplayDbUnit,
  PanelLayoutUnit;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.MAX_CATEGORY : integer;
begin
    Result := FConfigData.MaxCategory;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.MAX_GROUP : integer;
begin
    Result := FConfigData.MaxGroup;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetColumnList : TColumnList;
begin
//    Result := FListLayout[ CurrentListType ].ColumnList[ DestSource ];
    Result := FListLayoutList[ CurrentListType ].Data[ CurrentListGroup ].ColumnList[ DestSource ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetListLayoutList : TListLayoutList;
begin
    Result := FListLayoutList[ CurrentListType ];
end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetCategoryList : TLayoutButtonList;
begin
    Result := FLayoutData[ CurrentDataSet ].List;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetCategory : TLayoutButton;
begin
    Result := FLayoutData[ CurrentDataSet ].List.Data[ CurrentCategory ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetGroupLayout : TLayoutData;
begin
    Result := FLayoutData[ CurrentDataSet ].GroupLayout[ CurrentCategory, CurrentGroup, DestSource ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetGroupLayoutList : TLayoutButtonList;
begin
    Result := GetGroupLayout.List;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm._GetGroupLayout( g : integer ) : TLayoutData;
begin
    Result := FLayoutData[ CurrentDataSet ].GroupLayout[ CurrentCategory, g, DestSource ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm._GetGroupLayoutList( g : integer ) : TLayoutButtonList;
begin
    Result := _GetGroupLayout(g).List;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetGroup : TLayoutData;
begin
    Result := FLayoutData[ CurrentDataSet ].Group[ CurrentCategory, DestSource ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetDestSourceType : integer;
begin
    Result := (SelectComboBox.ItemIndex * 2) + DestSource;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetDestSource : integer;
begin
    if True = DestRadioButton.Checked then  Result := 0
    else                                    Result := 1;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetCurrentGroup : integer;
begin
    Result := GroupComboBox.ItemIndex;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetCurrentCategory : integer;
begin
    Result := CategoryComboBox.ItemIndex;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetCurrentDataSet : integer;
begin
    Result := SelectComboBox.ItemIndex;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetCurrentListType : integer;
begin
    Result := SelectComboBox2.ItemIndex;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetCurrentListGroup : integer;
begin
    Result := GroupComboBox2.ItemIndex;
end;

//-----------------------------------------------------------------------------
//  ウィンドウ作成
//-----------------------------------------------------------------------------
procedure TMainForm.FormCreate(Sender: TObject);
var
    i : integer;
    fn : string;
    dt : TDateTime;

begin

    // INIファイル読み込み
    fn := ChangeFileExt( Application.ExeName, '.ini' );
    FConfigData := TConfigData.Create( fn );

    // ワークディレクトリ作成
    MakeWorkDir;

    // バージョン
    FileAge( Application.ExeName, dt );
    Caption := FConfigData.AppTitle
                + '  Ver.' + GetAppVersion( Application.ExeName )
                + '  ' + DateTimeToStr( dt );
{log}SetOpeLog( 'OPE:FormCreate' + Caption );

    // レイアウト用ボタン初期化
    for i:=0 to HIGH( FLayoutData ) do begin
        FLayoutData[i]      := TLayoutData.Create;
//        FListLayout[i]      := TListLayout.Create;
        FListLayoutList[i]  := TListLayoutList.Create;
    end;

    // 番組レイアウト用
    FPgmLayoutList          := TListLayoutList.Create;

    // UNDO/REDO用
    FLayoutBlockList    := TLayoutBlockList.Create;

    // データベース読み込み用
    FScreenList         := TScreenList.Create;
    FSBusDb             := TSBusDb.Create;

    // パネルキーレイアウト用
    FPanelKeyLayout     := TLayoutData.Create;
    FDeviceLayoutList   := TListLayoutList.Create;


//    FProgramList    := TProgramDb.Create;
end;

//-----------------------------------------------------------------------------
// ワークディレクトリ作成
//-----------------------------------------------------------------------------
procedure TMainForm.MakeWorkDir;
var
    exe : string;

begin
    // EXEディレクトリ
    exe := ExtractFileDir( Application.ExeName );

    // ログディレクトリ作成
    CreateLogFile( exe + '\LOG\', 30, 0 );

end;

//-----------------------------------------------------------------------------
//  現在設定画面取得
//-----------------------------------------------------------------------------
function TMainForm.CurrentSetting : integer;
begin
    if True = CategoryButton.Down then      Result := CategoryButton.Tag
    else if True = GroupButton.Down then    Result := GroupButton.Tag
    else if True = ListButton.Down then     Result := ListButton.Tag
    else if True = LayoutButton.Down then   Result := LayoutButton.Tag
    else                                    Result := -1;

{log}SetOpeLog( 'OPE:CurrentSetting', Result );
end;

//-----------------------------------------------------------------------------
//  画面選択ボタン押下
//-----------------------------------------------------------------------------
procedure TMainForm.CategoryButtonClick(Sender: TObject);
begin
    ToolButtonProc( TToolButton( Sender ).Caption, TToolButton( Sender ).Tag );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TMainForm.N5Click(Sender: TObject);
begin
    ToolButtonProc( TMenuItem( Sender ).Caption, TMenuItem( Sender ).Tag );
end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TMainForm.ToolButtonProc( nm : string; tg : integer );
begin
{log}SetOpeLog( 'OPE:CategoryButtonClick', nm );

    GroupCategoryForm.Visible   := (tg = 0);
    GroupForm.Visible           := (tg = 1);
    ListForm.Visible            := (tg = 2);
    XPTLayoutForm.Visible       := (tg = 3);

    ProgramListForm.Visible     := (tg = 4) or (tg = 7);

    ProgramCategoryForm.Visible := (tg = 5);
    PanelLayoutForm.Visible     := (tg = 6);

    CategoryButton.Down         := GroupCategoryForm.Visible;
    GroupButton.Down            := GroupForm.Visible;
    ListButton.Down             := ListForm.Visible;
    LayoutButton.Down           := XPTLayoutForm.Visible;
    ProgramButton.Down          := (ProgramListForm.Visible or ProgramCategoryForm.Visible);
    PanelLayoutButton.Down      := PanelLayoutForm.Visible;

    case tg of
    0:  // カテゴリ編集
        begin
            SelectComboBox.Visible      := True;
            SelectComboBox.Parent       := GroupCategoryForm;
            SelectComboBox.Top          := 30;

            SelectLabel.Visible         := True;
            SelectLabel.Parent          := GroupCategoryForm;
            SelectLabel.Top             := 20-8;

            CategoryComboBox.Visible    := False;
            CateLabel.Visible           := False;
            GroupComboBox.Visible       := False;
            GroupLabel.Visible          := False;

            SelectComboBox2.Visible     := False;
            SelectLabel2.Visible        := False;
            GroupComboBox2.Visible      := False;
            GroupLabel2.Visible         := False;

            DSPanel.Visible             := False;

            GroupCategoryForm.DispCategory;
        end;

    1:  // グループ編集
        begin
            SelectComboBox.Visible      := True;
            SelectComboBox.Parent       := GroupForm;
            SelectComboBox.Top          := 30;

            SelectLabel.Visible         := True;
            SelectLabel.Parent          := GroupForm;
            SelectLabel.Top             := 20-8;

            CategoryComboBox.Visible    := True;
            CategoryComboBox.Parent     := GroupForm;
            CategoryComboBox.Top        := 30;

            CateLabel.Visible           := True;
            CateLabel.Parent            := GroupForm;
            CateLabel.Top               := 20-8;

            DSPanel.Visible             := True;
            DSPanel.Parent              := GroupForm;
            DSPanel.Top                 := 30;

            GroupComboBox.Visible       := False;
            GroupLabel.Visible          := False;

            SelectComboBox2.Visible     := False;
            SelectLabel2.Visible        := False;
            GroupComboBox2.Visible      := False;
            GroupLabel2.Visible         := False;

            MakeCategoryCombo;

            GroupForm.DispXPTGroup; //( 0 );
        end;

    2:  // リスト表示
        begin
            SelectComboBox2.Visible     := True;
            SelectComboBox2.Parent      := ListForm;
            SelectComboBox2.Top         := 30;

            SelectLabel2.Visible        := True;
            SelectLabel2.Parent         := ListForm;
            SelectLabel2.Top            := 20-8;

            GroupComboBox2.Visible      := True;
            GroupComboBox2.Parent       := ListForm;
            GroupComboBox2.Top          := 30;

            GroupLabel2.Visible         := True;
            GroupLabel2.Parent          := ListForm;
            GroupLabel2.Top             := 20-8;

            DSPanel.Visible             := True;
            DSPanel.Parent              := ListForm;
            DSPanel.Top                 := 30;

            SelectComboBox.Visible      := False;
            SelectLabel.Visible         := False;
            CategoryComboBox.Visible    := False;
            CateLabel.Visible           := False;
            GroupComboBox.Visible       := False;
            GroupLabel.Visible          := False;

            MakeGroupListCombo;

            ListForm.DispLists;
        end;

    3:  // レイアウト編集
        begin
            SelectComboBox.Visible      := True;
            SelectComboBox.Parent       := XPTLayoutForm;
            SelectComboBox.Top          := 30;

            SelectLabel.Visible         := True;
            SelectLabel.Parent          := XPTLayoutForm;
            SelectLabel.Top             := 20-8;

            CategoryComboBox.Visible    := True;
            CategoryComboBox.Parent     := XPTLayoutForm;
            CategoryComboBox.Top        := 30;

            CateLabel.Visible           := True;
            CateLabel.Parent            := XPTLayoutForm;
            CateLabel.Top               := 20-8;

            GroupComboBox.Visible       := True;
            GroupComboBox.Parent        := XPTLayoutForm;
            GroupComboBox.Top           := 30;

            GroupLabel.Visible          := True;
            GroupLabel.Parent           := XPTLayoutForm;
            GroupLabel.Top              := 20-8;

            DSPanel.Visible             := True;
            DSPanel.Parent              := XPTLayoutForm;
            DSPanel.Top                 := 30;

            SelectComboBox2.Visible     := False;
            SelectLabel2.Visible        := False;
            GroupComboBox2.Visible      := False;
            GroupLabel2.Visible         := False;

            MakeCategoryCombo;
            MakeGroupCombo;

            XPTLayoutForm.DispXptLayout;
        end;

    4:  // 番組レイアウト編集
        begin
            SelectComboBox.Visible      := False;
            SelectLabel.Visible         := False;
            CategoryComboBox.Visible    := False;
            CateLabel.Visible           := False;
            GroupComboBox.Visible       := False;
            GroupLabel.Visible          := False;

            SelectComboBox2.Visible     := False;
            SelectLabel2.Visible        := False;
            GroupComboBox2.Visible      := False;
            GroupLabel2.Visible         := False;

            DSPanel.Visible             := False;

            ProgramListForm.DispLayout( TProgramListForm.modeProg );
        end;

    5:  // 番組レイアウト編集
        begin
            SelectComboBox.Visible      := False;
            SelectLabel.Visible         := False;
            CategoryComboBox.Visible    := False;
            CateLabel.Visible           := False;
            GroupComboBox.Visible       := False;
            GroupLabel.Visible          := False;

            SelectComboBox2.Visible     := False;
            SelectLabel2.Visible        := False;
            GroupComboBox2.Visible      := False;
            GroupLabel2.Visible         := False;

            DSPanel.Visible             := False;

//            ProgramCategoryForm.DispCategory;
        end;

    6:  // PANELレイアウト
        begin

            // レイアウト表示
            PanelLayoutForm.DispLayout;

        end;

    7:  // ディバイスリストレイアウト
        begin

            ProgramListForm.DispLayout( TProgramListForm.modeDevice );

        end;

    end;

end;

//-----------------------------------------------------------------------------
//  グループボタン作成
//-----------------------------------------------------------------------------
function TMainForm.MakeGroupButton(
    id, parentId : integer;
    frmName : string;
    txt : string ) : TUiScreenSelectButton;

var
    btn  : TUiScreenSelectButton;

begin
{log}SetOpeLog( 'OPE:MakeGroupButton', IntToStr(id), IntToStr(parentId), frmName );

    btn := TUiScreenSelectButton.Create;

    btn.F_Id                := id;

    btn.F_Text              := txt;
    btn.E_Text              := True;

    btn.F_FrameId           := IntToStr( parentId );
    btn.E_FrameId           := True;

    btn.F_FrameName         := frmName;
    btn.E_FrameName         := True;

    btn.F_Order             := '1';
    btn.E_Order             := True;

    btn.F_Top               := '.0';    btn.E_Top       := True;
    btn.F_Left              := '.1';    btn.E_Left      := True;
    btn.F_Width             := '.1';    btn.E_Width     := True;
    btn.F_Height            := '.1';    btn.E_Height    := True;

    btn.F_IncludeHeadBar    := 'false';
    btn.E_IncludeHeadBar    := True;

    btn.F_IsPermissionHandled   := 'true';
    btn.E_IsPermissionHandled   := True;

    btn.F_IsSelectionCancel := 'true';
    btn.E_IsSelectionCancel := True;

    Result := btn;
end;

//-----------------------------------------------------------------------------
//  グループフレーム作成
//-----------------------------------------------------------------------------
function TMainForm.MakeGroupFrame(
    id, parentId : integer;
    name : string;
    note : string;
    ds : integer ) : TUiFrame;

var
    uf3 : TUiFrame;

begin
{log}SetOpeLog( 'OPE:MakeGroupFrame', IntToStr(id), IntToStr(parentId), name );

    uf3 := TUiFrame.Create;

    uf3.F_Id                := id;

    uf3.F_Name              := name;
    uf3.E_Name              := True;

    uf3.F_Note              := note;
    uf3.E_Note              := True;

    uf3.F_ParentFrameId     := IntToStr( parentId );
    uf3.E_ParentFrameId     := True;

    uf3.F_TitleBarVisible   := 'false';
    uf3.E_TitleBarVisible   := True;

    if ds = 0 then begin
        // DESTINATION

        uf3.F_Type          := 'Xpt.Dst';
        uf3.E_Type          := True;

        uf3.F_ColCount      := '10';
        uf3.E_ColCount      := True;

        uf3.F_RowCount      := '5';
        uf3.E_RowCount      := True;
    end
    else begin
        // SOURCE

        uf3.F_Type          := 'Xpt.Src';
        uf3.E_Type          := True;

//        uf3.F_ColCount      := '16';
        uf3.F_ColCount      := '10';
        uf3.E_ColCount      := True;

//        uf3.F_RowCount      := '3';
        uf3.F_RowCount      := '5';
        uf3.E_RowCount      := True;
    end;

    uf3.F_IsModal           := 'false';
    uf3.E_IsModal           := True;

    // 以下暫定

    uf3.F_Order             := '1';
    uf3.E_Order             := True;

    uf3.F_Top               := '0';     uf3.E_Top       := True;
    uf3.F_Left              := '0';     uf3.E_Left      := True;
    uf3.F_Width             := '100';   uf3.E_Width     := True;
    uf3.F_Height            := '100';   uf3.E_Height    := True;

    Result := uf3;
end;

//-----------------------------------------------------------------------------
//  XPT DEST/SOURCE. PANEL DEST/SOURCE ボタン作成
//-----------------------------------------------------------------------------
function TMainForm.MakeDestinationButton(
    id : integer;
    parentId : integer;
    port : integer;
    ds : integer ) : TUiButton;

var
    dst : TUiDstButton;
    src : TUiSrcButton;
    pdst : TUiPanelDstButton;
    psrc : TUiPanelSrcButton;

begin
{log}SetOpeLog( 'OPE:MakeDestinationButton', id, parentId, port );

    Result := nil;

    case SelectComboBox.ItemIndex of
    typXPT:
        begin
            if ds = 0 then begin
                // DESTINATION

                dst := TUiDstButton.Create;

                dst.F_DstPortNo := IntToStr( port );
                dst.E_DstPortNo := True;

                dst.F_Left      := '.0';
                dst.E_Left      := True;

                dst.F_Top       := '.0';
                dst.E_Top       := True;

                dst.F_Width     := '.1';
                dst.E_Width     := True;

                dst.F_Height    := '.1';
                dst.E_Height    := True;

                dst.F_FrameId   := IntToStr( parentId );    //glay.Frame.F_Id );
                dst.E_FrameId   := True;

                dst.F_Order     := '1';
                dst.E_Order     := True;

                dst.F_Id        := id;      //2000;
                dst.E_Id        := True;

                Result          := dst;
            end
            else begin
                // SOURCE

                src := TUiSrcButton.Create;

                src.F_SrcPortNo := IntToStr( port );       //((pg*50)+i) + 1{端子番号} );
                src.E_SrcPortNo := True;

                src.F_Left      := '.0';
                src.E_Left      := True;

                src.F_Top       := '.0';
                src.E_Top       := True;

                src.F_Width     := '.1';
                src.E_Width     := True;

                src.F_Height    := '.1';
                src.E_Height    := True;

                src.F_FrameId   := IntToStr( parentId );    //glay.Frame.F_Id );
                src.E_FrameId   := True;

                src.F_Order     := '1';
                src.E_Order     := True;

                src.F_Id        := id;          //2000;
                src.E_Id        := True;

                Result          := src;
            end;
        end;

    typPanel:
        begin

            if ds = 0 then begin
                // PANEL + DESTINATION

                pdst                := TUiPanelDstButton.Create;

                pdst.F_DstPortNo    := IntToStr( port );
                pdst.E_DstPortNo    := True;

                pdst.F_Left         := '.0';
                pdst.E_Left         := True;

                pdst.F_Top          := '.0';
                pdst.E_Top          := True;

                pdst.F_Width        := '.1';
                pdst.E_Width        := True;

                pdst.F_Height       := '.1';
                pdst.E_Height       := True;

                pdst.F_FrameId      := IntToStr( parentId );    //glay.Frame.F_Id );
                pdst.E_FrameId      := True;

                pdst.F_Order        := '1';
                pdst.E_Order        := True;

                pdst.F_Id           := id;      //2000;
                pdst.E_Id           := True;

                Result              := pdst;
            end
            else begin
                // SOURCE

                psrc                := TUiPanelSrcButton.Create;

                psrc.F_SrcPortNo    := IntToStr( port );       //((pg*50)+i) + 1{端子番号} );
                psrc.E_SrcPortNo    := True;

                psrc.F_Left         := '.0';
                psrc.E_Left         := True;

                psrc.F_Top          := '.0';
                psrc.E_Top          := True;

                psrc.F_Width        := '.1';
                psrc.E_Width        := True;

                psrc.F_Height       := '.1';
                psrc.E_Height       := True;

                psrc.F_FrameId      := IntToStr( parentId );    //glay.Frame.F_Id );
                psrc.E_FrameId      := True;

                psrc.F_Order        := '1';
                psrc.E_Order        := True;

                psrc.F_Id           := id;          //2000;
                psrc.E_Id           := True;

                Result              := psrc;
            end;
        end;

    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetLayoutTable( cate : TLayoutButton; uf2 : TUiFrame; btnFrame : TUiFrame; ds : integer ) : TLayoutData;
const
    tbl : array [0..1] of integer = (UiDstButton_No, UiSrcButton_No);
    tbl2 : array [0..1] of string = ( '.Dst', '.Src' );

var
    k, j, cnt : integer;
    lst2, lst3 : TScreenList;
    uf3 : TUiFrame;
    ld, ld3 : TLayoutData;
    ch, ch3 : TLayoutButton;
    btn  : TUiScreenSelectButton;

begin
{log}SetOpeLog( 'OPE:GetLayoutTable' );

    // フレーム内のボタンを探す
    lst2 := TScreenList.Create;
    FScreenList.SearchSource( UiScreenSelectButton_No, IntToStr( uf2.F_Id ), lst2 );

    lst3 := TScreenList.Create;

    ld := TLayoutData.Create;
//    ld.Frame    := uf2;
    ld.Frame    := uf2.Clone;

    cate.Child[ ds ]    := ld;

    // 以降クローンを使う
    uf2 := ld.Frame;

    cnt := lst2.Count;

    for j:=0 to MAX_GROUP-1 do begin

        ch  := TLayoutButton.Create;

        if j < cnt then begin

            ch.FButton  := lst2.Data[j].Clone;

        end
        else begin

            //** グループ数に満たない場合、グループボタン作成

            btn := MakeGroupButton(
                        GetMaxScreenSelectButtonId{( typXpt )}, // ID
                        uf2.F_Id,                               // 親ID
                        TUiScreenSelectButton( cate.Fbutton ).F_Framename + Format( '%s.Gp%d', [tbl2[ds], (j+1)] ),
  //                      'XptDst.SGp' + IntToStr( __cnt2 + 7 ),  // FRAME NAME
                        'Musashi-' + IntToStr(j)                // TEXT
                    );

            ch.FButton  := btn;
        end;

        ld.List.Add( ch );

        // DST/SRC フレーム
        uf3 := TUiFrame( FScreenList.SearchByName( UiFrame_No, TUiScreenSelectButton(ch.FButton).F_FrameName ) );

        if uf3 = nil then begin

            uf3 := MakeGroupFrame(
                        GetMaxFrameId{( typXpt )},              // ID
                        btnFrame.F_Id,                          // 親ID
                        TUiScreenSelectButton( cate.Fbutton ).F_Framename + Format( '%s.Gp%d', [tbl2[ds], (j+1)] ),
//                        'XptDst.SGp' + IntToStr( __cnt2 + 7 ),  // NAME
                        'Musashi-' + IntToStr(j),               // NOTE
                        ds                      // DEST/SOURCE
                );

//            Inc( __cnt2 );

        end
        else begin

            // クローンを作成
            uf3 := uf3.Clone;
        end;

        // グループ最大カラム数
        uf2.F_ColCount      := IntToStr( MAX_GROUP );
        uf2.E_ColCount      := True;

        // フレームの調整
//        if uf3 <> nil then begin

//            uf3.F_Order         := IntToStr( j + 1 + 1 );
            uf3.F_Order         := IntToStr( j + 1 + 1 );       //暫定
            uf3.E_Order         := True;

            // フレーム内のボタン収集
            lst3.Empty;
            FScreenList.SearchSource( tbl[ ds ], IntToStr( uf3.F_Id ), lst3 );

            // レイアウトデータ作成
            ld3 := TLayoutData.Create;
            ld3.Frame    := uf3;

            // グループのボタン
            for k:=0 to lst3.count-1 do begin
                ch3          := TLayoutButton.Create;
                ch3.FButton  := lst3.Data[k].Clone;
                ld3.List.Add( ch3 );
            end;

            ch.Child[ ds ] := ld3;

//        end;

    end;

    // グループボタンの整列 （ワーク用用）
    ld.Frame.f_ColCount := IntToStr( ld.List.count );
    for j:=0 to ld.List.count-1 do begin

        btn  := TUiScreenSelectButton( ld.List.Data[j].Button );

        // 位置、サイズ
        btn.F_Left    := Format( '.%d', [j] );
        btn.F_Width   := '.1';

        // ORDER（とってもだいじ！！）
//        btn.F_Order   := IntToStr(j+1);
        btn.F_Order   := IntToStr(j+1+1);       //暫定
    end;

    // ORDER順に並び替え
    ld.List.SortButtonOrder;

    lst3.Empty;     lst3.Free;
    lst2.Empty;     lst2.Free;

    Result := ld;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TMainForm.FormShow(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:FormShow' );

    GroupCategoryForm           := TGroupCategoryForm.Create( Self );
    GroupCategoryForm.Parent    := Self;
    GroupCategoryForm.Align     := alClient;
    GroupCategoryForm.Visible   := True;
    GroupCategoryForm.Show;

    GroupForm                   := TGroupForm.Create( Self );
    GroupForm.Parent            := Self;
    GroupForm.Align             := alClient;
    GroupForm.Visible           := False;
//    GroupForm.Show;

    ListForm                    := TListForm.Create( Self );
    ListForm.Parent             := Self;
    ListForm.Align              := alClient;
    ListForm.Visible            := False;
//    ListForm.Show;

    XPTLayoutForm               := TXPTLayoutForm.Create( Self );
    XPTLayoutForm.Parent        := Self;
    XPTLayoutForm.Align         := alClient;
    XPTLayoutForm.Visible       := False;

    ProgramListForm             := TProgramListForm.Create( Self );
    ProgramListForm.Parent      := Self;
    ProgramListForm.Align       := alClient;
    ProgramListForm.Visible     := False;

    ProgramCategoryForm         := TProgramCategoryForm.Create( Self );
    ProgramCategoryForm.Parent  := Self;
    ProgramCategoryForm.Align   := alClient;
    ProgramCategoryForm.Visible := False;

    PanelLayoutForm             := TPanelLayoutForm.Create( Self );
    PanelLayoutForm.Parent      := Self;
    PanelLayoutForm.Align       := alClient;
    PanelLayoutForm.Visible     := False;


    // DB読み込み
    LoadDatabase;

    MessageForm.Start( 'レイアウトデータ作成中...' );

    // レイアウト用データ作成(XPT)
    MakeLayoutWorkData;

    // レイアウト用データ作成(PANEL)
    MakePanelLayoutWorkData;

    // リスト用データ作成(MAINTE、PORT)
//    MakeListLayoutWorkData;
    MakeListLayoutWorkData2;

    // 番組レイアウト用
    MakeProgramLayout( 'UiProgramList', FPgmLayoutList );

    MakeProgramIndexList;

    // UNDO/REDOデータ作成
    MakeUndo( 0{初期化} );

    // パネルレイアウト初期化
    MakePanelKeyWork;
    PanelLayoutForm.MakeDeviceList;
//    MakeDeviceListLayout;
    MakeProgramLayout( 'Set.Device', FDeviceLayoutList );

    // XPTレンジテーブル作成
    MakeXptRangeTable;

    // はじめにカテゴリ編集
    CategoryButtonClick( CategoryButton );
//    GroupCategoryForm.DispCategory;

    MessageForm.Close;
end;

//-----------------------------------------------------------------------------
//  UNDO/REDOデータ作成
//-----------------------------------------------------------------------------
procedure TMainForm.MakeUndo( opt : integer );
var
    i, n : integer;
    d : TLayoutBlock;

begin

    // ポインタ～トップまで削除
    n := (FLayoutBlockList.Count - FLayoutBlockList.Writer) - 1;
    for i:=0 to n-1 do begin
        d := FLayoutBlockList.Last;
        if d = nil then break;

        FLayoutBlockList.Extract( d );
        d.Free;
    end;

    FLayoutBlockList.Add( TLayoutBlock.Copy( FLayoutData ) );

    if opt = 0 then begin
        // 初期化の時
        FLayoutBlockList.Writer := 0;
    end
    else begin
        // UNDO追加
        FLayoutBlockList.IncWriter;
    end;

    // 最大値をオーバしたとき
    if FLayoutBlockList.Count > FConfigData.MaxUndo then begin
        // 一番古いデータを削除
        d := FLayoutBlockList.Data[0];
        FLayoutBlockList.Extract( d );

        if FLayoutBlockList.Writer >= FLayoutBlockList.Count then
            FLayoutBlockList.Writer := FLayoutBlockList.Count - 1;

        d.Free;
    end;

{deb}Label1.Caption := Format( '%d/%d', [FLayoutBlockList.Writer, FLayoutBlockList.Count] );

{log}SetOpeLog( 'OPE:MakeUndo', Label1.Caption );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TMainForm.UndoButtonClick(Sender: TObject);
var
    bk : TLayoutBlock;

begin
{log}SetOpeLog( 'OPE:UndoButtonClick', TButton( Sender ).Tag );

    case TButton( Sender ).Tag of
    0:  bk := FLayoutBlockList.Undo;    // UNDO取得
    1:  bk := FLayoutBlockList.Redo;    // REDO取得
    else Exit;
    end;

    // UNDOなし
    if bk = nil then Exit;

    // ワークデータへマージ
    bk.Restore( FLayoutData );

    // 再表示
    case CurrentSetting of
    0:  GroupCategoryForm.DispCategory; // カテゴリ設定
    1:  GroupForm.DispXPTGroup; //( 0 );    // グループ設定
    2:  ListForm.DispLists;             // リスト設定
    3:  XPTLayoutForm.DispXptLayout;    // レイアウト
    end;

{deb}Label1.Caption := Format( '%d/%d', [FLayoutBlockList.Writer, FLayoutBlockList.Count] );

{log}SetOpeLog( 'OPE:UndoButtonClick', IntToStr(TButton( Sender ).Tag), Label1.Caption );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function DEST_GROUP( c : integer ) : string;
begin
//    Result := 'DESTINATION GROUP SELECTOR';
    Result := Format( 'Xpt.Cate%d.Dst.GroupSelector', [c+1] );
end;

function DEST_SELECT( c : integer ) : string;
begin
//    Result := 'DESTINATION SELECTION';
    Result := Format( 'Xpt.Cate%d.Dst.GroupButton', [c+1] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function SOURCE_GROUP( c : integer) : string;
begin
    Result := Format( 'Xpt.Cate%d.Src.GroupSelector', [c+1] );
//    Result := 'SOURCE GROUP SELECTOR';
end;

function SOURCE_SELECT( c : integer ) : string;
begin
    Result := Format( 'Xpt.Cate%d.Src.GroupButton', [c+1] );
//    Result := 'SOURCE GROUP SELECTOR';
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function XPT_CATE_GROUP( c, g, ds : integer ) : string;
begin
    if ds = 0 then
        // DESTINATION
        Result := Format( 'Xpt.Cate%d.Dst.Gp%d', [(c+1), (g+1)] )
    else
        // SOURCE
        Result := Format( 'Xpt.Cate%d.Src.Gp%d', [(c+1), (g+1)] );
end;

//-----------------------------------------------------------------------------
//  ワークデータ作成（XPT）
//-----------------------------------------------------------------------------
procedure TMainForm.MakeNewCategory;
const
    XPT_ROOT        = 'XptDst.Root';

var
    uf, uf2, uf3, uf4 : TUiFrame;
    i, j, t : integer;
    sb : TUiScreenSelectButton;
    root : TUiFrame;
    tmargin, lmargin, hmargin, wmargin : string;

begin
{log}SetOpeLog( 'OPE:MakeLayoutWorkData' );

    tmargin     := Format( '%.1f', [FConfigData.TopMargin / 10] );
    lmargin     := Format( '%.1f', [FConfigData.LeftMargin / 10] );
    hmargin     := Format( '%.1f', [(1000 - FConfigData.TopMargin*2) / 10] );
    wmargin     := Format( '%.1f', [(1000 - FConfigData.LeftMargin*2) / 10] );

    // カテゴリパネル
    root    := TUiFrame( FScreenList.SearchByName( UiFrame_No, XPT_ROOT ) );

    // カテゴリパネル
    uf := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, FConfigData.XPTRootFrame ) );
    if uf = nil then begin
        WarningMessage( 'カテゴリフレームが見つかりません（XPT）。' );
        Exit;
    end;

//    // カテゴリのパネル（既存のものを使用する）
//    FLayoutData[ typXpt ].Frame     := uf.Clone;

    // カテゴリのボタン作成
    for j:=0 to MAX_CATEGORY-1 do begin

        // 新規カテゴリボタン作成
        sb := MakeGroupButton(
                GetMaxScreenSelectButtonId{( typPanel )},           // ID
                uf.F_Id,                                            // 親ID
                Format( 'Xpt.Cate%d', [(j+1)] ),                    // FRAME NAME
                Format( (FConfigData.CatePrifix + '%d'), [j+1] )    // TEXT
            );

        sb.F_Left       := Format( '.%d', [j] );
        sb.F_Top        := '0';
        sb.F_Width      := '.1';
        sb.F_Height     := '.1';
        sb.F_Order      := IntToStr( j + 1 );
        sb.E_Order      := true;

        // データベースへ登録
        AddDataBase( sb );

 //============================================================================

        // 親グループフレーム作成
        uf3 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    root.F_Id,                          // 親ID
                    Format( 'Xpt.Cate%d', [(j+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    0 );

//        uf3.F_Type          := 'Xpt.Cate';
//        uf3.E_Type          := True;
        uf3.F_ColCount      := '';
        uf3.E_ColCount      := false;
        uf3.F_RowCount      := '';
        uf3.E_RowCount      := false;

        // フレームサイズ、位置セット
        uf3.F_Left          := '0';    uf3.E_Left   := True;
        uf3.F_Top           := '0';    uf3.E_Top    := True;
        uf3.F_Width         := '100';  uf3.E_Width  := True;
        uf3.F_Height        := '100';  uf3.E_Height := True;
        uf3.F_Order         := IntToStr( j + 1 );
        uf3.E_Order         := true;

        // データベースへ登録
        AddDataBase( uf3 );

        t := 0;

//-- DESTグループセレクタ作成 -------------------------------------------------

        // フレーム作成
        uf2  := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},  // ID
                    uf3.F_Id,                   // 親ID
                    DEST_GROUP( j ),            // NAME
                    DEST_GROUP( j ),            // NOTE
                    0{DEST} );

        // フレーム内ボタン数（10x1）セット
//        uf2.F_Type          := 'Xpt.Src';
//        uf2.E_Type          := True;
        uf2.F_ColCount      := IntToStr( MAX_GROUP );
        uf2.E_ColCount      := True;
        uf2.F_RowCount      := '1';
        uf2.E_RowCount      := True;

        // フレームサイズセット
        uf2.F_Left          := '0';
        uf2.E_Left          := True;
        uf2.F_Top           := Format( '%dpx', [t] );     //''0';
        uf2.E_Top           := True;
        uf2.F_Width         := '100';
        uf2.E_Width         := True;
        uf2.F_Height        := Format( '%dpx', [FConfigData.XptGrpH] );     //'65px';
        uf2.E_Height        := True;

        t := t + FConfigData.XptGrpH;

        // データベースへ登録
        AddDataBase( uf2 );

        //-- DESTボタン作成
        for i:=0 to MAX_GROUP-1 do begin

            // グループボタン作成
            sb := MakeGroupButton(
                    GetMaxScreenSelectButtonId{( typPanel )},       // ID
                    uf2.F_Id,                                       // 親ID
                    XPT_CATE_GROUP( j, i, 0{DEST} ),                // FRAME NAME
                    Format( FConfigData.GroupPrifix+'%d', [(i+1)] ) // TEXT
                );

            sb.F_Left       := Format( '.%d', [i] );
            sb.F_Top        := '0';
            sb.F_Width      := '.1';
            sb.F_Height     := '.1';
            sb.F_Order      := IntToStr( i + 1 );
            sb.E_Order      := true;

            // データベースへ登録
            AddDataBase( sb );
        end;

//-- DESTグループボタン作成 ---------------------------------------------------
        uf2  := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},    // ID
                    uf3.F_Id,                   // 親ID
                    DEST_SELECT( j ),           // NAME
                    DEST_SELECT( j ),           // NOTE
                    0 );

        uf2.F_ColCount      := '';
        uf2.E_ColCount      := False;
        uf2.F_RowCount      := '';
        uf2.E_RowCount      := False;

        // フレームサイズセット
        uf2.F_Left          := '0';
        uf2.E_Left          := True;
        uf2.F_Top           := Format( '%dpx', [t] );     //''0';'65px';
        uf2.E_Top           := True;
        uf2.F_Width         := '100';
        uf2.E_Width         := True;
        uf2.F_Height        := Format( '%dpx', [FConfigData.XptDstH] );     //'355px';
        uf2.E_Height        := True;

        t := t + FConfigData.XptDstH;

        // データベースへ登録
        AddDataBase( uf2 );

        // DESTグループボタン作成
        for i:=0 to MAX_GROUP-1 do begin

            // カテゴリのボタン作成
            uf4 := MakeGroupFrame(
                        GetMaxFrameId{( typXpt )},            // ID
                        uf2.F_Id,                           // 親ID
                        XPT_CATE_GROUP( j, i, 0{DEST} ),    // FRAME NAME
                        XPT_CATE_GROUP( j, i, 0{DEST} ),    // NOTE
                        0{DEST} );

            // ボタンサイズ、位置セット
            uf4.F_Type      := 'Xpt.Dst';
            uf4.E_Type      := True;
            uf4.F_Left      := lmargin; //'1';
            uf4.F_Top       := tmargin; //'1';
            uf4.F_Width     := wmargin; //'98';
            uf4.F_Height    := hmargin; //'98';
            uf4.F_Order     := IntToStr( i + 1 );
            uf4.E_Order     := true;

            // データベースへ登録
            AddDataBase( uf4 );
        end;

//-- SOURCEグループセレクタ作成 -----------------------------------------------

        // フレーム作成
        uf2  := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},        // ID
                    uf3.F_Id,                       // 親ID
                    SOURCE_GROUP( j ),              // NAME
                    SOURCE_GROUP( j ),              // NOTE
                    1{SOURCE} );

        // ボタン数（10x1）セット
        uf2.F_ColCount      := IntToStr( MAX_GROUP );
        uf2.E_ColCount      := True;
        uf2.F_RowCount      := '1';
        uf2.E_RowCount      := True;

        // フレームサイズ設定
        uf2.F_Left          := '0';
        uf2.E_Left          := True;
        uf2.F_Top           := Format( '%dpx', [t] );       //'420px';
        uf2.E_Top           := True;
        uf2.F_Width         := '100';
        uf2.E_Width         := True;
        uf2.F_Height        := Format( '%dpx', [FConfigData.XptGrpH] );     //'65px';
        uf2.E_Height        := True;

        t := t + FConfigData.XptGrpH;

        // データベースへ登録
        AddDataBase( uf2 );

        // グループセレクタボタン作成
        for i:=0 to MAX_GROUP-1 do begin

            sb := MakeGroupButton(
                    GetMaxScreenSelectButtonId{( typPanel )},           // ID
                    uf2.F_Id,                                           // 親ID
                    XPT_CATE_GROUP( j, i, 1{SOURCE} ),                  // FRAME NAME
                    Format( FConfigData.GroupPrifix+ '%d', [(i+1)] )    // TEXT
                );

            // ボタンサイズ、位置セット
            sb.F_Left   := Format( '.%d', [i] );
            sb.F_Top    := '0';
            sb.F_Width  := '.1';
            sb.F_Height := '.1';
            sb.F_Order  := IntToStr( i + 1 );
            sb.E_Order  := true;

            // データベースへ登録
            AddDataBase( sb );
        end;

//-- SOURCEグループボタン作成 -------------------------------------------------

        // フレーム作成
        uf2  := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},    // ID
                    uf3.F_Id,                   // 親ID
                    SOURCE_SELECT( j ),         // NAME
                    SOURCE_SELECT( j ),         //  NOTE
                    1{SOURCE} );

        uf2.F_ColCount      := '';
        uf2.E_ColCount      := False;
        uf2.F_RowCount      := '';
        uf2.E_RowCount      := False;

        // フレーム位置、サイズセット
        uf2.F_Left          := '0';
        uf2.E_Left          := True;
        uf2.F_Top           := Format( '%dpx', [t] );      //'485px';
        uf2.E_Top           := True;
        uf2.F_Width         := '100';
        uf2.E_Width         := True;

        if 0 = FConfigData.XptSrcH then begin
            uf2.F_Height        := '';
            uf2.E_Height        := False;
        end
        else begin
            uf2.F_Height        := Format( '%dpx', [FConfigData.XptSrcH] );
            uf2.E_Height        := True;
        end;

        // データベースへ登録
        AddDataBase( uf2 );

        // グループフレーム作成作成
        for i:=0 to MAX_GROUP-1 do begin

            // カテゴリのボタン作成
            uf4 := MakeGroupFrame(
                        GetMaxFrameId{( typXpt )},                // ID
                        uf2.F_Id,                               // 親ID
                        XPT_CATE_GROUP( j, i, 1{SOURCE} ),      // NAME
                        XPT_CATE_GROUP( j, i, 1{SOURCE} ),      // NOTE
                        1{SOURCE} );

//            uf4.F_Type      := 'Xpt.Src';
//            uf4.E_Type      := True;

            // フレーム位置、サイズセット
            uf4.F_Left      := lmargin; //'1';
            uf4.F_Top       := tmargin; //'1';
            uf4.F_Width     := wmargin; //'98';
            uf4.F_Height    := hmargin; //'98';
            uf4.F_Order     := IntToStr( i + 1 );
            uf4.E_Order     := true;

            // データベースへ登録
            AddDataBase( uf4 );
        end;

//-----------------------------------------------------------------------------

    end;

    // カテゴリボタン最大数
    uf.F_ColCount   := IntToStr( MAX_CATEGORY );

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function MakeRAngeData( sl : TStringList ) : TXptRange;
var
    mx, mi : integer;

begin

    case sl.Count of
    2:
        begin
            mx := StrToIntDef( sl[1], -1 );
            mi := StrToIntDef( sl[0], -1 );
        end;

    1:
        begin
            mx := StrToIntDef( sl[0], -1 );
            mi := mx;
        end;

    else
        begin
            mx := -1;
            mi := -1;
        end;
    end;

    if (mx <> -1) and (mi <> -1) then
        Result := TXptRange.Create( mi, mx )
    else
        Result := nil;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.CheckXptPortRange( var port : integer; ds : integer ) : Boolean;
var
    p : integer;

begin
//    Result := True;
    p := port;

    while True do begin

        if False = FXptRangeList[ds].InRange( p ) then begin
            Inc( p );
            continue;
        end;

        Result := (p = port);

        port := p;

        Exit;
    end;

end;

//-----------------------------------------------------------------------------
//  XPTレンジテーブル作成
//-----------------------------------------------------------------------------
procedure TMainForm.MakeXptRangeTable;
var

    d : TSbXptBus;
    i, j, k : integer;
    sl1, sl2 : TStringList;
    r : TXptRange;
    str : array [0..1] of string;

begin

    sl1 := TStringList.Create;
    sl2 := TStringList.Create;

    FXptRangeList[0] := TXptRangeList.Create;
    FXptRangeList[1] := TXptRangeList.Create;

    for i:=0 to FSBusDb.SbXptBusList.Count-1 do begin

        d := FSBusDb.SbXptBusList.Data[i];

        str[0]  := d.F_DstPortNoRange;
        str[1]  := d.F_SrcPortNoRange;

        for j:=0 to HIGH( str ) do begin

            if '' = str[j] then continue;

            sl1.Clear;

            DivideString( str[j], sl1, ',' );

            for k:=0 to sl1.Count-1 do begin

                sl2.Clear;
                DivideString( sl1[k], sl2, '-' );

                r := MakeRAngeData( sl2 );
                if r <> nil then
                    FXptRangeList[j].Add( r );

            end;
        end;

    end;

    sl1.Free;
    sl2.Free;

end;


//-----------------------------------------------------------------------------
//  ワークデータ作成（XPT）
//-----------------------------------------------------------------------------
procedure TMainForm.MakeLayoutWorkData;
var
    uf, uf2, uf3 : TUiFrame;
    lst, lst2 : TScreenList;
    i, j : integer;
    sb : TUiScreenSelectButton;
    lb : TLayoutButton;
    gr : TUiFrame;

begin
{log}SetOpeLog( 'OPE:MakeLayoutWorkData' );

    // カテゴリパネル
    uf := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, FConfigData.XPTRootFrame ) );
    if uf = nil then begin
        WarningMessage( 'カテゴリフレームが見つかりません（XPT）。' );
        Exit;
    end;

    lst2    := TScreenList.Create;
    lst     := TScreenList.Create;

    // カテゴリのパネル
    FLayoutData[ typXpt ].Frame     := uf.Clone;

    // カテゴリパネル内のボタンを探す
    lst.Empty;
    FScreenList.SearchSource( UiScreenSelectButton_No, IntToStr( uf.F_Id ), lst );

    // カテゴリのボタン
    for i:=0 to lst.Count-1 do begin
//    for i:=6 to lst.Count-1 do begin

        lb := TLayoutButton.Create;

        // カテゴリボタン作成
        lb.FButton  := lst.Data[i].Clone;
//            lb.FButton  := lst.Data[i];

        // リストへ追加
        FLayoutData[ typXpt ].List.Add( lb );

        // カテゴリボタン名称からグループパネルを探す
        sb := TUiScreenSelectButton( lst.Data[i] );
//            gr := TUiFrame( FScreenList.SearchByName( UiFrame_No, sb.F_FrameName ) );
        gr := TUiFrame( FScreenList.SearchByName( UiFrame_No, sb.F_FrameName ) );

        // グループパネル内の子パネル取得
        lst2.Empty;
        FScreenList.SearchSource( UiFrame_No, IntToStr( gr.F_ID ), lst2 );

        for j:=0 to lst2.Count-1 do begin

            uf2 := TUiFrame( lst2.Data[j] );

            if uf2.F_Name = DEST_GROUP(i) then begin
                // ここがDESTグループのパネル

                uf3 := TUiFrame( lst2.SearchByName( UiFrame_No, DEST_SELECT(i) ) );

                if uf3 <> nil then begin
                    // DESTグループ内のボタンを探す
                    {lb.Child[0] := }GetLayoutTable( lb, uf2, uf3, 0{DEST} );
                end;
            end
            else if uf2.F_Name = SOURCE_GROUP(i) then begin
                // ここがSOURCEグループのパネル

                uf3 := TUiFrame( lst2.SearchByName( UiFrame_No, SOURCE_SELECT(i) ) );

                if uf3 <> nil then begin

                    // SURCEグループ内のボタンを探す
                    {lb.Child[1] := }GetLayoutTable( lb, uf2, uf3, 1{SOURCE} );
                end;
            end;

        end;

    end;

    //** カテゴリ数に満たない場合は作成する

    // カテゴリボタン最大数
    uf.F_ColCount   := IntToStr( MAX_CATEGORY );

    // ORDER順位に並び替え
    FLayoutData[ typXpt ].List.SortButtonOrder;

    lst2.Empty; lst2.Free;
    lst.Empty;  lst.Free;
end;

//-----------------------------------------------------------------------------
//  PANEL新規作成（PANEL）
//-----------------------------------------------------------------------------
procedure TMainForm.MakeNewCategoryPanel;
//const
//    PANEL_ROOT        = 11024;    //'XptDst.Root';

var
    uf1, uf2, uf3 : TUiFrame;
    i, j, t : integer;
    sb : TUiScreenSelectButton;
    root, root2, root3 : TUiFrame;
    str : string;

begin
{log}SetOpeLog( 'OPE:MakeNewCategoryPanel' );

    // カテゴリパネル
//    root    := TUiFrame( FScreenList.SearchByName( UiFrame_No, XPT_ROOT ) );
    root    := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, FConfigData.PanelRootFrame ) );

    // カテゴリボタン最大数
    root.F_ColCount := IntToStr( MAX_CATEGORY );
    // カテゴリパネルの高さセット
    root.F_Height   := Format( '%dpx', [FConfigData.PanelCateH] );   //'65px';

    root2   := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, 'DST/SRC GP SEL' ) );
    // 高さ
    root2.F_Height   := Format( '%dpx', [FConfigData.PanelCateH+FConfigData.PanelGrpH] );

    root3       := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, 'BUTTON PANEL' ) );
    // TOP
    t := FConfigData.PanelCateH + FConfigData.PanelGrpH;
    t := StrToIntDef( Copy(root.F_Top, 1, (Length(root.F_Top)-2)), 100 ) + t;
    root3.F_Top := Format( '%dpx', [t] );


(*
    // カテゴリパネル
    uf := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, FConfigData.XPTRootFrame ) );
    if uf = nil then begin
        WarningMessage( 'カテゴリフレームが見つかりません（XPT）。' );
        Exit;
    end;
*)

    for j:=0 to MAX_CATEGORY-1 do begin

        // 新規カテゴリボタン作成
        sb := MakeGroupButton(
                GetMaxScreenSelectButtonId,         // ID
                root.F_Id,                          // 親ID
                Format( 'Panel.Cate%d', [(j+1)] ),  // FRAME NAME
                Format( FConfigData.CatePrifix+'%d', [j+1] )      // TEXT
            );

        sb.F_Left       := Format( '.%d', [j] );
        sb.F_Top        := '0';
        sb.F_Width      := '.1';
        sb.F_Height     := '.1';
        sb.F_Order      := IntToStr( j + 1 );
        sb.E_Order      := true;

//        sb.F_Key        := 'Panel.G01.8k.GpSel';
        sb.F_Key        := Format( 'Panel.Cate%d.GpSel', [j+1] );
        sb.E_Key        := true;

        sb.F_FrameName  := sb.F_Key + ';' + Format( 'Panel.Cate%d.ButtonPanel', [j+1] );  //'Panel.G01.8k.ButtonPanel';
        sb.E_FrameName  := true;

        sb.F_Attributes := 'PanelXptBus=1;OnLineRef=False,10';
        sb.E_Attributes := True;

        // データベースへ登録
        AddDataBase( sb );

 //==== 親グループフレーム作成 ================================================

        uf3 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    root2.F_Id,                          // 親ID
                    Format( 'Panel.Cate%d.GpSel', [(j+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    0 );

//        uf3.F_Type          := 'Xpt.Cate';
//        uf3.E_Type          := True;
        uf3.F_ColCount      := '';
        uf3.E_ColCount      := false;
        uf3.F_RowCount      := '';
        uf3.E_RowCount      := false;

        // フレームサイズ、位置セット
        uf3.F_Left          := '0';     uf3.E_Left   := True;
        uf3.F_Top           := '0';     uf3.E_Top    := True;
        uf3.F_Width         := '100';   uf3.E_Width  := True;
        uf3.F_Height        := '100';   uf3.E_Height := True;
        uf3.F_Order         := IntToStr( j + 1 );
        uf3.E_Order         := true;

        // データベースへ登録
        AddDataBase( uf3 );

//------ DEST/SRC SELECTOR フレーム作成 ---------------------------------------

        uf2 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    uf3.F_Id,                          // 親ID
                    Format( 'Panel.Cate%d.DST/SRC SELECTOR', [(j+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    0 );

//        uf3.F_Type          := 'Xpt.Cate';
        uf2.E_Type          := False;
        uf2.F_ColCount      := '2';
        uf2.E_ColCount      := True;
        uf2.F_RowCount      := '1';
        uf2.E_RowCount      := True;

        // フレームサイズ、位置セット
        uf2.F_Left          := '80';
        uf2.E_Left          := True;
        uf2.F_Top           := '0';
        uf2.E_Top           := True;
        uf2.F_Width         := '20';
        uf2.E_Width         := True;
        uf2.F_Height        := Format( '%dpx', [FConfigData.PanelGrpH] );   //'65px';
        uf2.E_Height        := True;
        uf2.F_Order         := '1';
        uf2.E_Order         := True;

        // データベースへ登録
        AddDataBase( uf2 );

//------ [DEST] ボタン --------------------------------------------------------

        sb := MakeGroupButton(
                GetMaxScreenSelectButtonId{( typPanel )},   // ID
                uf2.F_Id,                                   // 親ID
                Format( 'Panel.Cate%d', [(j+1)] ),          // FRAME NAME
                'DEST'                                      // TEXT
            );

        sb.F_Left       := '0';
        sb.F_Top        := '0';
        sb.F_Width      := '50';
        sb.F_Height     := '100';
        sb.F_Order      := '1';
        sb.E_Order      := True;

        str             := Format( 'Panel.Cate%d.GpSel.Dst', [(j+1)] );
//        sb.F_Key        := 'Panel.G01.8k.GpSel.Dst';
        sb.F_Key        := str;
        sb.E_Key        := True;

        sb.F_FrameName  := Format( '%sGroupButtonPanel;%sButtonPanelRoot', [str, str] );
        sb.E_FrameName  := true;

        sb.F_IsPermissionHandled    := 'false';
        sb.E_IsPermissionHandled    := True;

        sb.F_IsSelectionCancel      := 'false';
        sb.E_IsPermissionHandled    := True;

//        sb.F_BeforeRelayKey  := 'Panel.G02.4k.GpSel.Dst;
//                                    'Panel.G03.2k.GpSel.Dst;' +
//                                    'Panel.G04.Aud.GpSel.Dst;' +
//                                    'Panel.G05.Sw.GpSel.Dst;' +
//                                    'Panel.G06.Tally.GpSel.Dst;' +
//                                    'Panel.G08.AudioSt.GpSel.Dst';
//        sb.E_BeforeRelayKey  := True;

        sb.F_Attributes := 'OnLineRef=False,10';
        sb.E_Attributes := True;

        // データベースへ登録
        AddDataBase( sb );

//-------- [SOURCE] ボタン ----------------------------------------------------

        sb := MakeGroupButton(
                GetMaxScreenSelectButtonId{( typPanel )},   // ID
                uf2.F_Id,                                   // 親ID
                Format( 'Panel.Cate%d', [(j+1)] ),          // FRAME NAME
                'SOURCE'                                    // TEXT
            );

        sb.F_Left       := '50';
        sb.F_Top        := '0';
        sb.F_Width      := '50';
        sb.F_Height     := '100';
        sb.F_Order      := '2';
        sb.E_Order      := true;

        str             := Format( 'Panel.Cate%d.GpSel.Src', [(j+1)] );

        sb.F_Key        := str;             //'Panel.G01.8k.GpSel.Src';
        sb.E_Key        := True;

//        sb.F_FrameName  := 'Panel.G01.8k.GpSel.SrcGroupButtonPanel;Panel.G01.8k.GpSel.SrcButtonPanelRoot';
        sb.F_FrameName  := Format( '%sGroupButtonPanel;%sButtonPanelRoot', [str, str] );
        sb.E_FrameName  := True;

        sb.F_Attributes := 'OnLineRef=False,10';
        sb.E_Attributes := True;

        // データベースへ登録
        AddDataBase( sb );

//------- DEST/SRC GROUP ------------------------------------------------------

        uf2 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},              // ID
                    uf3.F_Id,                               // 親ID
                    Format( 'DST/SRC SELECTOR', [(j+1)] ),  // NAME
                    'Musashi-' + IntToStr(j),               // NOTE
                    0 );

//        uf3.F_Type          := 'Xpt.Cate';
        uf2.E_Type          := False;
        uf2.F_ColCount      := '';
        uf2.E_ColCount      := False;
        uf2.F_RowCount      := '';
        uf2.E_RowCount      := False;

        // フレームサイズ、位置セット
        uf2.F_Left          := '0';
        uf2.E_Left          := True;
        uf2.F_Top           := Format( '%dpx', [FConfigData.PanelCateH] );   //'65px';
        uf2.E_Top           := True;
        uf2.F_Width         := '100';
        uf2.E_Width         := True;
        uf2.F_Height        := Format( '%dpx', [FConfigData.PanelGrpH] );   //'65px';
        uf2.E_Height        := True;
        uf2.F_Order         := '1';
        uf2.E_Order         := true;

        // データベースへ登録
        AddDataBase( uf2 );

//------- DEST GROUP (フレーム) -----------------------------------------------

        uf1 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},          // ID
                    uf2.F_Id,                           // 親ID
                    Format( 'Panel.Cate%d.GpSel.DstGroupButtonPanel', [(j+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    0 );

//        uf3.F_Type          := 'Xpt.Cate';
        uf1.E_Type          := False;
        uf1.F_ColCount      := IntToStr( MAX_GROUP );
        uf1.E_ColCount      := True;
        uf1.F_RowCount      := '1';
        uf1.E_RowCount      := True;

        // フレームサイズ、位置セット
        uf1.F_Left          := '0';     uf1.E_Left   := True;
        uf1.F_Top           := '0';     uf1.E_Top    := True;
        uf1.F_Width         := '100';   uf1.E_Width  := True;
        uf1.F_Height        := '100';   uf1.E_Height := True;
        uf1.F_Order         := '1';
        uf1.E_Order         := true;

        // データベースへ登録
        AddDataBase( uf1 );

//------ DEST GROUP (ボタン) --------------------------------------------------

        for i:=0 to MAX_GROUP-1 do begin

            // 新規カテゴリボタン作成
            sb := MakeGroupButton(
                    GetMaxScreenSelectButtonId{( typPanel )},                   // ID
                    uf1.F_Id,                                                   // 親ID
                    Format( 'Panel.Cate%d.GpSel.Dst.Gp%d', [(j+1), (i+1)] ),    // FRAME NAME
                    Format( FConfigData.GroupPrifix+'%d', [i+1] )               // TEXT
                );

            sb.F_Left       := Format( '.%d', [i] );
            sb.F_Top        := '0';
            sb.F_Width      := '.1';
            sb.F_Height     := '100';
            sb.F_Order      := IntToStr( i + 1 );
            sb.E_Order      := true;

            sb.F_Attributes := 'OnLineRef=False,10';
            sb.E_Attributes := True;

            sb.F_IsPermissionHandled    := 'false';
            sb.E_IsPermissionHandled    := True;

            sb.F_IsSelectionCancel      := 'false';
            sb.E_IsPermissionHandled    := True;

            // データベースへ登録
            AddDataBase( sb );
        end;

//------ SOURCE GROUP（フレーム） ---------------------------------------------

        uf1 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    uf2.F_Id,                          // 親ID
                    Format( 'Panel.Cate%d.GpSel.SrcGroupButtonPanel', [(j+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    0 );

//        uf3.F_Type          := 'Xpt.Cate';
        uf1.E_Type          := False;
        uf1.F_ColCount      := IntToStr( MAX_GROUP );
        uf1.E_ColCount      := True;
        uf1.F_RowCount      := '1';
        uf1.E_RowCount      := True;

        // フレームサイズ、位置セット
        uf1.F_Left          := '0';     uf1.E_Left   := True;
        uf1.F_Top           := '0';     uf1.E_Top    := True;
        uf1.F_Width         := '100';   uf1.E_Width  := True;
        uf1.F_Height        := '100';   uf1.E_Height := True;
        uf1.F_Order         := '2';
        uf1.E_Order         := True;

        // データベースへ登録
        AddDataBase( uf1 );

//------ SOURCE GROUP（ボタン） -----------------------------------------------

        for i:=0 to MAX_GROUP-1 do begin

            // 新規カテゴリボタン作成
            sb := MakeGroupButton(
                    GetMaxScreenSelectButtonId{( typPanel )},           // ID
                    uf1.F_Id,                                           // 親ID
//                    Format( 'Panel.Cate%d', [(j+1)] ),                // FRAME NAME
                    Format( 'Panel.Cate%d.GpSel.Src.Gp%d', [(j+1), (i+1)] ),          // FRAME NAME
                    Format( FConfigData.GroupPrifix+'%d', [i+1] )       // TEXT
                );

            sb.F_Left       := Format( '.%d', [i] );
            sb.F_Top        := '0';
            sb.F_Width      := '.1';
            sb.F_Height     := '100';
            sb.F_Order      := IntToStr( i + 1 );
            sb.E_Order      := True;

            sb.F_Attributes := 'OnLineRef=False,10';
            sb.E_Attributes := True;

            sb.F_IsPermissionHandled    := 'false';
            sb.E_IsPermissionHandled    := True;

            sb.F_IsSelectionCancel      := 'false';
            sb.E_IsPermissionHandled    := True;

            // データベースへ登録
            AddDataBase( sb );
        end;

 //==== ボタンフレーム作成 ====================================================

        uf3 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    root3.F_Id,                          // 親ID
                    Format( 'Panel.Cate%d.ButtonPanel', [(j+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    0 );

//        uf3.F_Type          := 'Xpt.Cate';
//        uf3.E_Type          := True;
        uf3.F_ColCount      := '';
        uf3.E_ColCount      := false;
        uf3.F_RowCount      := '';
        uf3.E_RowCount      := false;

        // フレームサイズ、位置セット
        uf3.F_Left          := '0';     uf3.E_Left   := True;
        uf3.F_Top           := '0';     uf3.E_Top    := True;
        uf3.F_Width         := '100';   uf3.E_Width  := True;
        uf3.F_Height        := '100';   uf3.E_Height := True;
        uf3.F_Order         := IntToStr( j + 1 );
        uf3.E_Order         := true;

        // データベースへ登録
        AddDataBase( uf3 );

//----- DEST BUTTON（フレーム） -----------------------------------------------

        uf2 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    uf3.F_Id,                          // 親ID
                    Format( 'Panel.Cate%d.GpSel.DstButtonPanelRoot', [(j+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    0 );

        uf2.F_ColCount      := '';
        uf2.E_ColCount      := false;
        uf2.F_RowCount      := '';
        uf2.E_RowCount      := false;

        // フレームサイズ、位置セット
        uf2.F_Left          := '0';     uf2.E_Left   := True;
        uf2.F_Top           := '0';     uf2.E_Top    := True;
        uf2.F_Width         := '100';   uf2.E_Width  := True;
        uf2.F_Height        := '100';   uf2.E_Height := True;
        uf2.F_Order         := '1';
        uf2.E_Order         := True;

        // データベースへ登録
        AddDataBase( uf2 );

//---- DEST BUTTON（ボタン） --------------------------------------------------

        for i:=0 to MAX_GROUP-1 do begin

            // DEST BUTTON FRAME
            uf1 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    uf2.F_Id,                          // 親ID
                    Format( 'Panel.Cate%d.GpSel.Dst.Gp%d', [(j+1), (i+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    0 );

            uf1.F_Type          := 'Panel.Dst';
            uf1.E_Type          := True;

            uf1.F_ColCount      := '10';
            uf1.E_ColCount      := True;
            uf1.F_RowCount      := '4';
            uf1.E_RowCount      := True;

            // フレームサイズ、位置セット
            uf1.F_Left          := '0';     uf1.E_Left   := True;
            uf1.F_Top           := '0';     uf1.E_Top    := True;
            uf1.F_Width         := '100';   uf1.E_Width  := True;
            uf1.F_Height        := '100';   uf1.E_Height := True;
            uf1.F_Order         := IntToStr( i + 1 );
            uf1.E_Order         := True;

            AddDataBase( uf1 );

        end;

//---- SOURCE BUTTON （フレーム） ---------------------------------------------

        uf2 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    uf3.F_Id,                          // 親ID
                    Format( 'Panel.Cate%d.GpSel.SrcButtonPanelRoot', [(j+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    1 );

        uf2.F_Type          := '';
        uf2.E_Type          := false;

        uf2.F_ColCount      := '';
        uf2.E_ColCount      := false;
        uf2.F_RowCount      := '';
        uf2.E_RowCount      := false;

        // フレームサイズ、位置セット
        uf2.F_Left          := '0';     uf2.E_Left   := True;
        uf2.F_Top           := '0';     uf2.E_Top    := True;
        uf2.F_Width         := '100';   uf2.E_Width  := True;
        uf2.F_Height        := '100';   uf2.E_Height := True;
        uf2.F_Order         := '2';
        uf2.E_Order         := True;

        // データベースへ登録
        AddDataBase( uf2 );

//----- SOURCE BUTTON （ボタン） ----------------------------------------------

        for i:=0 to MAX_GROUP-1 do begin

            // DEST BUTTON FRAME
            uf1 := MakeGroupFrame(
                    GetMaxFrameId{( typXpt )},            // ID
                    uf2.F_Id,                          // 親ID
                    Format( 'Panel.Cate%d.GpSel.Src.Gp%d', [(j+1), (i+1)] ),    // NAME
                    'Musashi-' + IntToStr(j),           // NOTE
                    1 );

            uf1.F_Type          := 'Panel.Src';
            uf1.E_Type          := True;

            uf1.F_ColCount      := '16';
            uf1.E_ColCount      := True;
            uf1.F_RowCount      := '3';
            uf1.E_RowCount      := True;

            // フレームサイズ、位置セット
            uf1.F_Left          := '0';     uf1.E_Left   := True;
            uf1.F_Top           := '0';     uf1.E_Top    := True;
            uf1.F_Width         := '100';   uf1.E_Width  := True;
            uf1.F_Height        := '100';   uf1.E_Height := True;
            uf1.F_Order         := IntToStr( i + 1 );
            uf1.E_Order         := True;

            AddDataBase( uf1 );
        end;

    end;

end;

//-----------------------------------------------------------------------------
//  レイアウト用データ作成(PANEL)
//-----------------------------------------------------------------------------
procedure TMainForm.MakePanelLayoutWorkData;
const
//    CATEGORY_BUTTON_PANEL   = 11024;        //  MTX GROUP SELECTOR

    tbl : array [0..1] of string = ( '.Dst', '.Src' );
    tbl2 : array [0..1] of integer = ( UiPanelDstButton_No, UiPanelSrcButton_No );

var
    uf, uf2, uf3, pa : TUiFrame;
    lst, lst2, lst3 : TScreenList;
    i, j, k, ds : integer;
    sb : TUiScreenSelectButton;
    lb, lb2, lb3 : TLayoutButton;
    nm : string;
    btn : TUiButton;

begin
{log}SetOpeLog( 'OPE:MakePanelLayoutWorkData(PANEL)' );

    // カテゴリパネル
//    uf := TUiFrame( FScreenList.Search( UiFrame_No, CATEGORY_BUTTON_PANEL ) );
    uf := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, FConfigData.PanelRootFrame ) );
    if uf = nil then begin
        WarningMessage( 'カテゴリフレームが見つかりません（PANEL）。' );
        Exit;
    end;

    lst2    := TScreenList.Create;
    lst3    := TScreenList.Create;
    lst     := TScreenList.Create;

    // カテゴリのパネル
    FLayoutData[ typPanel ].Frame     := uf.Clone;

    // カテゴリパネル内のボタンを探す
    lst.Empty;
    FScreenList.SearchSource( UiScreenSelectButton_No, IntToStr( uf.F_Id ), lst );

    for i:=0 to lst.Count-1 do begin

        lb := TLayoutButton.Create;

        // カテゴリボタン作成
        lb.FButton  := lst.Data[i].Clone;

        // リストへ追加
        FLayoutData[ typPanel ].List.Add( lb );

        // カテゴリボタン名称からグループパネルを探す
        sb := TUiScreenSelectButton( lb.FButton );  //lst.Data[i] );

        for ds:=0 to HIGH( tbl ) do begin

            // 親フレーム
            pa := TUiFrame( FScreenList.SearchByName( UiFrame_No,  sb.F_key + tbl[ ds ] + 'ButtonPanelRoot' ) );

            nm := sb.F_key + tbl[ ds ] + 'GroupButtonPanel';

            // グループパネル検索
            uf2 := TUiFrame( FScreenList.SearchByName( UiFrame_No, nm ) );

            lb.Child[ ds ]         := TLayoutData.Create;
            lb.Child[ ds ].Frame   := uf2.Clone;

            // ボタン数セット
            lb.Child[ ds ].Frame.F_ColCount  := IntToStr( MAX_GROUP );

            // グループボタン検索
            lst2.Empty;
            FScreenList.SearchSource( UiScreenSelectButton_No, IntToStr( uf2.F_Id ), lst2 );

            for j:=0 to MAX_GROUP-1 do begin

                if j < lst2.Count then begin

                    // 既存
                    btn := lst2.Data[j].Clone;
                end
                else begin

                    // 新規追加
                    btn := MakeGroupButton(
                                GetMaxScreenSelectButtonId{( typPanel )},     // ID
                                uf2.F_Id,                                   // 親ID
                                TUiScreenSelectButton(lb.FButton).F_Key + Format( '%s.Gp%.2d', [ tbl[ds], j+1] ),    // FRAME NAME
                                Format( 'Musashi%s-%d', [tbl[ds], j] )      // TEXT
                            );
                end;

                // サイズ、位置セット
                TUiScreenSelectButton( btn ).F_Left         := Format( '.%d', [j] );
                TUiScreenSelectButton( btn ).F_Width        := '.1';
                TUiScreenSelectButton( btn ).F_Top          := '0';
                TUiScreenSelectButton( btn ).F_Height       := '100';
                TUiScreenSelectButton( btn ).F_Order        := '1';

                TUiScreenSelectButton( btn ).F_Attributes   := 'OnLineRef=False,10';
                TUiScreenSelectButton( btn ).E_Attributes   := True;

                // ワークに追加
                lb2         := TLayoutButton.Create;
                lb2.FButton := btn;     //.Clone;

                lb.Child[ ds ].List.Add( lb2 );

                // ボタンフレーム検索
                uf3 := TUiFrame( FScreenList.SearchByName( UiFrame_No, TUiScreenSelectButton(btn).F_FrameName ) );
                if nil <> uf3 then begin
                    uf3 := uf3.Clone;
                end
                else begin

                    uf3 := MakeGroupFrame(
                                GetMaxFrameId{( typPanel )},              // ID
                                pa.F_Id,                                // 親ID
                                TUiScreenSelectButton(lb.FButton).F_Key + Format( '%s.Gp%.2d', [tbl[ds], j+1] ),  // NAME
                                Format( 'Musashi%s-%d', [tbl[ds], j] ), // NOTE
                                ds                                      // DEST/SOURCE
                            );

                    if ds = 0 then begin
                        // DESTINATION
                        uf3.F_Type          := 'Panel.Dst';
                        uf3.F_ColCount      := '10';
                        uf3.F_RowCount      := '5';
                    end
                    else begin
                        // SOURCE
                        uf3.F_Type          := 'Panel.Src';
                        uf3.F_ColCount      := '10';
                        uf3.F_RowCount      := '5';
                    end;

                    uf3.F_Order  := IntToStr( j + 1 );
                end;

                // グループボタン検索
                lst3.Empty;
//                FScreenList.SearchSource( UiScreenSelectButton_No, IntToStr( uf3.F_Id ), lst3 );
                FScreenList.SearchSource( tbl2[ds], IntToStr( uf3.F_Id ), lst3 );

                lb2.Child[ ds ]        := TLayoutData.Create;
                lb2.Child[ ds ].Frame  := uf3; //.Clone;

                for k:=0 to lst3.Count-1 do begin

                    btn         := lst3.Data[k];

                    lb3         := TLayoutButton.Create;
                    lb3.FButton := btn.Clone;

                    lb2.Child[ ds ].List.Add( lb3 );
                end;

            end;

        end;

    end;

    lst2.Empty;  lst2.Free;
    lst3.Empty;  lst3.Free;
    lst.Empty;  lst.Free;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TMainForm.MakePanelKeyWork;
var
    uf, uf2 : TUiFrame;
    lst, lst2 : TScreenList;
    i, j : integer;
    lb, lb2 : TLayoutButton;
    ld : TLayoutData;

begin
{log}SetOpeLog( 'OPE:MakePanelKeyWork' );

    uf := TUiFrame( FScreenList.SearchByName( UiFrame_No, 'PanelKey.Root' ) );

    lst     := TScreenList.Create;
    lst2    := TScreenList.Create;

    try

        // カテゴリパネル内のボタンを探す
        lst.Empty;
        FScreenList.SearchParent( UiFrame_No, IntToStr( uf.F_Id ), lst );

        // 親
        FPanelKeyLayout.Frame   := uf.Clone;


        for i:=0 to lst.Count-1 do begin

            uf2 := TUiFrame( lst.Data[i] );

            // グループボタン検索
            lst2.Empty;
            FScreenList.SearchSource( UiPanelKeyButton_No, IntToStr( uf2.F_Id ), lst2 );

            // 子ども
            ld          := TLayoutData.Create;
            // 子どもフレーム
            ld.Frame    := uf2.Clone;
//            ld.List     := TLayoutButtonList.Create;

            // 子ボタン
            for j:=0 to lst2.Count-1 do begin
                lb2         := TLayoutButton.Create;
                lb2.Button  := TUiPanelKeyButton( lst2.Data[j] ).Clone;
                ld.List.Add( lb2 );
            end;

            lb          := TLayoutButton.Create;
            lb.Button   := nil;
            lb.Child[0]     := ld;

            FPanelKeyLayout.List.Add( lb );

        end;


    finally

        lst.Empty;      lst.Free;
        lst2.Empty;     lst2.Free;

    end;


end;


(*
//-----------------------------------------------------------------------------
//  リスト用データ作成(MAINTE、PORT)
//-----------------------------------------------------------------------------
procedure TMainForm.MakeListLayoutWorkData;
var
    ul : TUiList;
    lst : TScreenList;
    cd : TColumnData;
    j, i : integer;

begin
{log}SetOpeLog( 'OPE:MakeListLayoutWorkData' );

    lst     := TScreenList.Create;

    try

        for j:=typMainteList to typNameList do begin

//-- DESTINATION --------------------------------------------------------------

            lst.Empty;
            FScreenList.SearchByListType( FConfigData.ListName[ j, typDst ], lst );

            // MAITENANCE PORT リストを探す
//            ul := TUiList( FScreenList.SearchByTitle( UiList_No, FConfigData.ListName[ j, typDst ] MaintePortList + '.DstList' ) );
            ul := TUiList( FScreenList.SearchByTitle( UiList_No, FConfigData.ListName[ j, typDst ] ) );
            if ul = nil then begin
                WarningMessage( 'リストが見つかりません。' + FConfigData.ListName[ j, typDst ] );
                Exit;
            end;

            // 親リスト作成
            FListLayout[ j ].ColumnList[0].List := ul.Clone;

            // カテゴリパネル内のボタンを探す
            lst.Empty;
            FScreenList.SearchSource( UiListColumn_No, IntToStr( ul.F_Id ), lst );

            for i:=0 to lst.Count-1 do begin
                cd          := TColumnData.Create;
                cd.Column   := TUiListColumn( lst.Data[i] ).Clone;
                cd.Button   := nil;
                FListLayout[ j ].ColumnList[0].Add( cd );
            end;

//-- SOURCE -------------------------------------------------------------------

            // MAITENANCE PORT リストを探す
//            ul := TUiList( FScreenList.SearchByTitle( UiList_No, FConfigData.MaintePortList + '.SrcList' ) );
            ul := TUiList( FScreenList.SearchByTitle( UiList_No, FConfigData.ListName[ j, typSrc ] ) );
            if ul = nil then begin
                WarningMessage( 'リストが見つかりません。' + FConfigData.ListName[ j, typSrc ] );
                Exit;
            end;

            // 親リスト作成
            FListLayout[ j ].ColumnList[1].List := ul.Clone;

            // カテゴリパネル内のボタンを探す
            lst.Empty;
            FScreenList.SearchSource( UiListColumn_No, IntToStr( ul.F_Id ), lst );

            for i:=0 to lst.Count-1 do begin
                cd          := TColumnData.Create;
                cd.Column   := TUiListColumn( lst.Data[i] ).Clone;
                cd.Button   := nil;
                FListLayout[ j ].ColumnList[1].Add( cd );
            end;

        end;

    finally

        lst.Empty;
        lst.Free;

    end;

end;
*)

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetAlias( key : string; ds : integer ) : integer;
var
    slst : TSbSrcNameBusList;
    dlst : TSbDstNameBusList;
    s : TSbSrcNameBus;
    d : TSbDstNameBus;
    ret, i : integer;

begin
    ret := -1;

    case ds of
    TMainForm.TypDst:
        begin
            dlst := MainForm.SBusDb.SbDstNameBusList;
            for i:=0 to dlst.Count-1 do begin

                d := dlst.Data[i];

                if (key <> '') and (('F_' + d.F_Name) = key) then begin
                    ret := StrToIntDef( d.F_AliasNo, -1 );
                    break;
                end;
            end;
        end;

    TMainForm.TypSrc:
        begin
            slst := MainForm.SBusDb.SbSrcNameBusList;
            for i:=0 to slst.Count-1 do begin

                s := slst.Data[i];

                if (key <> '') and (('F_' + s.F_Name) = key) then begin
                    ret := StrToIntDef( s.F_AliasNo, -1 );
                    break;
                end;
            end;
        end;

    end;

    if ret < 0 then begin
        Result := 8;
    end
    else begin
        Result := ret;
    end;

end;

//-----------------------------------------------------------------------------
//  リスト用データ作成(MAINTE PORT, NAME)
//-----------------------------------------------------------------------------
procedure TMainForm.MakeListLayoutWorkData2;
var
    ul : TUiList;
    lst, lst2, lst3 : TScreenList;
    cd : TColumnData;
    k, j, i : integer;

    ld : TListLayout;

begin
{log}SetOpeLog( 'OPE:MakeListLayoutWorkData2' );

    lst     := TScreenList.Create;
    lst2    := TScreenList.Create;
    lst3    := TScreenList.Create;

    try

        for k:=typMainteList to typNameList do begin

//-- DESTINATION --------------------------------------------------------------

            lst2.Empty;
            FScreenList.SearchByListType( FConfigData.ListName[ k, typDst ], lst2 );

            lst3.Empty;
            FScreenList.SearchByListType( FConfigData.ListName[ k, typSrc ], lst3 );

            for j:=0 to lst2.Count-1 do begin

                ld := TListLayout.Create;

                ul := TUiList( lst2.Data[j] );

                // 親リスト作成
                ld.ColumnList[0].List   := ul.Clone;

                // 表示識別用
                ld.Attribute            := ul.F_Attributes;

                // カテゴリパネル内のボタンを探す
                lst.Empty;
                FScreenList.SearchSource( UiListColumn_No, IntToStr( ul.F_Id ), lst );

                for i:=0 to lst.Count-1 do begin
                    cd          := TColumnData.Create;
                    cd.Column   := TUiListColumn( lst.Data[i] ).Clone;
                    cd.Alias    := GetAlias( cd.Column.F_ColName, typDst );
                    ld.ColumnList[0].Add( cd );
                end;

//-- SOURCE -------------------------------------------------------------------

                ul := TUiList( lst3.Data[j] );

                // 親リスト作成
                ld.ColumnList[1].List   := ul.Clone;

                // カテゴリパネル内のボタンを探す
                lst.Empty;
                FScreenList.SearchSource( UiListColumn_No, IntToStr( ul.F_Id ), lst );

                for i:=0 to lst.Count-1 do begin
                    cd          := TColumnData.Create;
                    cd.Column   := TUiListColumn( lst.Data[i] ).Clone;
                    cd.Alias    := GetAlias( cd.Column.F_ColName, typSrc );
                    ld.ColumnList[1].Add( cd );
                end;

                FListLayoutList[ k ].Add( ld );
            end;

        end;

    finally

        lst.Empty;  lst.Free;
        lst2.Empty; lst2.Free;
        lst3.Empty; lst3.Free;

    end;

end;

//-----------------------------------------------------------------------------
//  番組リスト用データ作成
//-----------------------------------------------------------------------------
procedure TMainForm.MakeProgramLayout( lsType : string; loLst : TListLayoutList );
var
    lst, lst2, lst3 : TScreenList;
    i, j, n, k : integer;
    ul : TUiList;
    ld : TListLayout;
    cd : TColumnData;

begin

    lst     := TScreenList.Create;
    lst2    := TScreenList.Create;
    lst3    := TScreenList.Create;

    try

        lst.Empty;
//        FScreenList.SearchByListType( 'UiProgramList', lst );
        FScreenList.SearchByListType( lsType, lst );

        ld := TListLayout.Create;

        for i:=0 to lst.Count-1 do begin

            ul := TUiList( lst.Data[i] );

            // 親リスト作成
            ld.ColumnList[0].List   := ul.Clone;

            lst2.Empty;
            FScreenList.SearchSource( UiListColumn_No, IntToStr(ul.F_Id), lst2 );

            for j:=0 to lst2.Count-1 do begin

                cd          := TColumnData.Create;
                cd.Column   := TUiListColumn( lst2.Data[j] ).Clone;

                // セルボタン
                lst3.Empty;
//                cd.Button   := nil;
                n := FScreenList.SearchSource( UiListCellButton_No, IntToStr(cd.Column.F_Id), lst3 );
                for k:=0 to n-1 do begin
//                      cd.Buttons  := TScreenList.Create;
                    cd.Buttons.Add( TUiListCellButton(lst3.Data[k]).Clone );
                end;

                ld.ColumnList[0].Add( cd );
            end;

            loLst.Add( ld );

        end;

    finally

        lst.Empty;  lst.Free;
        lst2.Empty; lst2.Free;
        lst3.Empty; lst3.Free;

    end;

end;

//-----------------------------------------------------------------------------
//  番組リスト用データ作成
//-----------------------------------------------------------------------------
procedure TMainForm.MakeProgramIndexList;
begin

    ProgramCategoryForm.MakeComponent;

end;

const
    SCREEN_FILE         = 'ScreenDb.xml';
    DISPLAY_FILE        = 'DisplayDb.xml';
    DEVICESETTING_FILE  = 'DeviceSettingDb.xml';

    PROGRAM0_FILE       = 'PgmDbKeyDb\' + 'PRG_11.xml';
    PRG_INDEX_FILE      = 'PgmDbKeyDb\' + 'ProgramIndexDb.xml';

    SBUS_FILE           = 'SbusDb.xml';
    ACCOUNT_FILE        = 'AccountDb.xml';

//    FDBPath             = 'C:\Users\K2_W10\Desktop\Z440共有\APP_DATA';

//-----------------------------------------------------------------------------
//  データベース読み込み
//-----------------------------------------------------------------------------
procedure TMainForm.LoadDatabase;
var
    fn : string;

begin
{log}SetOpeLog( 'OPE:LoadDatabase' );

    // 読込みファイル
    fn := FConfigData.DbPath + SCREEN_FILE;

    if False = FileExists( fn ) then begin

        WarningMessage( 'データベースファイルが見つかりません。' )

    end
    else begin

        MessageForm.Start( 'データベース読み込み中...' );

        // 保存先
//        ed := fn;   //ChangeFileExt( fn, '.bak' );

        MessageForm.SubMessage  := 'ScreenDb';

        // SCREEN ファイル読み込み
        FScreenList.ScreenDbLoad( fn );

        MessageForm.SubMessage  := 'DisplayDb';

        // DISPLAY ファイル読み込み
        fn := FConfigData.DbPath + DISPLAY_FILE;
        if True = FileExists( fn ) then begin
            FDisplayList    := TDisplayList.Create;
            FDisplayList.Load( fn );
        end;

(*
        // ソース読み込み（HD）
        fn := FConfigData.DbPath + DEVICESETTING_FILE;
        FXPTSourceList.Load( fn );
*)

        MessageForm.SubMessage  := 'ProgramDb';

{
        // PRG0読込み
//        fn := FConfigData.DbPath + PROGRAM0_FILE;
        fn := FConfigData.DbPath + DEVICESETTING_FILE;
        if True = FileExists( fn ) then
            FProgramList.Load( fn );
}

        MessageForm.SubMessage  := 'ProgramIndexDb';

        // PROGRAM INDEX
        fn := FConfigData.DbPath + PRG_INDEX_FILE;
        if True = FileExists( fn ) then begin
            FProgramIndexDb     := TProgramIndexDb.Create;
            FProgramIndexDb.Load( fn );
        end;

        MessageForm.SubMessage  := 'SBusDb';

        // S-BUS読込み
        fn := FConfigData.DbPath + SBUS_FILE;
        FSBusDb.Load( fn );

  (*
        MessageForm.SubMessage  := 'AccountDb';

        // S-BUS読込み
        fn := FConfigData.DbPath + ACCOUNT_FILE;
        FAccountDb.Load( fn );

        // ルートパネル作成
        MakeRootPanel;

        // 先頭フレームを選択状態にする
        PostMessage( handle, WM_FRAME_ACTIVE, 0, 0 );
 *)

        MessageForm.Close;
    end;
end;

//-----------------------------------------------------------------------------
//  データベースへ追加
//-----------------------------------------------------------------------------
procedure TMainForm.AddDataBase( sc : TScreenDb );
begin
{log}SetOpeLog( 'OPE:AddDataBase', sc.FDataType, sc.F_Id );

    FScreenList.Add( sc );
end;

//-----------------------------------------------------------------------------
//  データベースから削除
//-----------------------------------------------------------------------------
procedure TMainForm.DeleteDataBase( sc : TScreenDb );
begin
{log}SetOpeLog( 'OPE:DeleteDataBase' );

    FScreenList.Extract( sc );
    sc.Free;
end;

//-----------------------------------------------------------------------------
//  データベースへワークデータをマージ
//-----------------------------------------------------------------------------
procedure TMainForm.CompareLayout( lay : TLayoutData; lst : TScreenList );
var
    sc : TUiButton;
    lb : TLayoutButton;
    i : integer;

begin
//{log}SetOpeLog( 'OPE:CompareLayout' );

    if (nil = lay) or (nil = lay.Frame) then Exit;

    // フレームコピー
    sc := FScreenList.Search( lay.Frame.FDataType, lay.Frame.F_Id );
    if sc = nil then begin
        AddDataBase( lay.Frame.Clone );
    end
    else begin
        lay.Frame.Clone( TUiFrame(sc) );
    end;

{
    // 削除用リスト作成
    lst := TScreenList.Create;

    // フレームを新規作成した場合、削除する必要はないためリストは空でOK
    if sc <> nil then
        FScreenList.SearchButton( UiDstButton_No, IntToStr(sc.F_Id), lst );
}

    // ボタンコピー
    for i:=0 to lay.List.Count-1 do begin

        lb := lay.List.Data[i];

        if nil <> lb.Button then begin

            sc := FScreenList.Search( lb.Button.FDataType, lb.Button.F_Id );

            if nil = sc then begin
                // なければ追加
                AddDataBase( lb.Button.Clone );
            end
            else begin
                // あればコピーする
                lb.Button.Clone( sc );

                // リストから削除
                lst.DeleteButton( lb.Button );
            end;
        end;

        CompareLayout( lb.FChild[0], lst );

        CompareLayout( lb.FChild[1], lst );
    end;

(*
    // 使っていないボタンをデータベースから削除
    for i:=0 to lst.Count-1 do begin
        FScreenList.DeleteButton( lst.Data[i], 1{削除もする} );
    end;

//    lst.ClearAll;
    lst.Empty;
    lst.Free;
*)
end;

//-----------------------------------------------------------------------------
//  データベースへワークデータをマージ
//-----------------------------------------------------------------------------
procedure TMainForm.CompareListLayout( lay : TListLayout );
var
    sc : TUiButton;
    i, j : integer;
    co : TColumnData;
    a : integer;
    s : TSbSrcNameBus;
    d : TSbDstNameBus;

begin
//{log}SetOpeLog( 'OPE:CompareListLayout' );

    for j:=typDst to typSrc do begin

        if nil = lay.ColumnList[j] then continue;

        if nil = lay.ColumnList[j].List then continue;

        // UiListコピー
        sc := FScreenList.Search(
                lay.ColumnList[j].List.FDataType,
                lay.ColumnList[j].List.F_Id );
        lay.ColumnList[j].List.Clone( TUiList(sc) );

        for i:=0 to lay.ColumnList[j].Count-1 do begin

            co := lay.ColumnList[j].Data[i];

            if nil <> co.Column then begin
                sc := FScreenList.Search( co.Column.FDataType, co.Column.F_Id );
                if sc <> nil then
                    co.Column.Clone( TUiListColumn(sc) );
            end;

            if co.Alias >= 8 then   a := -1
            else                    a := co.Alias;

            if j = 0 then begin
                // DESTINATION
                d := FSbusDb.SbDstNameBusList.SearchName( co.Column.F_ColName );
                if d <> nil then begin
                    d.F_AliasNo := Format( '%d', [a] );
                    d.E_AliasNo := True;
                end;
            end
            else begin
                // SOURCE
                s := FSbusDb.SbSrcNameBusList.SearchName( co.Column.F_ColName );
                if s <> nil then begin
                    s.F_AliasNo := Format( '%d', [a] );
                    s.E_AliasNo := True;
                end;
            end;


        end;

    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetMaxDestinationId( ds : integer ): integer;
const
    FDestSourceTable : array [0..3] of integer = (
                UiDstButton_No,
                UiSrcButton_No,
                UiPanelDstButton_No,
                UiPanelSrcButton_No );

var
    dType, maxid : integer;

begin
    dType   := FDestSourceTable[ (SelectComboBox.ItemIndex * 2) + ds ];

    maxid   := FScreenList.NewId( dType );
    Result  := _GetMaxDestinationId( FLayoutData[ SelectComboBox.ItemIndex ], dType, ds, maxid );

{log}SetOpeLog( 'OPE:GetMaxDestinationId', Result );

//    maxid   := FScreenList.NewId( UiDstButton_No + ds );
//    Result  := _GetMaxDestinationId( FLayoutData[ 0 ], ds, maxid );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm._GetMaxDestinationId( lay : TLayoutData; dType, ds, startId : integer ) : integer;
var
    lb : TLayoutButton;
    i, id, ret : integer;

begin
    // 比較開始ID
    Result := startId;

    // これ以下の階層にデータなし
    if (nil = lay) or (nil = lay.Frame) then Exit;

    id := startId;

    for i:=0 to lay.List.Count-1 do begin

        lb := lay.List.Data[i];

        if nil <> lb.Button then begin

            // 対象のデータ
//            if lb.Button.FDataType = (UiDstButton_No + ds) then begin
            if lb.Button.FDataType = dType then begin
                if lb.Button.F_Id >= id then
                    // 最大値入れ替え
                    id := lb.Button.F_Id + 1;
            end;
        end;

        // 下の階層の最大値検索
        ret := _GetMaxDestinationId( lb.FChild[ ds ], dType, ds, id );

        // 下の階層の最大値と比較
        if ret > id then
            id := ret;
    end;

    Result := id;

//{log}SetOpeLog( 'OPE:_GetMaxDestinationId', dType, ds, id );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetMaxFrameId{( typ : integer )}: integer;
var
    i, maxid : integer;

begin

    maxid   := FScreenList.NewId( UiFrame_No );

    for i:=0 to HIGH( FLayoutData ) do begin
        maxid   := _GetMaxFrameId( FLayoutData[ i ], maxid );
    end;

    Result := maxid;

//    Result  := _GetMaxFrameId( FLayoutData[ typXpt ], maxid );
//    Result  := _GetMaxFrameId( FLayoutData[ typPanel ], maxid );

{log}SetOpeLog( 'OPE:GetMaxFrameId', maxid );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm._GetMaxFrameId( lay : TLayoutData; startId : integer ) : integer;
var
//    sc : TUiButton;
    lb : TLayoutButton;
    i, id, ret : integer;

begin
    // 比較開始ID
    Result := startId;

    // これ以下の階層にデータなし
    if (nil = lay) or (nil = lay.Frame) then Exit;

    id := startId;

    if lay.Frame.F_Id >= id then
        id := lay.Frame.F_Id + 1;

    for i:=0 to lay.List.Count-1 do begin

        lb := lay.List.Data[i];

        // 下の階層の最大値検索(DEST)
        ret := _GetMaxFrameId( lb.FChild[ 0 ], id );
        if ret > id then
            id := ret;

        // 下の階層の最大値検索(SOURCE)
        ret := _GetMaxFrameId( lb.FChild[ 1 ], id );
        if ret > id then
            id := ret;
    end;

    Result := id;

//{log}SetOpeLog( 'OPE:_GetMaxFrameId', id );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm.GetMaxScreenSelectButtonId{( typ : integer )}: integer;
var
    i, maxid : integer;

begin
    maxid   := FScreenList.NewId( UiScreenSelectButton_No );

    for i:=0 to HIGH( FLayoutData ) do begin
        maxid   := _GetMaxScreenSelectButtonId( FLayoutData[ i ], maxid );
    end;

    Result  := maxid;   //_GetMaxScreenSelectButtonId( FLayoutData[ typPanel ], maxid );

{log}SetOpeLog( 'OPE:GetMaxScreenSelectButtonId', maxid );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TMainForm._GetMaxScreenSelectButtonId( lay : TLayoutData; startId : integer ) : integer;
var
    lb : TLayoutButton;
    i, id, ret : integer;

begin
    // 比較開始ID
    Result := startId;

    // これ以下の階層にデータなし
    if (nil = lay) or (nil = lay.Frame) then Exit;

    id := startId;

    for i:=0 to lay.List.Count-1 do begin

        lb := lay.List.Data[i];

        if nil <> lb.Button then begin
            // 対象のデータ
            if lb.Button.FDataType = UiScreenSelectButton_No then begin
                if lb.Button.F_Id >= id then
                    // 最大値入れ替え
                    id := lb.Button.F_Id + 1;
            end;
        end;

        // 下の階層の最大値検索(DEST)
        ret := _GetMaxScreenSelectButtonId( lb.FChild[ 0 ], id );
        if ret > id then
            id := ret;

        // 下の階層の最大値検索(SOURCE)
        ret := _GetMaxScreenSelectButtonId( lb.FChild[ 1 ], id );
        if ret > id then
            id := ret;

    end;

    Result := id;

//{log}SetOpeLog( 'OPE:_GetMaxScreenSelectButtonId', id );
end;

//-----------------------------------------------------------------------------
//  保存中
//-----------------------------------------------------------------------------
procedure TMainForm.SaveButtonClick(Sender: TObject);
begin
    SaveDataBase;
end;

//-----------------------------------------------------------------------------
//  保存だけ
//-----------------------------------------------------------------------------
procedure TMainForm.SaveDataBase2;
begin
    MessageForm.Start( '保存中...' );

    // 保存する
    FScreenList.ScreenDbSave( FConfigData.DbPath + SCREEN_FILE ); //SaveEdit.Text );

    MessageForm.Close;
end;

//-----------------------------------------------------------------------------
//  保存
//-----------------------------------------------------------------------------
procedure TMainForm.SaveDataBase;
var
    i, j : integer;
    lst : TScreenList;

begin
{log}SetOpeLog( 'OPE:SaveDataBase' );

    MessageForm.Start( '保存中...' );

    // XPTをマージする

    // 削除用リスト作成
    lst := TScreenList.Create;
    FScreenList.SearchType( UiDstButton_No, lst );
    FScreenList.SearchType( UiSrcButton_No, lst );
    FScreenList.SearchType( UiPanelDstButton_No, lst );
    FScreenList.SearchType( UiPanelSrcButton_No, lst );

    for i:=0 to HIGH( FLayoutData ) do begin
        CompareLayout( FLayoutData[i], lst );
    end;

    // 使っていないボタンをデータベースから削除
    for i:=0 to lst.Count-1 do begin
        FScreenList.DeleteButton( lst.Data[i], 1{削除もする} );
    end;

    lst.Empty;
    lst.Free;

    // リスト表示をマージ
    for i:=typMainteList to typNameList do begin
        for j:=0 to FListLayoutList[ i ].Count-1 do begin
            CompareListLayout( FListLayoutList[ i ].Data[j] );
        end;
    end;

    // 番組レイアウトマージ
    for j:=0 to FPgmLayoutList.Count-1 do begin
        CompareListLayout( FPgmLayoutList.Data[j] );
    end;

    // ソート
//    FScreenList.SortDataType;

    // 保存する
    FScreenList.ScreenDbSave( FConfigData.DbPath + SCREEN_FILE ); //SaveEdit.Text );

    // ProgramIndex
    FProgramIndexDb.Save( FConfigData.DbPath + PRG_INDEX_FILE );

    // DisplayDb
    FDisplayList.Save( FConfigData.DbPath + DISPLAY_FILE );

    // SBUS DB
    FSbusDb.Save( FConfigData.DbPath + SBUS_FILE );

    MessageForm.Close;
end;

//-----------------------------------------------------------------------------
//  データタイプコンボボックス変更(LIST)
//-----------------------------------------------------------------------------
procedure TMainForm.SelectComboBox2Change(Sender: TObject);
begin

    MakeGroupListCombo;

    PostMessage( ListForm.Handle, WM_DATATYPE_CHANGE_MESSAGE,  SelectComboBox2.ItemIndex, 0 );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TMainForm.GroupComboBox2Change(Sender: TObject);
begin
    PostMessage( ListForm.Handle, WM_DATATYPE_CHANGE_MESSAGE,  GroupComboBox2.ItemIndex, 0 );
end;

//-----------------------------------------------------------------------------
//  データタイプコンボボックス変更
//-----------------------------------------------------------------------------
procedure TMainForm.SelectComboBoxChange(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:SelectComboBoxChange', SelectComboBox.ItemIndex );

    if True = CategoryComboBox.Visible then
        MakeCategoryCombo;

    if True = GroupComboBox.Visible then
        MakeGroupCombo;

//    CategoryComboBox.ItemIndex  := 0;
//    GroupComboBox.ItemIndex     := 0;

    PostMessage( SelectComboBox.Parent.Handle, WM_DATATYPE_CHANGE_MESSAGE,  SelectComboBox.ItemIndex, 0 );

end;

//-----------------------------------------------------------------------------
//  カテゴリコンボボックス変更
//-----------------------------------------------------------------------------
procedure TMainForm.CategoryComboBoxChange(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:CategoryComboBoxChange', CategoryComboBox.ItemIndex );

    MakeGroupCombo;

//    GroupComboBox.ItemIndex     := 0;

    PostMessage( CategoryComboBox.Parent.Handle, WM_DATATYPE_CHANGE_MESSAGE,  CategoryComboBox.ItemIndex, 1 );

end;

//-----------------------------------------------------------------------------
//  グループコンボボックス作成
//-----------------------------------------------------------------------------
procedure TMainForm.MakeGroupCombo;
var
    i, ds : integer;
    btn : TLayoutButton;
    cate : TLayoutButton;
    grp : TLayoutData;

begin
{log}SetOpeLog( 'OPE:MakeGroupCombo' );

    GroupComboBox.Items.Clear;

    cate    := FLayoutData[ CurrentDataSet ].List.Data[ CurrentCategory ];
    ds      := DestSource;
    grp     := cate.Child[ ds ];

    if nil = grp then Exit;

    for i:=0 to grp.List.Count-1 do begin
        btn := grp.List.Data[ i ];
        GroupComboBox.Items.Add( TUiScreenSelectButton( btn.Button ).F_Text );
    end;

    GroupComboBox.ItemIndex := 0;   //FCurrentCategory;
end;

//-----------------------------------------------------------------------------
//  カテゴリコンボボックス作成
//-----------------------------------------------------------------------------
procedure TMainForm.MakeCategoryCombo;
var
    btn : TLayoutButton;
    i : integer;

begin
{log}SetOpeLog( 'OPE:MakeCategoryCombo' );

    CategoryComboBox.Items.Clear;

    for i:=0 to FLayoutData[ CurrentDataSet ].List.Count-1 do begin
        btn := FLayoutData[ CurrentDataSet ].List.Data[i];
        CategoryComboBox.Items.Add( TUiScreenSelectButton( btn.Button ).F_Text );
    end;

    CategoryComboBox.ItemIndex := 0;   //FCurrentCategory;
end;

//-----------------------------------------------------------------------------
//  カテゴリコンボボックス作成(LIST GROUP)
//-----------------------------------------------------------------------------
procedure TMainForm.MakeGroupListCombo;
var
    btn : TListLayout;
    i : integer;

begin
{log}SetOpeLog( 'OPE:MakeGroupListCombo' );

    GroupComboBox2.Items.Clear;

    for i:=0 to FListLayoutList[ CurrentListType ].Count-1 do begin
        btn := FListLayoutList[ CurrentListType ].Data[i];

        GroupComboBox2.Items.Add( btn.Attribute );
    end;

    GroupComboBox2.ItemIndex := 0;   //FCurrentCategory;
end;

//-----------------------------------------------------------------------------
//  グループコンボボックス変更
//-----------------------------------------------------------------------------
procedure TMainForm.GroupComboBoxChange(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:GroupComboBoxChange', GroupComboBox.ItemIndex );

    PostMessage( GroupComboBox.Parent.Handle, WM_DATATYPE_CHANGE_MESSAGE,  GroupComboBox.ItemIndex, 2 );
end;

//-----------------------------------------------------------------------------
//  DESTINATION/SOURCE 選択
//-----------------------------------------------------------------------------
procedure TMainForm.DestRadioButtonClick(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:DestRadioButtonClick', TRadioButton( Sender ).Tag );

//    MakeCategoryCombo;
    MakeGroupCombo;

    PostMessage( DSPanel.Parent.Handle, WM_DATATYPE_CHANGE_MESSAGE, TRadioButton( Sender ).Tag, 3 );
end;

//-----------------------------------------------------------------------------
//  リストボタンマウスダウン
//-----------------------------------------------------------------------------
procedure TMainForm.ListToolButtonMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    po : TPoint;
    btn : TToolButton;

begin
{log}SetOpeLog( 'OPE:ListToolButtonMouseDown', TToolButton( Sender ).Caption );

    case TToolButton( Sender ).Tag of
    0:
        begin
            btn := ListToolButton;
            po  := ToolBar2.ClientToScreen( Point( btn.Left, TToolButton( Sender ).Height ) );
            ListPopupMenu.Popup( po.X, po.Y );
        end;

    1:
        begin
            btn := ProgramButton;
            po  := ToolBar2.ClientToScreen( Point( btn.Left, TToolButton( Sender ).Height ) );
            BanPopupMenu.Popup( po.X, po.Y );
        end;

    2:
        begin
            btn := PanelLayoutButton;
            po  := ToolBar2.ClientToScreen( Point( btn.Left, TToolButton( Sender ).Height ) );
            DevPopupMenu.Popup( po.X, po.Y );
        end;

    else Exit;
    end;

end;

//-----------------------------------------------------------------------------
//  リスト
//-----------------------------------------------------------------------------
procedure TMainForm.UiFrame1Click(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:UiFrame1Click', TMenuItem( Sender ).Caption );

    UiDstButtonListForm.Start( FScreenList, TMenuItem( Sender ).Tag );
end;

//-----------------------------------------------------------------------------
//  S-BUS DB
//-----------------------------------------------------------------------------
procedure TMainForm.SBusDB1Click(Sender: TObject);
begin
    SBusDbForm.Start( FSBusDb );
end;

//-----------------------------------------------------------------------------
//  Display DB
//-----------------------------------------------------------------------------
procedure TMainForm.DisplayDb1Click(Sender: TObject);
begin
    DisplayDBForm.Start( FDisplayList );
end;

//-----------------------------------------------------------------------------
//  終了
//-----------------------------------------------------------------------------
procedure TMainForm.ToolButton2Click(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:ToolButton2Click', TToolButton( Sender ).Caption );

    Close;
end;

//-----------------------------------------------------------------------------
//  環境設定
//-----------------------------------------------------------------------------
procedure TMainForm.ToolButton4Click(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:ToolButton4Click', TToolButton( Sender ).Caption );

    if False = ConfigForm.Start( FConfigData ) then Exit;



    FConfigData.Save;
end;

//-----------------------------------------------------------------------------
//  ウィンドウ閉じ
//-----------------------------------------------------------------------------
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{log}SetOpeLog( 'OPE:FormClose' );

    // INIファイル保存
    FConfigData.Save;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TMainForm.FormDestroy(Sender: TObject);
var
    i : integer;

begin

    FConfigData.Free;

    FScreenList.ClearAll;
    FScreenList.Free;

    for i:=0 to HIGH( FLayoutData ) do begin
        FLayoutData[i].Free;
    end;

{
    for i:=0 to HIGH( FListLayout ) do begin
        FListLayout[i].Free;
    end;
}
    for i:=0 to HIGH( FListLayoutList ) do begin
        FListLayoutList[i].Free;
    end;

    FLayoutBlockList.ClearAll;
    FLayoutBlockList.Free;

    FPgmLayoutList.ClearAll;
    FPgmLayoutList.Free;

    FSBusDb.Free;
    FProgramIndexDb.Free;

    FDisplayList.ClearAll;
    FDisplayList.Free;

    FPanelKeyLayout.Free;

    FDeviceLayoutList.ClearAll;
    FDeviceLayoutList.Free;

    FXptRangeList[0].ClearAll;
    FXptRangeList[0].Free;
    FXptRangeList[1].ClearAll;
    FXptRangeList[1].Free;

end;

//-----------------------------------------------------------------------------
//  再構築
//-----------------------------------------------------------------------------
procedure TMainForm.RebuildButtonClick(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:RebuildButtonClick' );

    RebuildProc;
end;

//-----------------------------------------------------------------------------
//  再構築
//-----------------------------------------------------------------------------
procedure TMainForm.RebuildProc;
begin
{log}SetOpeLog( 'OPE:RebuildProc' );

    MessageForm.Start( '削除中...' );

    // ボタン、フレーム削除
    case CurrentDataSet of
    typXPT:     CategoryAllDelete;
    typPanel:   CategoryAllDeletePanel;
    end;

    MessageForm.Start( '作成中...' );

    // ボタン、フレーム作成
    case CurrentDataSet of
    typXPT:     MakeNewCategory;
    typPanel:   MakeNewCategoryPanel;
    end;

    MessageForm.Start( '保存中...' );

    // 保存する
    SaveDataBase2;

    MessageForm.Close;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TMainForm.DeleteButton( frid : integer );
var
    lst : TScreenList;
    i, j : integer;

begin

    lst := TScreenList.Create;

    // FRAME 削除
    FScreenList.SearchSource( UiFrame_No, IntToStr( frid ), lst );
    for i:=0 to lst.Count-1 do begin

        DeleteButton( lst.Data[i].F_Id );

        MainForm.DeleteDataBase( lst.Data[i] );
    end;

    // ボタン類の削除
    for j:=UiScreenSelectButton_No to UiColorSrcKeyButton_No do begin

        lst.Empty;

        FScreenList.SearchSource( j, IntToStr( frid ), lst );
        for i:=0 to lst.Count-1 do begin
            DeleteDataBase( lst.Data[i] );
        end;

    end;

    lst.Free;
end;

//-----------------------------------------------------------------------------
//  カテゴリ内のフレーム、ボタン初期化
//-----------------------------------------------------------------------------
procedure TMainForm.CategoryAllDeletePanel;
var
    cate : TLayoutButton;
    fr : TUiButton;
    cl : TLayoutButtonList;
    i, j : integer;
    sl : TStringList;

begin

    sl := TStringList.Create;

    cl := MainForm.CategoryList;

    for i:=0 to cl.Count-1 do begin

        cate := cl.Data[ i ];

        // GROUP ボタンとボタンフレームに分割
        sl.Clear;
        DivideString( TUiScreenSelectButton( cate.Button ).F_FrameName, sl, ';' );

        for j:=0 to sl.Count-1 do begin

            fr := FScreenList.SearchByName( UiFrame_No, sl[j] );

            if fr = nil then break;

            DeleteButton( fr.F_Id );

            // カテゴリフレーム削除
            DeleteDataBase( fr );

            // カテゴリボタン削除
            fr := FScreenList.Search( UiScreenSelectButton_No, cate.Button.F_Id );
            DeleteDataBase( fr );
        end;

    end;

    sl.Free;

//-- 以下、ノラフレームがいるかもしれないのでルートフレーム以下をすべて削除 ----

    fr  := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, 'DST/SRC GP SEL' ) );
    if nil <> fr then
        DeleteButton( fr.F_Id );

    fr  := TUiFrame( FScreenList.SearchByTitle( UiFrame_No, 'BUTTON PANEL' ) );
    if nil <> fr then
        DeleteButton( fr.F_Id );

end;

//-----------------------------------------------------------------------------
//  カテゴリ内のフレーム、ボタン初期化
//-----------------------------------------------------------------------------
procedure TMainForm.CategoryAllDelete;
var
    cate : TLayoutButton;
    fr : TUiButton;
    cl : TLayoutButtonList;
    i : integer;

begin

    cl := MainForm.CategoryList;

    for i:=0 to cl.Count-1 do begin

        cate := cl.Data[ i ];

        fr := FScreenList.SearchByName( UiFrame_No, TUiScreenSelectButton( cate.Button ).F_FrameName );

        if fr = nil then break;

        DeleteButton( fr.F_Id );

        // カテゴリフレーム削除
        DeleteDataBase( fr );

        // カテゴリボタン削除
        fr := FScreenList.Search( UiScreenSelectButton_No, cate.Button.F_Id );
        DeleteDataBase( fr );
    end;
end;



procedure TMainForm.MusFlatButton1Click(Sender: TObject);
//var
//    fn : string;

begin

    FProgramIndexDb.Save( FConfigData.DbPath + PRG_INDEX_FILE );


//    // S-BUS読込み
//    fn := FConfigData.DbPath + SBUS_FILE + '.test';
//    FSBusDb.Save( fn );

end;





end.

