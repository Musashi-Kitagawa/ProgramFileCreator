//******************************************************************************
// 	共通ユニット
//  ログファイル関連
//
//  武蔵株式会社
//  Nov - 17 - '11
//******************************************************************************
unit LogUtilUnit;

interface
uses
	Windows, Classes, SysUtils, WinSock, Dialogs, IniFiles, Registry,
    ShlObj, StrUtils, Graphics, DateUtils;

//------------------------------------------------------------------------------
//  プロトコルタイプ宣言
//------------------------------------------------------------------------------
procedure   CreateLogFile( dir : string; days : integer; logType : integer=0 );
procedure 	SetOpeLog( msg : string; prm : Int64 ); overload;
procedure   SetOpeLog( msg : string; prm : integer ); overload;
procedure   SetOpeLog( msg : string; prm1, prm2 : integer ); overload;
procedure 	SetOpeLog( msg : string; prm1, prm2, prm3 : integer ); overload;
procedure   SetOpeLog( msg : string; prm : string; prm2 : string=''; prm3 : string='' ); overload;
procedure 	SetOpeLog( msg : string ); overload;
//procedure 	SetCmdLog( dir : integer; uni, port : integer; cmd : array of Byte; sz : integer );
procedure 	DeleteLogFile( days : integer );
function 	GetLogDir : string;
procedure 	SetLogSystemTC( tc : string );
procedure 	SetLogActiveXds( xno : integer );
procedure   SetLogStatus( po : integer; sts : DWORD );

implementation

uses
	CommonUnit, MainUnit;

const
//    CRLF    = #10#13;
    CRLF    = #13;

var
	FOpeLogFileLastDay		: integer;
    FOpeLogFileName			: string;
	FLogDir     			: string;
    FLogType				: integer;
    FSystemTC				: string = '';
	FOpeLogCount			: integer = 0;
    FActiveXds				: integer = -1;

    FLogStatus              : array [0..7] of DWORD;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure SetLogStatus( po : integer; sts : DWORD );
begin
    FLogStatus[po] := sts;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure SetLogActiveXds( xno : integer );
begin
	FActiveXds	:= xno;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure SetLogSystemTC( tc : string );
begin
	FSystemTC	:= tc;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function GetLogDir : string;
begin
	Result := FLogDir;
end;

//------------------------------------------------------------------------------
//  ログファイル作成
//------------------------------------------------------------------------------
procedure CreateLogFile( dir : string; days : integer; logType : integer );
var
	year, month, day, hh, mm, ss, ms	: Word;
	fileStream	: TFileStream;

begin
    FLogDir 	:= dir;
	FLogType	:= logType;

    // ログフォルダ作成
    CreateDir( FLogDir );

    //  古いログファイルの削除
    DeleteLogFile( days );

	//	日付を得る
    DecodeDate( Date, year, month, day );

    //	時刻を得る
    DecodeTime( Time, hh, mm, ss, ms );

//-- 操作ログ -----------------------------------------------------------------
    //	ログファイル名をセット
    FOpeLogFileName := Format( '%sOpe_%.4d%.2d%.2d_%.2d%.2d%.2d.txt',
    						[FLogDir, year, month, day, hh, mm, ss] );

	//	ログファイルを作成
    fileStream := TFileStream.Create( FOpeLogFileName, fmCreate or fmShareDenyNone );

    //	クローズ
    fileStream.Free;

//-- コマンドログ -------------------------------------------------------------
{
    //	ログファイル名をセット
    gCmdLogFileName := Format( '%sCmd_%.4d%.2d%.2d_%.2d%.2d%.2d.txt',
    						[gLogDir, year, month, day, hh, mm, ss ] );

	//	ログファイルを作成
    fileStream := TFileStream.Create( gCmdLogFileName, fmCreate or fmShareDenyNone );

    //	クローズ
    fileStream.Free;
}

    // 書き込み開始日
//	gCmdLogFileLastDay  := day;
	FOpeLogFileLastDay 	:= day;
end;

//------------------------------------------------------------------------------
//  オペレーションログファイル作成
//------------------------------------------------------------------------------
procedure SetOpeLog( msg : string; prm : Int64 );
begin
    SetOpeLog( msg + ' ' + Format( '%d', [prm] ) );
end;

//------------------------------------------------------------------------------
//  オペレーションログファイル作成
//------------------------------------------------------------------------------
procedure SetOpeLog( msg : string; prm : integer );
begin
    SetOpeLog( msg + ' ' + IntToStr( prm ) );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure SetOpeLog( msg : string; prm1, prm2 : integer );
begin
    SetOpeLog( msg + ' ' + IntToStr( prm1 ) + ' ' + IntToStr( prm2 ) );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure SetOpeLog( msg : string; prm : string; prm2 : string; prm3 : string );
begin
    SetOpeLog( msg + ' ' + prm + ' ' + prm2 + ' ' + prm3 );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure 	SetOpeLog( msg : string; prm1, prm2, prm3 : integer ); overload;
begin
    SetOpeLog( Format( '%s %d %d %d ', [msg, prm1, prm2, prm3] ) );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function StatusToStr : string;
var
    str : string;
//	xds : TNetRemoteForm;

begin
	if FLogType = 0 then begin
		// 簡易ログ

        str := '|';
    end
    else begin

        str := Format( '|%.8X %.8X %.8X %.8X |%.8X %.8X %.8X %.8X| ',
                          [FLogStatus[0],FLogStatus[1],FLogStatus[2],FLogStatus[3],
                           FLogStatus[4],FLogStatus[5],FLogStatus[6],FLogStatus[7]] );

{
//2020.6.26    	xds := MainForm.XDSForm[ FActiveXds ];
        xds := nil;

        if xds <> nil then

	    	// ログデータを書き込む
//    		str := AnsiString( Format( '|%d)%s-%.6X-%.6X| %d)%s-%.6X-%.6X[%.2X] %s| ',




    		str := Format( '<%.6X>|%d)%s(%d)%.6X %s| %d)%s(%d)%.6X %s| ',
   								[
                                xds.TXStatus,
								xds.CurrentRecDrive,
								TC2ZeroStr( xds.RecLtc ),
								xds.RecFTC,
                                xds.CurrentRecStatus,
                                AnsiString(xds.RecClip),

								xds.CurrentPvwDrive,
								TC2ZeroStr(xds.PvwLTC),
								xds.PvwFTC,
                                xds.CurrentPvwStatus,
                                AnsiString(xds.PvwClip) ] );
 }
    end;

    Result := str;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure SetOpeLog( msg : string );
var
	year, month, day, hh, mm, ss, ms	: Word;
	fileStream	: TFileStream;
	logMsg, sts : AnsiString;

begin
    //	時刻を得る                                                             {
    DecodeDateTime( Now, year, month, day, hh, mm, ss, ms );
//    stc := gSystemTC ) );

    // 日付がわったら出力ファイル切り替え
    if FOpeLogFileLastDay <> day then begin

    	Inc( FOpeLogCount );

	    FOpeLogFileName := Format( '%sOpe_%.4d%.2d%.2d_%.2d%.2d%.2d-%d.txt',
    							[FLogDir, year, month, day, hh, mm, ss, FOpeLogCount] );

        // ログファイルを作成
        fileStream := TFileStream.Create( FOpeLogFileName, fmCreate or fmShareDenyNone );
        fileStream.Free;

    	FOpeLogFileLastDay := day;
    end;

	//	ログファイルを開く
    fileStream := TFileStream.Create( FOpeLogFileName, fmOpenReadWrite or fmShareDenyNone );
    fileStream.Seek( 0, soFromEnd );

//    sts := AnsiString( Format( '[%d] ', [FActiveXds] ) + StatusToStr );
    sts := AnsiString( StatusToStr );

    //	ログデータを書き込む
    logMsg := AnsiString( Format( '%d/%.2d/%.2d %.2d:%.2d:%.2d.%.3d%s%s',
    		[year, month, day, hh, mm, ss, ms, sts, msg] ) + CRLF );
    fileStream.Write( logMsg[1], Length(logMsg) );

    //	クローズ
    fileStream.Free;
end;

//------------------------------------------------------------------------------
//  ログファイル　日付取得
//------------------------------------------------------------------------------
function GetLogFileDate( filename : string ) : TDateTime;
var
    year, month, day	: Word;

begin
	//	OPE_YYYYMMDD
    year 	:= StrToInt( Copy( filename, 5, 4 ) );
    month	:= StrToInt( Copy( filename, 9, 2 ) );
    day		:= StrToInt( Copy( filename, 11, 2 ) );

    Result := EncodeDate( year, month, day );
end;

//------------------------------------------------------------------------------
//  古いログファイルの削除
//------------------------------------------------------------------------------
procedure DeleteLogFile( days : integer );
var
	searchRec	: TSearchRec;
    attr	: Integer;
    NowDate, fileDate	: TDateTime;

begin
	//	今日の日付を得る
	NowDate	:= Date;

    //	ファイルを探す
    attr := faAnyFile;
    if FindFirst( FLogDir + '*.txt', attr, searchRec ) = 0 then begin
    	while true do begin
			//	ファイルの日付を得る
            fileDate := GetLogFileDate( searchRec.Name );

        	//	1週間より前なら削除
            if fileDate < (NowDate-days) then begin
	        	//	削除
    	        DeleteFile( FLogDir + searchRec.Name );
        	end;

            //	次を探す
            if 0 <> FindNext( searchRec ) then break;

        end;

        FindClose( searchRec );
    end;

end;


end.


