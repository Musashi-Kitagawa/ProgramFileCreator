//******************************************************************************
//  MDC3000 for Note
//  コンフィグレーションデータ
//
//  武蔵株式会社
//  Apr - 4 - '17
//******************************************************************************
unit ConfigDataUnit;

interface

uses
	Windows, Messages, Classes, SysUtils, Controls, Forms, StdCtrls, Graphics,
    StrUtils, WinSock, math, ComCtrls, ExtCtrls, MMSystem, Dialogs, IniFiles,
    System.DateUtils,
//
	CommonUnit;

type

//------------------------------------------------------------------------------
//	ディバイス固有の設定用
//------------------------------------------------------------------------------
    TConfigSystem	= record

        // アプリタイトル
        AppTitle                : string;

        //	データディレクトリ
        DbPath                  : string;

    end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
    TConfigUser = record

        color                   : array [0..15] of TColor;

        // XPTカテゴリルート
        XPTRootFrame            : string;

        // パネルカテゴリルート
        PanelRootFrame          : string;

        // MAINTENANCE、PORTルート
        ListName                : array [0..7, 0..1] of string;

        // 最大カテゴリ、グループ
        MaxCategory             : integer;
        MaxGroup                : integer;

        // UNOD/REDO最大
        MaxUndo                 : integer;

        // DESTINATIONグループ内のボタン数
        DstGroupButton          : integer;
        // SOURCEグループ内のボタン数
        SrcGroupButton          : integer;

        // 高さ
        XptCateH                : integer;
        XptGrpH                 : integer;
        XptDstH                 : integer;
        XptSrcH                 : integer;

        XptXSpace               : integer;
        XptYSpace               : integer;

        PanelCateH              : integer;
        PanelGrpH               : integer;

        CatePrifixEdit          : string;
        GroupPrifixEdit         : string;

        TopMargin               : integer;
        LeftMargin              : integer;

    end;

    TConfigration = record
        system      : TConfigSystem;
        user	    : TConfigUser;
    end;

//    PTConfigration = ^TConfigration;

//------------------------------------------------------------------------------
//  コンフィグレーションデータクラス
//------------------------------------------------------------------------------
    TConfigData = class(TObject)

    private

    	FFileName 	: string;

        function    GetListName( typ, ds : integer ) : string;
        procedure   SetListName( typ, ds : integer; nm : string );

    public

        config  	: TConfigration;

        // コンストラクタ
        constructor Create( fn : string='' );

        // デストラクタ
        destructor 	Destroy; override;

        procedure   CopySystem( src : TConfigData );
        function    CompareSystem( src : TConfigData ) : Boolean;
        procedure   Initial;
        procedure   SystemLoad( fn : string );
        procedure   Save( fn : string='' );
        procedure   SystemSave;
        procedure   UserLoad( fn : string );
        procedure   UserSave;

//== SYSTEM ===================================================================

		property	AppTitle : string		    read config.system.AppTitle		    write config.system.AppTitle;
		property	DbPath : string		        read config.system.DbPath		    write config.system.DbPath;


//== USER =====================================================================


        // UNOD/REDO最大
        property    MaxUndo : integer           read config.user.MaxUndo            write config.user.MaxUndo;

        // 高さ
        property    XptCateH : integer          read config.user.XptCateH           write config.user.XptCateH;
        property    XptGrpH : integer           read config.user.XptGrpH            write config.user.XptGrpH;
        property    XptDstH : integer           read config.user.XptDstH            write config.user.XptDstH;
        property    XptSrcH : integer           read config.user.XptSrcH            write config.user.XptSrcH;

        property    XptXSpace : integer         read config.user.XptXSpace          write config.user.XptXSpace;
        property    XptYSpace : integer         read config.user.XptYSpace          write config.user.XptYSpace;

        property    PanelCateH : integer        read config.user.PanelCateH         write config.user.PanelCateH;
        property    PanelGrpH : integer         read config.user.PanelGrpH          write config.user.PanelGrpH;

        property    CatePrifix : string         read config.user.CatePrifixEdit     write config.user.CatePrifixEdit;
        property    GroupPrifix : string        read config.user.GroupPrifixEdit    write config.user.GroupPrifixEdit;

        property    TopMargin : integer         read config.user.TopMargin          write config.user.TopMargin;
        property    LeftMargin : integer        read config.user.LeftMargin         write config.user.LeftMargin;

        // 色
        property    MoveColor : TColor          read config.user.Color[0]           write config.user.Color[0];


        // データベース
        property    XPTRootFrame : string       read config.user.XPTRootFrame       write config.user.XPTRootFrame;
        property    PanelRootFrame : string     read config.user.PanelRootFrame     write config.user.PanelRootFrame;
        property    ListName[typ,ds:integer] : string   read GetListName                    write SetListName;
        property    MaxCategory : integer       read config.user.MaxCategory        write config.user.MaxCategory;
        property    MaxGroup : integer          read config.user.MaxGroup           write config.user.MaxGroup;
        property    DstGroupButton : integer    read config.user.DstGroupButton     write config.user.DstGroupButton;
        property    SrcGroupButton : integer    read config.user.SrcGroupButton     write config.user.SrcGroupButton;

    end;

implementation


//------------------------------------------------------------------------------
// コンストラクタ
//------------------------------------------------------------------------------
constructor TConfigData.Create( fn : string );
begin
//    inherited;

	FFileName := fn;

    // データ初期化
    Initial;

    if fn <> '' then begin
        SystemLoad( fn );
        UserLoad( fn );
    end;

end;

//-----------------------------------------------------------------------------
//  コピー
//-----------------------------------------------------------------------------
procedure TConfigData.CopySystem( src : TConfigData );
begin

//== SYSTEM ===================================================================

    AppTitle        := src.AppTitle;
    DbPath          := src.DbPath;

//== USER =====================================================================

    // ※ USER は不要

end;

//-----------------------------------------------------------------------------
//  コピー
//-----------------------------------------------------------------------------
function TConfigData.CompareSystem( src : TConfigData ) : Boolean;
begin
    Result := False;

//-- 開発者用 -----------------------------------------------------------------

    if AppTitle <> src.AppTitle     then Exit;
    if DbPath  <> src.DbPath        then Exit;

    Result := True;
end;

//------------------------------------------------------------------------------
//  デストラクタ
//------------------------------------------------------------------------------
destructor TConfigData.Destroy;
begin
    ;
end;

//------------------------------------------------------------------------------
//  データ初期化
//------------------------------------------------------------------------------
procedure TConfigData.Initial;
begin

//== SYSTEM ===================================================================


    // アプリタイトル
    AppTitle		    := 'PPROGRAM FILE CREATOR';

    //	データディレクトリ
//    DbPath              := 'C:\Users\K2_W10\Desktop\Z440共有\APP_DATA\';
    DbPath              := 'C:\Users\K2_W10\Desktop\Z440共有\新しいフォルダー (3)\App_Data(2)\';


//== USER =====================================================================

    // UNOD/REDO最大
    MaxUndo             := 8;

    // 高さ
    XptCateH            := 65;
    XptGrpH             := 65;
    XptDstH             := 355;
    XptSrcH             := 0;

    XptXSpace           := 0;
    XptYSpace           := 0;

    PanelCateH          := 65;
    PanelGrpH           := 65;

    CatePrifix          := 'CATEGORY-';
    GroupPrifix         := 'GROUP-';

    TopMargin           := 0;
    LeftMargin          := 0;

    // 色
    MoveColor           := clLime;

    // XPTカテゴリルート
    XPTRootFrame        := 'DESTINATION GROUP CATEGORY SELECTOR';

    // パネルカテゴリルート
    PanelRootFrame      := 'MTX GROUP SELECTOR';

    // MAINTENANCE、PORTルート
//    MaintePortList      := 'Set.Port';

    // 最大カテゴリ、グループ
    MaxCategory         := 10;
    MaxGroup            := 10;

    // DESTINATIONグループ内のボタン数
    DstGroupButton      := 50;
    // SOURCEグループ内のボタン数
    SrcGroupButton      := 50;

    // リスト名
    ListName[ 0, 0 ]    := 'Set.Port.DstList';
    ListName[ 0, 1 ]    := 'Set.Port.SrcList';
    ListName[ 1, 0 ]    := 'Name.DstAll';
    ListName[ 1, 1 ]    := 'Name.All';

end;

//------------------------------------------------------------------------------
//  SYSTEM読み込み
//------------------------------------------------------------------------------
procedure TConfigData.SystemLoad( fn : string );
var
	iniFile: TIniFile;

begin

    if fn = '' then Exit;

	iniFile := TIniFile.Create(fn);

	with iniFile do begin

        // アプリタイトル
        AppTitle        := ReadString( 	'SYSTEM',		'AppTitle',        		AppTitle );

        //	データディレクトリ
        DbPath          := ReadString( 	'SYSTEM',		'DbPath',        		DbPath );

    end;

	iniFile.Free;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TConfigData.Save( fn : string );
begin
    if fn <> '' then
	    FFileName := fn;

	SystemSave;
	UserSave;
end;

//------------------------------------------------------------------------------
//  SYSTEM 保存
//------------------------------------------------------------------------------
procedure TConfigData.SystemSave;
var
	iniFile: TIniFile;

begin
    if FFileName = '' then Exit;

	iniFile := TIniFile.Create( FFileName );

    try

        with iniFile do begin

            // アプリタイトル
            WriteString( 	'SYSTEM',	'AppTitle',        		AppTitle );

            //	データディレクトリ
            WriteString( 	'SYSTEM',   'DbPath',        		DbPath );

        end;

    except
        ;
    end;

	iniFile.Free;
end;

//------------------------------------------------------------------------------
//  INIファイル読み込み
//------------------------------------------------------------------------------
procedure TConfigData.UserLoad( fn : string );
var
	iniFile: TIniFile;

begin

	iniFile := TIniFile.Create(fn);

	with iniFile do begin

        // UNOD/REDO最大
        MaxUndo         := ReadInteger( 'Program',      'MaxUndo',          MaxUndo );

        // 高さ
        XptCateH        := ReadInteger( 'Program',      'XptCateH',         XptCateH );
        XptGrpH         := ReadInteger( 'Program',      'XptGrpH',          XptGrpH );
        XptDstH         := ReadInteger( 'Program',      'XptDstH',          XptDstH );
        XptSrcH         := ReadInteger( 'Program',      'XptSrcH',          XptSrcH );

        XptXSpace       := ReadInteger( 'Program',      'XptXSpace',        XptXSpace );
        XptYSpace       := ReadInteger( 'Program',      'XptYSpace',        XptYSpace );

        PanelCateH      := ReadInteger( 'Program',      'PanelCateH',       PanelCateH );
        PanelGrpH       := ReadInteger( 'Program',      'PanelGrpH',        PanelGrpH );

        CatePrifix      := ReadString(  'Program',      'CatePrifix',       CatePrifix );
        GroupPrifix     := ReadString(  'Program',      'GroupPrifix',      GroupPrifix );

        TopMargin       := ReadInteger( 'Program',      'TopMargin',        TopMargin );
        LeftMargin      := ReadInteger( 'Program',      'LeftMargin',       LeftMargin );

//-- 色 -----------------------------------------------------------------------
        MoveColor       := ReadInteger( 'COLOR',        'MoveColor',        MoveColor );

//-- データベース -------------------------------------------------------------
        // XPTカテゴリルート
        XPTRootFrame    := ReadString(  'DataBase',     'XPTRootFrame',     XPTRootFrame );

        // パネルカテゴリルート
        PanelRootFrame  := ReadString(  'DataBase',     'PanelRootFrame',   PanelRootFrame );

        // 最大カテゴリ、グループ
        MaxCategory     := ReadInteger( 'DataBase',     'MaxCategory',      MaxCategory );
        MaxGroup        := ReadInteger( 'DataBase',     'MaxGroup',         MaxGroup );

        // リスト名
        ListName[0,0]   := ReadString(  'DataBase',     'ListDstSetPort',   ListName[0,0] );
        ListName[0,1]   := ReadString(  'DataBase',     'ListSrcSetPort',   ListName[0,1] );
        ListName[1,0]   := ReadString(  'DataBase',     'ListDstName',      ListName[1,0] );
        ListName[1,1]   := ReadString(  'DataBase',     'ListSrcName',      ListName[1,1] );

        // DESTINATIONグループ内のボタン数
        DstGroupButton  := ReadInteger( 'DataBase',     'DstGroupButton',   DstGroupButton );

        // SOURCEグループ内のボタン数
        SrcGroupButton  := ReadInteger( 'DataBase',     'SrcGroupButton',   SrcGroupButton );

    end;


	iniFile.Free;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function HEX2STR( val : integer ) : string;
begin
    Result := Format( '$%.8X', [val] );
end;

//------------------------------------------------------------------------------
//  USER 保存
//------------------------------------------------------------------------------
procedure TConfigData.UserSave;
var
	iniFile: TIniFile;

begin
    if FFileName = '' then Exit;

	iniFile := TIniFile.Create( FFileName );

    try

        with iniFile do begin

            // UNOD/REDO最大
            WriteInteger(   'Program',      'MaxUndo',          MaxUndo );

            // 高さ
            WriteInteger(   'Program',      'XptCateH',         XptCateH );
            WriteInteger(   'Program',      'XptGrpH',          XptGrpH );
            WriteInteger(   'Program',      'XptDstH',          XptDstH );
            WriteInteger(   'Program',      'XptSrcH',          XptSrcH );

            WriteInteger(   'Program',      'XptXSpace',        XptXSpace );
            WriteInteger(   'Program',      'XptYSpace',        XptYSpace );

            WriteInteger(   'Program',      'PanelCateH',       PanelCateH );
            WriteInteger(   'Program',      'PanelGrpH',        PanelGrpH );

            WriteString(    'Program',      'CatePrifix',       CatePrifix );
            WriteString(    'Program',      'GroupPrifix',      GroupPrifix );

            WriteInteger(   'Program',      'TopMargin',        TopMargin );
            WriteInteger(   'Program',      'LeftMargin',       LeftMargin );

//-- 色 -----------------------------------------------------------------------

            WriteString(    'COLOR',        'MoveColor',        HEX2STR( MoveColor ) );

//-- データベース -------------------------------------------------------------

            // XPTカテゴリルート
            WriteString(    'DataBase',     'XPTRootFrame',     XPTRootFrame );

            // パネルカテゴリルート
            WriteString(    'DataBase',     'PanelRootFrame',   PanelRootFrame );

            // 最大カテゴリ、グループ
            WriteInteger(   'DataBase',     'MaxCategory',      MaxCategory );
            WriteInteger(   'DataBase',     'MaxGroup',         MaxGroup );

            // リスト名
            WriteString(    'DataBase',     'ListDstSetPort',   ListName[0,0] );
            WriteString(    'DataBase',     'ListSrcSetPort',   ListName[0,1] );
            WriteString(    'DataBase',     'ListDstName',      ListName[1,0] );
            WriteString(    'DataBase',     'ListSrcName',      ListName[1,1] );

            // DESTINATIONグループ内のボタン数
            WriteInteger(   'DataBase',     'DstGroupButton',   DstGroupButton );

            // SOURCEグループ内のボタン数
            WriteInteger(   'DataBase',     'SrcGroupButton',   SrcGroupButton );
        end;

    except
        ;
    end;

	iniFile.Free;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TConfigData.GetListName( typ, ds : integer ) : string;
begin
    Result := config.user.ListName[ typ, ds ];
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TConfigData.SetListName( typ, ds : integer; nm : string );
begin
    config.user.ListName[ typ, ds ]   := nm;
end;


end.

