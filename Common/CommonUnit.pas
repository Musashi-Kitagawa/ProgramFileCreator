//******************************************************************************
//  COMMON (主にXDCAM用
//
//  武蔵株式会社
//  Sep - 18 - '07
//******************************************************************************
unit CommonUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, StrUtils, Winsock, Contnrs, math, DateUtils,
  ExtCtrls, ComCtrls, IdUDPClient, IdStack, System.Types, MusFlatButton;
//
//    {TimeCodeUnit, }MusFlatButton;  //, M3kClipPanel, LogUtilUnit;

const
    MAX_TYPE        = 4;
    MAX_PAGE_BUTTON = 50;
    MAX_PORT        = 4096;
//    MAX_SOZAI       4*1024

const
    TOP_COLOR       = $00c47244;
    ODD_COLOR       = $EAD5CF;
    EVEN_COLOR      = $F5EBE9;


    WM_DATATYPE_CHANGE_MESSAGE      = (WM_USER + 1000);


type
	SHORT           = SmallInt;


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  プロトタイプ宣言
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure 	SetButtonOnOff( btn : TMusFlatButton; sw : Boolean );
function 	GetAppVersion( exeName : string ) : string;
procedure 	ErrorMessage( msg : string );
procedure 	InformationMessage( msg : string );
function 	ConfirmMessage2( msg : string ) : integer;
function 	ConfirmMessage3( msg : string ) : integer;
function    ConfirmMessage4( msg : string ) : integer;
function    ConfirmMessage( msg : string ) : integer;
procedure   WarningMessage( msg : string );
function    CustomMessageDlg( msg : string; DlgType: TMsgDlgType; Buttons : TMsgDlgButtons; defultButton : string ) : Word;
function    CustomMessageDlg2( pos : TPoint; msg : string; DlgType: TMsgDlgType; Buttons : TMsgDlgButtons; defultButton : string ) : integer;
procedure   CenterTextRect( can : TCanvas; rct : TRect; str : string; opt : Boolean=True );
procedure   LeftTextRect( can : TCanvas; rct : TRect; str : string; opt : Boolean=False );
procedure   RightTextRect( can : TCanvas; rct : TRect; str : string; opt : Boolean=False );
procedure   DivideString( str : string; sl : TStringList; del : Char );
function    XSize( x : string; w : integer ) : integer;
function    BoolString( sw : Boolean ) : string;

{
procedure   ButtonDisableColor( btn : TMusFlatButton );
procedure   SetButtonColors( onc, offc, onf, offf, dis, disf : TColor );
function 	IsButtonOn( btn : TMusFlatButton ) : Boolean; overload;
procedure 	SetButtonOnOff( btn : TMusFlatButton; sw : Boolean ); overload;
//procedure 	SetButtonOnOff2( btn : TMusFlatButton; sw : Boolean );
function    IsButtonOn( btn : TPanel ) : Boolean; overload;
procedure   SetButtonOnOff( btn : TPanel; sw : Boolean ); overload;
}

implementation

uses
	MainUnit, SHELLAPI;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure SetButtonOnOff( btn : TMusFlatButton; sw : Boolean );
begin
    if True = sw then begin
        btn.Color       := $000080ff;
        btn.Font.Color  := clBlack;
    end
    else begin
        btn.Color       := clBtnface;
        btn.Font.Color  := clBlack;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure DivideString( str : string; sl : TStringList; del : Char );
begin
	//	区切り文字をセット
    sl.Delimiter		:= del;
    sl.DelimitedText	:= str;
end;

//------------------------------------------------------------------------------
//  アプリケーションバージョン取得
//------------------------------------------------------------------------------
function GetAppVersion( exeName : string ) : string;
const
	InfoNum = 10;
  	InfoStr: array[1..InfoNum] of string = ( 'CompanyName',
    										 'FileDescription',
                                             'FileVersion',
                                             'InternalName',
                                             'LegalCopyright',
                                             'LegalTradeMarks',
                                             'OriginalFileName',
                                             'ProductName',
                                             'ProductVersion',
                                             'Comments');

var
  	S			: string;
  	n, Len		: DWORD;
  	Buf			: PChar;
  	Value		: PChar;
    version		: string;

begin
	version := '';

    //	ファイルバージョン情報サイズを得る
	S := exeName;
    n := GetFileVersionInfoSize( PChar(S), n );

	if n > 0 then begin
	    Buf := AllocMem( n );

    	GetFileVersionInfo( PChar(S), 0, n, Buf );

        version := '';

//        // バージョン情報のコメント
//        if VerQueryValue( Buf, PChar('StringFileInfo\041103A4\' + InfoStr[3]), Pointer(Value), Len) then begin
////        if VerQueryValue( Buf, PChar('StringFileInfo\040904E4\' + InfoStr[10]), Pointer(Value), Len) then begin
//        	version := version + Value;
//        end;

        // ファイルバージョン
        if VerQueryValue( Buf, PChar('StringFileInfo\041103A4\' + InfoStr[3]), Pointer(Value), Len) then begin
//        if VerQueryValue( Buf, PChar('StringFileInfo\040904E4\' + InfoStr[3]), Pointer(Value), Len) then begin
        	version := version + Value;
        end;

    	FreeMem(Buf, n);
  	end;

    Result	:= version;
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  汎用関数
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure CenterTextRect( can : TCanvas; rct : TRect; str : string; opt : Boolean=True );
var
	w, h, l, t : integer;

begin
    w := can.TextWidth( str );	l := ((rct.Right-rct.Left) - w) div 2;
    h := can.TextHeight( str );	t := ((rct.Bottom-rct.Top) - h) div 2;

//    can.TextRect( rct, rct.Left + l, rct.Top + t, str );

	if opt = True then
    	SetBKMode( can.Handle, OPAQUE )
	else
    	SetBKMode( can.Handle, TRANSPARENT );

    can.TextOut( rct.Left + l, rct.Top + t, str );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure LeftTextRect( can : TCanvas; rct : TRect; str : string; opt : Boolean=False );
var
	h, t : integer;

begin
    h := can.TextHeight( str );	t := ((rct.Bottom-rct.Top) - h) div 2;

//    can.TextRect( rct, rct.Left, rct.Top + t, str );

	if opt = True then
    	SetBKMode( can.Handle, OPAQUE )
	else
    	SetBKMode( can.Handle, TRANSPARENT );

    can.TextOut( rct.Left, rct.Top + t, str );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure RightTextRect( can : TCanvas; rct : TRect; str : string; opt : Boolean=False );
var
	w, l, h, t : integer;

begin
    w := can.TextWidth( str );	l := rct.Right-w;
    h := can.TextHeight( str );	t := ((rct.Bottom-rct.Top) - h) div 2;

//    can.TextRect( rct, {rct.Left}l, rct.Top + t, str );

	if opt = True then
    	SetBKMode( can.Handle, OPAQUE )
	else
    	SetBKMode( can.Handle, TRANSPARENT );
//	SetBKMode( can.Handle, TRANSPARENT );
    can.TextOut( l, rct.Top + t, str );
end;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure InformationMessage( msg : string );
begin
    CustomMessageDlg( msg, mtInformation, [mbOK], 'OK' );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure WarningMessage( msg : string );
begin
    CustomMessageDlg( msg, mtWarning, [mbOK], 'OK' );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure ErrorMessage( msg : string );
begin
    CustomMessageDlg( msg, mtError, [mbOK], 'OK' );
end;

{
  mbYes	= System.UITypes.TMsgDlgBtn.mbYes;
  mbNo	= System.UITypes.TMsgDlgBtn.mbNo;
  mbOK	= System.UITypes.TMsgDlgBtn.mbOK;
  mbCancel	= System.UITypes.TMsgDlgBtn.mbCancel;
  mbAbort	= System.UITypes.TMsgDlgBtn.mbAbort;
  mbRetry	= System.UITypes.TMsgDlgBtn.mbRetry;
  mbIgnore	= System.UITypes.TMsgDlgBtn.mbIgnore;
  mbAll	= System.UITypes.TMsgDlgBtn.mbAll;
  mbNoToAll	= System.UITypes.TMsgDlgBtn.mbNoToAll;
  mbYesToAll	= System.UITypes.TMsgDlgBtn.mbYesToAll;
  mbHelp	= System.UITypes.TMsgDlgBtn.mbHelp;
  mbClose	= System.UITypes.TMsgDlgBtn.mbClose;

}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function ConfirmMessage( msg : string ) : integer;
begin
    result := CustomMessageDlg( msg, mtConfirmation, [mbOK, mbCancel], 'Cancel' );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function ConfirmMessage2( msg : string ) : integer;
begin
    result := CustomMessageDlg( msg, mtWarning, [mbOK, mbCancel], 'Cancel' );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function ConfirmMessage3( msg : string ) : integer;
begin
    result := CustomMessageDlg( msg, mtConfirmation, [mbOK, mbCancel, mbAll], 'Cancel' );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function ConfirmMessage4( msg : string ) : integer;
begin
    Result := CustomMessageDlg2( Point(-1,-1), msg, mtConfirmation, [mbYes, mbNo, mbCancel], 'Cancel' );

//{log}SetOpeLog( 'OPE:ConfirmMessage4', msg, IntToStr(Result) );
end;

//------------------------------------------------------------------------------
//  メッセージ用ダイアログオープン
//------------------------------------------------------------------------------
function CustomMessageDlg(
    msg : string;
    DlgType: TMsgDlgType;
    Buttons : TMsgDlgButtons;
    defultButton : string ) : Word;

var
    dlg : TForm;
	lbl : TLabel;
    dummy : string;
	btn : TButton;
    i, w, h : integer;

begin
	//	メッセージダイアログを作成
	dummy := DupeString( ' ', 80 );		//128 );
    dlg := CreateMessageDialog( dummy, DlgType, Buttons );

	//	デフォルトボタンをセット
    dlg.ActiveControl := TWinControl( dlg.FindComponent( defultButton ) );
//    dlg.Color		:= $00ff8080;

//{log}SetOpeLog( 'OPE:CustomMessageDlg ' + msg );

    lbl	:= TLabel( dlg.FindComponent('message') );
    lbl.Transparent := True;
    lbl.Font.Size	:= 10;
    lbl.Font.Style	:= [fsBold];
    lbl.Font.Name	:= 'メイリオ';  // ＭＳ ゴシック';
    lbl.AutoSize	:= True;

	// 文字列幅
    w := lbl.Width;

    lbl.caption			:= msg;

    case DlgType of
    mtError:			dlg.Color := $00c0c0f0;
    mtInformation:		dlg.Color := $00ffe0d0;
    mtConfirmation:		dlg.Color := $00c0f0f0;
	mtWarning:			dlg.Color := $00c0f0f0;
	end;

    // 文字列高さ
    h := lbl.Height;

//    TImage( FindComponent('image').Picture.Icon.Handle	:= Application.Icon.Handle;

    for i:=2 to dlg.ComponentCount-1 do begin
        btn				:= TButton( dlg.Components[ i ] );
        btn.Top			:= h + 35;
        btn.Height		:= 30;
        btn.Font.Size	:= 9;
	    btn.Font.Style	:= [fsBold];
        btn.Font.Name	:= 'メイリオ';  // ＭＳ ゴシック';
    end;

{
    // ウィンドウ位置セット
	if -1 <> pos.y then	dlg.Top		:= pos.y;
	if -1 <> pos.x then dlg.Left 	:= pos.x;
}

    // ウィンドウサイズセット
	dlg.Width	:= w + 80;
	dlg.Height	:= h + 100;

    //	表示して結果を得る
    Result := dlg.ShowModal;

//{log}SetOpeLog( 'OPE:CustomMessageDlg ' + IntToStr(Result) );

    dlg.Free;
end;

//------------------------------------------------------------------------------
//  メッセージ用ダイアログオープン
//------------------------------------------------------------------------------
function CustomMessageDlg2(
	pos : TPoint;
    msg : string;
    DlgType: TMsgDlgType;
    Buttons : TMsgDlgButtons;
    defultButton : string ) : integer;

var
    dlg : TForm;
	lbl : TLabel;
    dummy : string;
	btn : TButton;
    i, w, h : integer;

begin
	//	メッセージダイアログを作成
	dummy := DupeString( ' ', 80 );		//128 );
    dlg := CreateMessageDialog( dummy, DlgType, Buttons );

	//	デフォルトボタンをセット
    dlg.ActiveControl := TWinControl( dlg.FindComponent( defultButton ) );
//    dlg.Color		:= $00ff8080;

    dlg.Width       := 600;

    lbl	:= TLabel( dlg.FindComponent('message') );
    lbl.Transparent := True;
    lbl.Font.Size	:= 10;
    lbl.Font.Name	:= 'メイリオ';  // ＭＳ ゴシック';
    lbl.Font.Style	:= [fsBold];
    lbl.AutoSize	:= True;
    lbl.Width       := dlg.Width - 80;
    lbl.Caption			:= msg;

	// 文字列幅
    w := lbl.Width;

    case DlgType of
    mtError:			dlg.Color := $00c0c0f0;
    mtInformation:		dlg.Color := $00ffe0d0;
    mtConfirmation:		dlg.Color := $00c0f0f0;
	mtWarning:			dlg.Color := $00c0f0f0;
	end;

    // 文字列高さ
    h := lbl.Height;

//    TImage( FindComponent('image').Picture.Icon.Handle	:= Application.Icon.Handle;

    for i:=2 to dlg.ComponentCount-1 do begin
        btn				:= TButton( dlg.Components[ i ] );
        btn.Top			:= h + 35;
        btn.Height		:= 30;

        btn.Width		:= 140;
        btn.Left		:= 50 + 170 * (i-2);

        btn.Font.Size	:= 9;
        btn.Font.Name	:= 'メイリオ';  // ＭＳ ゴシック';

        case i of
        2:  btn.Caption := 'CLOSEしてREC';
        3:  btn.Caption := 'INTERNALだけREC';
        end;

    end;

    // ウィンドウ位置セット
	if -1 <> pos.y then	dlg.Top		:= pos.y;
	if -1 <> pos.x then dlg.Left 	:= pos.x;

    // ウィンドウサイズセット
	dlg.Width	:= w + 80 + 100;
	dlg.Height	:= h + 100;
    dlg.Left    := (Screen.Width - dlg.Width) div 2;

    //	表示して結果を得る
    Result := dlg.ShowModal;

    dlg.Free;
end;

const
    ORIGINAL_WIDTH  = 1440;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function XSize( x : string; w : integer ) : integer;
var
    str : string;
    e, e2 : Extended;

begin
    if '' = x then begin
        Result := 60;   //pa.Width;
        Exit;
    end;

//    if AnsiRightStr( AnsiString(x), 2 ) = 'px' then begin
    if AnsiRightStr( x, 2 ) = 'px' then begin

        str     := Copy( x, 1, Length(x)-2 );
//        Result  := StrToIntDef( str, 0 );

        e   := StrToFloatDef( str, 1 );
        e2  := w;
        Result := Round( e * Extended(e2) / ORIGINAL_WIDTH + 0.5 );
    end
    else begin
        e   := StrToFloatDef( x, 1 );
        e2  := w;
        Result := Round( e * Extended(e2) / 100 + 0.5 );
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function BoolString( sw : Boolean ) : string;
begin
    if True = sw then   Result := 'true'
    else                Result := 'false';
end;


end.
