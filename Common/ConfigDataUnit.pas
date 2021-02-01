//******************************************************************************
//  MDC3000 for Note
//  �R���t�B�O���[�V�����f�[�^
//
//  �����������
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
//	�f�B�o�C�X�ŗL�̐ݒ�p
//------------------------------------------------------------------------------
    TConfigSystem	= record

        // �A�v���^�C�g��
        AppTitle                : string;

        //	�f�[�^�f�B���N�g��
        DbPath                  : string;

    end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
    TConfigUser = record

        color                   : array [0..15] of TColor;

        // XPT�J�e�S�����[�g
        XPTRootFrame            : string;

        // �p�l���J�e�S�����[�g
        PanelRootFrame          : string;

        // MAINTENANCE�APORT���[�g
        ListName                : array [0..7, 0..1] of string;

        // �ő�J�e�S���A�O���[�v
        MaxCategory             : integer;
        MaxGroup                : integer;

        // UNOD/REDO�ő�
        MaxUndo                 : integer;

        // DESTINATION�O���[�v���̃{�^����
        DstGroupButton          : integer;
        // SOURCE�O���[�v���̃{�^����
        SrcGroupButton          : integer;

        // ����
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
//  �R���t�B�O���[�V�����f�[�^�N���X
//------------------------------------------------------------------------------
    TConfigData = class(TObject)

    private

    	FFileName 	: string;

        function    GetListName( typ, ds : integer ) : string;
        procedure   SetListName( typ, ds : integer; nm : string );

    public

        config  	: TConfigration;

        // �R���X�g���N�^
        constructor Create( fn : string='' );

        // �f�X�g���N�^
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


        // UNOD/REDO�ő�
        property    MaxUndo : integer           read config.user.MaxUndo            write config.user.MaxUndo;

        // ����
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

        // �F
        property    MoveColor : TColor          read config.user.Color[0]           write config.user.Color[0];


        // �f�[�^�x�[�X
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
// �R���X�g���N�^
//------------------------------------------------------------------------------
constructor TConfigData.Create( fn : string );
begin
//    inherited;

	FFileName := fn;

    // �f�[�^������
    Initial;

    if fn <> '' then begin
        SystemLoad( fn );
        UserLoad( fn );
    end;

end;

//-----------------------------------------------------------------------------
//  �R�s�[
//-----------------------------------------------------------------------------
procedure TConfigData.CopySystem( src : TConfigData );
begin

//== SYSTEM ===================================================================

    AppTitle        := src.AppTitle;
    DbPath          := src.DbPath;

//== USER =====================================================================

    // �� USER �͕s�v

end;

//-----------------------------------------------------------------------------
//  �R�s�[
//-----------------------------------------------------------------------------
function TConfigData.CompareSystem( src : TConfigData ) : Boolean;
begin
    Result := False;

//-- �J���җp -----------------------------------------------------------------

    if AppTitle <> src.AppTitle     then Exit;
    if DbPath  <> src.DbPath        then Exit;

    Result := True;
end;

//------------------------------------------------------------------------------
//  �f�X�g���N�^
//------------------------------------------------------------------------------
destructor TConfigData.Destroy;
begin
    ;
end;

//------------------------------------------------------------------------------
//  �f�[�^������
//------------------------------------------------------------------------------
procedure TConfigData.Initial;
begin

//== SYSTEM ===================================================================


    // �A�v���^�C�g��
    AppTitle		    := 'PPROGRAM FILE CREATOR';

    //	�f�[�^�f�B���N�g��
//    DbPath              := 'C:\Users\K2_W10\Desktop\Z440���L\APP_DATA\';
    DbPath              := 'C:\Users\K2_W10\Desktop\Z440���L\�V�����t�H���_�[ (3)\App_Data(2)\';


//== USER =====================================================================

    // UNOD/REDO�ő�
    MaxUndo             := 8;

    // ����
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

    // �F
    MoveColor           := clLime;

    // XPT�J�e�S�����[�g
    XPTRootFrame        := 'DESTINATION GROUP CATEGORY SELECTOR';

    // �p�l���J�e�S�����[�g
    PanelRootFrame      := 'MTX GROUP SELECTOR';

    // MAINTENANCE�APORT���[�g
//    MaintePortList      := 'Set.Port';

    // �ő�J�e�S���A�O���[�v
    MaxCategory         := 10;
    MaxGroup            := 10;

    // DESTINATION�O���[�v���̃{�^����
    DstGroupButton      := 50;
    // SOURCE�O���[�v���̃{�^����
    SrcGroupButton      := 50;

    // ���X�g��
    ListName[ 0, 0 ]    := 'Set.Port.DstList';
    ListName[ 0, 1 ]    := 'Set.Port.SrcList';
    ListName[ 1, 0 ]    := 'Name.DstAll';
    ListName[ 1, 1 ]    := 'Name.All';

end;

//------------------------------------------------------------------------------
//  SYSTEM�ǂݍ���
//------------------------------------------------------------------------------
procedure TConfigData.SystemLoad( fn : string );
var
	iniFile: TIniFile;

begin

    if fn = '' then Exit;

	iniFile := TIniFile.Create(fn);

	with iniFile do begin

        // �A�v���^�C�g��
        AppTitle        := ReadString( 	'SYSTEM',		'AppTitle',        		AppTitle );

        //	�f�[�^�f�B���N�g��
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
//  SYSTEM �ۑ�
//------------------------------------------------------------------------------
procedure TConfigData.SystemSave;
var
	iniFile: TIniFile;

begin
    if FFileName = '' then Exit;

	iniFile := TIniFile.Create( FFileName );

    try

        with iniFile do begin

            // �A�v���^�C�g��
            WriteString( 	'SYSTEM',	'AppTitle',        		AppTitle );

            //	�f�[�^�f�B���N�g��
            WriteString( 	'SYSTEM',   'DbPath',        		DbPath );

        end;

    except
        ;
    end;

	iniFile.Free;
end;

//------------------------------------------------------------------------------
//  INI�t�@�C���ǂݍ���
//------------------------------------------------------------------------------
procedure TConfigData.UserLoad( fn : string );
var
	iniFile: TIniFile;

begin

	iniFile := TIniFile.Create(fn);

	with iniFile do begin

        // UNOD/REDO�ő�
        MaxUndo         := ReadInteger( 'Program',      'MaxUndo',          MaxUndo );

        // ����
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

//-- �F -----------------------------------------------------------------------
        MoveColor       := ReadInteger( 'COLOR',        'MoveColor',        MoveColor );

//-- �f�[�^�x�[�X -------------------------------------------------------------
        // XPT�J�e�S�����[�g
        XPTRootFrame    := ReadString(  'DataBase',     'XPTRootFrame',     XPTRootFrame );

        // �p�l���J�e�S�����[�g
        PanelRootFrame  := ReadString(  'DataBase',     'PanelRootFrame',   PanelRootFrame );

        // �ő�J�e�S���A�O���[�v
        MaxCategory     := ReadInteger( 'DataBase',     'MaxCategory',      MaxCategory );
        MaxGroup        := ReadInteger( 'DataBase',     'MaxGroup',         MaxGroup );

        // ���X�g��
        ListName[0,0]   := ReadString(  'DataBase',     'ListDstSetPort',   ListName[0,0] );
        ListName[0,1]   := ReadString(  'DataBase',     'ListSrcSetPort',   ListName[0,1] );
        ListName[1,0]   := ReadString(  'DataBase',     'ListDstName',      ListName[1,0] );
        ListName[1,1]   := ReadString(  'DataBase',     'ListSrcName',      ListName[1,1] );

        // DESTINATION�O���[�v���̃{�^����
        DstGroupButton  := ReadInteger( 'DataBase',     'DstGroupButton',   DstGroupButton );

        // SOURCE�O���[�v���̃{�^����
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
//  USER �ۑ�
//------------------------------------------------------------------------------
procedure TConfigData.UserSave;
var
	iniFile: TIniFile;

begin
    if FFileName = '' then Exit;

	iniFile := TIniFile.Create( FFileName );

    try

        with iniFile do begin

            // UNOD/REDO�ő�
            WriteInteger(   'Program',      'MaxUndo',          MaxUndo );

            // ����
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

//-- �F -----------------------------------------------------------------------

            WriteString(    'COLOR',        'MoveColor',        HEX2STR( MoveColor ) );

//-- �f�[�^�x�[�X -------------------------------------------------------------

            // XPT�J�e�S�����[�g
            WriteString(    'DataBase',     'XPTRootFrame',     XPTRootFrame );

            // �p�l���J�e�S�����[�g
            WriteString(    'DataBase',     'PanelRootFrame',   PanelRootFrame );

            // �ő�J�e�S���A�O���[�v
            WriteInteger(   'DataBase',     'MaxCategory',      MaxCategory );
            WriteInteger(   'DataBase',     'MaxGroup',         MaxGroup );

            // ���X�g��
            WriteString(    'DataBase',     'ListDstSetPort',   ListName[0,0] );
            WriteString(    'DataBase',     'ListSrcSetPort',   ListName[0,1] );
            WriteString(    'DataBase',     'ListDstName',      ListName[1,0] );
            WriteString(    'DataBase',     'ListSrcName',      ListName[1,1] );

            // DESTINATION�O���[�v���̃{�^����
            WriteInteger(   'DataBase',     'DstGroupButton',   DstGroupButton );

            // SOURCE�O���[�v���̃{�^����
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

