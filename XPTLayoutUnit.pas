//*****************************************************************************
//  ニューテレステクノ株式会社殿向け 「PROGRAM FILE CREATOR」
//  レイアウト画面
//
//  Dec - 25 - '20
//  武蔵株式会社
//*****************************************************************************
unit XPTLayoutUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, AnsiStrings,
  Vcl.StdCtrls, System.Types,
//
    ScreenDbUnit, MusFlatButton, CommonUnit, Vcl.Menus;

type
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
  TPortPanel	= class( TPanel )
  private
//	FTitle		: string;
	FPortID		: string;
	FSubTitle 	: string;
	FID         : integer;

    FMultiSelect    : Boolean;

//    FDataType   : integer;

    procedure   DispPortPanel;
    procedure   SetTitle( ttl : string );
    procedure   SetSubTitle( ttl : string );
    procedure   SetID( id : integer );
    procedure   SetMultiSelect( sel : Boolean );

  protected
  	procedure 	Paint; override;

  public

	property	PortID   : string       read FPortId    write SetTitle;
	property	SubTitle : string       read FSubTitle  write SetSubTitle;
	property	ID : integer            read FID        write SetID;
    property	MultiSelect : Boolean   read FMultiSelect    write SetMultiSelect;

  end;

type
  TXPTLayoutForm = class(TForm)
    CatePanel: TPanel;
    GrpPanel: TPanel;
    PanelTmp2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LayoutBasePanel: TPanel;
    LayoutPanel: TPanel;
    PanelTmp: TPanel;
    _MovePanel: TPanel;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N2x21: TMenuItem;
    N3x31: TMenuItem;
    N4x41: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PanelTmpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelTmpMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PanelTmpMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure _MovePanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
//    procedure LayoutPanelClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure LayoutPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N2x21Click(Sender: TObject);
    procedure N4Click(Sender: TObject);

  private
    { Private 宣言 }

    MovePanel           : TPortPanel;

    FMultiSelectFlag    : Boolean;
    FMultiSelect        : array of integer;
    FIrekae             : Boolean;

    FDragType           : integer;
    FDragStart          : Boolean;
    FDragPanel          : TPortPanel;
    FDragOffset         : TPoint;
    FDragOffset2        : TPoint;

    FCateButton     : array [0..9] of TPortPanel;
    FGroupButton    : array [0..9] of TPortPanel;
    FLayoutButton   : array [0..49] of TPortPanel;

    procedure   DataTypeChangeMessage( var Msg : TMessage );    message WM_DATATYPE_CHANGE_MESSAGE;

    procedure   MakeConponent;
    function    DropProc( mae : TPortpanel ) : Boolean;
    function    IrekaeProc( mae : TPortpanel; tPanel : TPortpanel ) : Boolean;
    procedure   DragOverProc( pnl : TPanel; x, y : integer );
    procedure   GroupComboBoxChangeProc;
    procedure   DispLayout;
    function    ButtonAlign : Boolean; overload;
    function    ButtonAlign( rc : integer ) : Boolean; overload;

    procedure   MultiSelectClear;
    function    DeleteArray( ar : array of integer; n : integer ) : integer;

  public
    { Public 宣言 }

    procedure   DispXPTLayout;

  end;

var
  XPTLayoutForm: TXPTLayoutForm;

//-----------------------------------------------------------------------------
//  プロトタイプ宣言
//-----------------------------------------------------------------------------
function CalcButtonSize(
    colCount, rowCount : string;
    pnl : TPanel;
    left : string;
    top : string;
    width : string;
    height : string;
    topoffset : integer=0 ) : TRect;


implementation

{$R *.dfm}

uses
    MainUnit, UiDstButtonUnit, GroupUnit, UiSrcButtonUnit, LogUtilUnit,
    UiFrameUnit, ScreenButtonUnit, UiPanelDstButtonUnit, UiPanelSrcButtonUnit;

//-----------------------------------------------------------------------------
//  ウィンドウ作成
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.FormCreate(Sender: TObject);
begin

    // コンポーネント制作
    MakeConponent;

    FDragStart              := False;

    LayoutBasePanel.Color   := TOP_COLOR;
    CatePanel.Color         := ODD_COLOR;
    GrpPanel.Color          := ODD_COLOR;
    LayoutPanel.Color       := ODD_COLOR;

end;

//-----------------------------------------------------------------------------
//  コンポーネント制作
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.MakeConponent;
var
    i : integer;
    pnl : TPortPanel;

begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.MakeConponent' );

    _MovePanel.Visible          := False;

    // 移動用パネル
    MovePanel                   := TPortPanel.Create( LayoutPanel );
    MovePanel.Parent            := LayoutPanel;
    MovePanel.BevelKind         := _MovePanel.BevelKind;
    MovePanel.Bevelouter        := _MovePanel.Bevelouter;
    MovePanel.Color             := _MovePanel.Color;
    MovePanel.ParentBackGround  := _MovePanel.ParentBackGround;
    MovePanel.Width             := _MovePanel.Width;
    MovePanel.Height            := _MovePanel.Height;
    MovePanel.Top               := _MovePanel.Top;
    MovePanel.Left              := _MovePanel.Left;
    MovePanel.Visible           := False;
    MovePanel.DoubleBuffered    := True;
    MovePanel.OnMouseUp         := _MovePanel.OnMouseUp;

    // カテゴリボタン
    for i:=0 to HIGH( FCateButton ) do begin
        pnl         := TPortPanel.Create( CatePanel );
        pnl.Parent  := CatePanel;
        pnl.Width   := PanelTmp2.Width;
        pnl.Height  := PanelTmp2.Height;
        pnl.Top     := PanelTmp2.Top;
        pnl.Left    := 10 + (PanelTmp2.Width + 2) * i;

        pnl.BevelKind   := PanelTmp2.BevelKind;
        pnl.BevelOuter  := PanelTmp2.BevelOuter;
        pnl.ParentBackGround    := False;
        pnl.Caption     := '';
        pnl.Color       := PanelTmp2.Color;
        pnl.Tag         := i;

        FCateButton[i]  := pnl;
    end;

    // グループボタン
    for i:=0 to HIGH( FGroupButton ) do begin
        pnl         := TPortPanel.Create( GrpPanel );
        pnl.Parent  := GrpPanel;
        pnl.Width   := PanelTmp2.Width;
        pnl.Height  := PanelTmp2.Height;
        pnl.Top     := PanelTmp2.Top;
        pnl.Left    := 10 + (PanelTmp2.Width + 2) * i;

        pnl.BevelKind   := PanelTmp2.BevelKind;
        pnl.BevelOuter  := PanelTmp2.BevelOuter;
        pnl.ParentBackGround    := False;
        pnl.Caption     := '';
        pnl.Color       := PanelTmp2.Color;
        pnl.Tag         := i;

//        pnl.OnMouseDown := GroupButtonMouseDown;

        FGroupButton[i]  := pnl;
    end;

    // DEST/SOURCE ボタン
    for i:=0 to HIGH( FLayoutButton ) do begin
        pnl         := TPortPanel.Create( LayoutPanel );
        pnl.Parent  := LayoutPanel;
        pnl.Width   := PanelTmp.Width;
        pnl.Height  := PanelTmp.Height;
        pnl.Top     := 0 + (PanelTmp.Height + 2) * (i div 10);
        pnl.Left    := 0 + (PanelTmp.Width + 2) * (i mod 10);

        pnl.BevelKind   := PanelTmp.BevelKind;
        pnl.BevelOuter  := PanelTmp.BevelOuter;
        pnl.ParentBackGround    := False;
        pnl.Caption     := '';
        pnl.Color       := PanelTmp.Color;
        pnl.DoubleBuffered  := True;
        pnl.Tag     := i;

        pnl.OnMouseDown := PanelTmpMouseDown;
        pnl.OnMouseMove := PanelTmpMouseMove;
        pnl.OnMouseUp   := PanelTmpMouseUp;

//        pnl.OnDragOver  := PanelTmpDragOver;
//        pnl.OnDragDrop  := PanelTmpDragDrop;
//        pnl.OnStartDrag := PanelTmpStartDrag;

        FLayoutButton[i]  := pnl;
    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.N1Click(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.N1Click', '整列' );

    // 整列
    if True = ButtonAlign then begin

        // 変更したときUNDO作成
        MainForm.MakeUndo;

        // 再表示
        DispLayout;
    end;
end;

//-----------------------------------------------------------------------------
//  整列（n x n)
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.N2x21Click(Sender: TObject);
var
    rc : integer;

begin
    if False = FMultiSelectFlag then Exit;

    case TMenuItem( Sender ).Tag of
    0:  rc := 2;        // 2 X 2
    1:  rc := 3;        // 3 X 3
    2:  rc := 4;        // 4 X 4
    else Exit;
    end;

    if True = ButtonAlign( rc ) then begin

        // 変更したときUNDO作成
        MainForm.MakeUndo;

        // 再表示
        DispLayout;

        // 複数選択クリア
        MultiSelectClear;

    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function CompareRect( l1, t1, w1, h1, l2, t2, w2, h2 : string ) : Boolean;
begin
    Result := False;
    if l1 <> l2 then Exit;
    if t1 <> t2 then Exit;
    if w1 <> w2 then Exit;
    if h1 <> h2 then Exit;

    Result := True;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TXPTLayoutForm.ButtonAlign( rc : integer ) : Boolean;
var
    lay : TLayoutData;
    inx, len, col, i : integer;
    dst : TUiDstButton;
    btn : TLayoutButton;
    src : TUiSrcButton;
//    t, l, w, h : integer;
    pdst : TUiPanelDstButton;
    psrc : TUiPanelSrcButton;
    ls, ts, ws, hs, ww, hh : Extended;
    l, t, w, h : string;

begin
    Result := False;

    lay := MainForm.GroupLayout;
    if lay = nil then Exit;

    ww  := (MainForm.ConfigData.XptXSpace / 100);
    hh  := (MainForm.ConfigData.XptYSpace / 100);
    ls  := 0;
    ts  := 0;
    ws  := 0;
    hs  := 0;

    // サイズを合わせる
    len := Length( FMultiSelect );
    for i:=0 to len-1 do begin

        btn := TLayoutButton( lay.List.Data[ FMultiSelect[i] ] );
        if nil = btn then break;

        case MainForm.DestSourceType of
        0:  // XPT + DESTINATION
            begin
                dst     := TUiDstButton( btn.Button );

                if i = 0 then begin
                    // 基準
                    ls  := StrToFloat( dst.F_Left );
                    ts  := StrToFloat( dst.F_Top );
                    ws  := StrToFloat( dst.F_Width );
                    hs  := StrToFloat( dst.F_Height );
                end
                else begin
                    l   := FloatToStr( ls + ((ws + ww) * (i mod rc)) );
                    t   := FloatToStr( ts + ((hs + hh) * (i div rc)) );
                    w   := FloatToStr( ws );
                    h   := FloatToStr( hs );

                    if True = CompareRect( dst.F_Left, dst.F_Top, dst.F_Width, dst.F_Height, l, t, w, h ) then continue;

                    Result          := True;

                    dst.F_Left      := l;
                    dst.F_Top       := t;
                    dst.F_Width     := w;
                    dst.F_Height    := h;
                end;
            end;

        1:  // XPT + SOURCE
            begin
                src             := TUiSrcButton( btn.Button );

                if i = 0 then begin
                    // 基準
                    ls  := StrToFloat( src.F_Left );
                    ts  := StrToFloat( src.F_Top );
                    ws  := StrToFloat( src.F_Width );
                    hs  := StrToFloat( src.F_Height );
                end
                else begin
                    l   := FloatToStr( ls + ((ws + ww) * (i mod rc)) );
                    t   := FloatToStr( ts + ((hs + hh) * (i div rc)) );
                    w   := FloatToStr( ws );
                    h   := FloatToStr( hs );

                    if True = CompareRect( src.F_Left, src.F_Top, src.F_Width, src.F_Height, l, t, w, h ) then continue;

                    Result          := True;

                    src.F_Left      := l;
                    src.F_Top       := t;
                    src.F_Width     := w;
                    src.F_Height    := h;
                end;
            end;

        2:  // PANEL + DESTINATION
            begin
                pdst            := TUiPanelDstButton( btn.Button );

                if i = 0 then begin
                    // 基準
                    ls  := StrToFloat( pdst.F_Left );
                    ts  := StrToFloat( pdst.F_Top );
                    ws  := StrToFloat( pdst.F_Width );
                    hs  := StrToFloat( pdst.F_Height );
                end
                else begin
                    l   := FloatToStr( ls + ((ws + ww) * (i mod rc)) );
                    t   := FloatToStr( ts + ((hs + hh) * (i div rc)) );
                    w   := FloatToStr( ws );
                    h   := FloatToStr( hs );

                    if True = CompareRect( pdst.F_Left, pdst.F_Top, pdst.F_Width, pdst.F_Height, l, t, w, h ) then continue;

                    Result          := True;

                    pdst.F_Left      := l;
                    pdst.F_Top       := t;
                    pdst.F_Width     := w;
                    pdst.F_Height    := h;
                end;
            end;

        3:  // PANEL + SOURCE
            begin
                psrc := TUiPanelSrcButton( btn.Button );

                if i = 0 then begin
                    // 基準
                    ls  := StrToFloat( psrc.F_Left );
                    ts  := StrToFloat( psrc.F_Top );
                    ws  := StrToFloat( psrc.F_Width );
                    hs  := StrToFloat( psrc.F_Height );
                end
                else begin
                    l   := FloatToStr( ls + ((ws + ww) * (i mod rc)) );
                    t   := FloatToStr( ts + ((hs + hh) * (i div rc)) );
                    w   := FloatToStr( ws );
                    h   := FloatToStr( hs );

                    if True = CompareRect( psrc.F_Left, psrc.F_Top, psrc.F_Width, psrc.F_Height, l, t, w, h ) then continue;

                    Result          := True;

                    psrc.F_Left      := l;
                    psrc.F_Top       := t;
                    psrc.F_Width     := w;
                    psrc.F_Height    := h;
                end;
            end;

        end;

    end;

end;

//-----------------------------------------------------------------------------
//  整列
//-----------------------------------------------------------------------------
function TXPTLayoutForm.ButtonAlign : Boolean;
var
    lay : TLayoutData;
    col, i : integer;
    dst : TUiDstButton;
    btn : TLayoutButton;
    src : TUiSrcButton;
    t, l, w, h : integer;
    pdst : TUiPanelDstButton;
    psrc : TUiPanelSrcButton;
    ls, ts, ws, hs : string;

begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.ButtonAlign' );

    Result := False;

    lay := MainForm.GroupLayout;
    if lay = nil then Exit;

    t := StrToIntDef( lay.Frame.F_Top, 0 );
    l := StrToIntDef( lay.Frame.F_Left, 0 );
    w := StrToIntDef( lay.Frame.F_Width, -1 );
    h := StrToIntDef( lay.Frame.F_Height, -1 );
    col := StrToIntDef( lay.Frame.F_ColCount, 10 );
//    row := StrToIntDef( lay.Frame.F_RowCount, 5 );

    LayoutPanel.Left            := (l * LayoutBasePanel.Width) div 100;
    LayoutPanel.Top             := (t * LayoutBasePanel.Height) div 100;
    LayoutPanel.Width           := (w * LayoutBasePanel.Width) div 100;
    LayoutPanel.Height          := (h * LayoutBasePanel.Height) div 100;

//    ws  := '.1';
//    hs  := '.1';
    ws  := Format( '.%.2f', [1.0 - (MainForm.ConfigData.XptXSpace / 100)] );
    hs  := Format( '.%.2f', [1.0 - (MainForm.ConfigData.XptYSpace / 100)] );

    for i:=0 to HIGH( FLayoutButton ) do begin

        btn := TLayoutButton( lay.List.Data[i] );
        if nil = btn then break;

        ls := Format( '.%d', [i mod col] );
        ts := Format( '.%d', [i div col] );

        case MainForm.DestSourceType of
        0:  // XPT + DESTINATION
            begin
                dst             := TUiDstButton( btn.Button );
                if True = CompareRect( dst.F_Left, dst.F_Top, dst.F_Width, dst.F_Height, ls, ts, ws, hs ) then continue;

                Result          := True;
                dst.F_Left      := ls;
                dst.F_Top       := ts;
                dst.F_Width     := ws;
                dst.F_Height    := hs;
            end;

        1:  // XPT + SOURCE
            begin
                src             := TUiSrcButton( btn.Button );
                if True = CompareRect( src.F_Left, src.F_Top, src.F_Width, src.F_Height, ls, ts, ws, hs ) then continue;

                Result          := True;
                src.F_Left      := ls;
                src.F_Top       := ts;
                src.F_Width     := ws;
                src.F_Height    := hs;
            end;

        2:  // PANEL + DESTINATION
            begin
                pdst            := TUiPanelDstButton( btn.Button );
                if True = CompareRect( pdst.F_Left, pdst.F_Top, pdst.F_Width, pdst.F_Height, ls, ts, ws, hs ) then continue;

                Result          := True;
                pdst.F_Left     := ls;
                pdst.F_Top      := ts;
                pdst.F_Width    := ws;
                pdst.F_Height   := hs;
            end;

        3:  // PANEL + SOURCE
            begin
                psrc := TUiPanelSrcButton( btn.Button );
                if True = CompareRect( psrc.F_Left, psrc.F_Top, psrc.F_Width, psrc.F_Height, ls, ts, ws, hs ) then continue;

                Result          := True;
                psrc.F_Left     := ls;
                psrc.F_Top      := ts;
                psrc.F_Width    := ws;
                psrc.F_Height   := hs;
            end;

        end;

    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.DataTypeChangeMessage( var Msg : TMessage );
begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.DataTypeChangeMessage', Msg.LParam );

    case Msg.LParam of
    0:  DispLayout;                 // データタイプ
    1:  DispLayout;                 // カテゴリ変更
    2:  GroupComboBoxChangeProc;    // グループ変更
    3:  DispXPTLayout;              // DEST/SOURCE変更
    end;
end;

//-----------------------------------------------------------------------------
//  グループ選択用コンボボックス
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.GroupComboBoxChangeProc;
var
    lay : TLayoutData;
    btn : TUiScreenSelectButton;
    i : integer;

begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.GroupComboBoxChangeProc' );

    // 再表示
    DispLayout;

    // グループボタン書き換え
    lay := MainForm.Group;

    for i:=0 to lay.List.Count-1 do begin

        btn := TUiScreenSelectButton( lay.List.Data[i].Button );

        FGroupButton[i].PortID      := btn.F_Text;
        FGroupButton[i].ID          := btn.F_Id;
        FGroupButton[i].SubTitle    := btn.F_FrameName;
    end;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function _XSize( x : string; w : integer ) : integer;
var
    str : string;
    e, e2 : Extended;

begin
    if '' = x then begin
        Result := 60;   //pa.Width;
        Exit;
    end;

    if AnsiRightStr( AnsiString(x), 2 ) = 'px' then begin

        str := Copy( x, 1, Length(x)-2 );
        Result := StrToIntDef( str, 0 );

    end
    else begin
        e   := StrToFloatDef( x, 1 );
        e2  := w;
        Result := Round( e * Extended(e2) / 100 + 0.5 );
    end;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function XSize( x : string; pa : TPanel ) : integer;
begin
    Result := _XSize( x, pa.Width );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function YSize( y : string; h : integer ) : integer;
var
    str : string;
    e, e2 : Extended;

begin
    if '' = y then begin
        Result := h;    //pa.Height;
        Exit;
    end;

    if AnsiRightStr( AnsiString(y), 2 ) = 'px' then begin

        str := Copy( y, 1, Length(y)-2 );
        Result := StrToIntDef( str, 0 );

    end
    else begin
        e   := StrToFloatDef( y, 0 );
        e2  := h;   //pa.Height;
        Result := Round( e * e2 / 100 + 0.5 );
    end;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function XPos( x : string; pa : TPanel ) : integer;
var
    str : string;
    e, e2 : Extended;
    rf : Boolean;

begin

    if AnsiRightStr( AnsiString(x), 2 ) = 'px' then begin

        rf := False;
        if '-' = x[1] then begin
            rf := True;
            x := Copy( x, 2, 10 );
        end;

        str := Copy( x, 1, Length(x)-2 );
        Result := StrToIntDef( str, 0 );

        // 右寄せ
        if True = rf then begin
            Result := pa.Width - Result;
        end;

    end
    else begin

//    s := StrToIntDef( x, 0 );
        e   := StrToFloatDef( x, 0 );
        e2  := pa.Width;

        Result := Round( e * e2 / 100 + 0.5 );
    end;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function YPos( y : string; h : integer ) : integer;
var
    str : string;
    e, e2 : Extended;

begin
    if AnsiRightStr( AnsiString(y), 2 ) = 'px' then begin

        str := Copy( y, 1, Length(y)-2 );
        Result := StrToIntDef( str, 0 );

    end
    else begin

        e   := StrToFloatDef( y, 0 );
        e2  := h;           //pa.Height;
        Result := Round( e * e2 / 100 + 0.5 );
    end;
end;

//-----------------------------------------------------------------------------
//  ボタンの大きさを正規化
//-----------------------------------------------------------------------------
function CalcButtonSize(
    colCount, rowCount : string;
    pnl : TPanel;
    left : string;
    top : string;
    width : string;
    height : string;
    topoffset : integer=0 ) : TRect;

var
    e, e2 : Extended;
    h, w, x, y, hh, ww : integer;

begin
    e       := StrToFloatDef( colCount, 1 );
    e2      := pnl.Width;
    w       := Round( e2 / e + 0.5 ) ;

    e       := StrToFloatDef( rowCount, 1 );
//    e2  := pnl.Height;
    e2      := pnl.Height - topoffset;
    h       := Round( e2 / e + 0.5 );

    if '' = width then begin

        ww  := 60;       // 暫定
    end
    else if '.' = width[1] then begin
        e   := StrToFloatDef( Copy( width, 2, 4 ), 1 );
        ww  := Round( e * w + 0.5 );
    end
    else begin
        ww  := XSize( width, pnl );
    end;

    if '' = height then begin

        hh  := 60;       // 暫定
    end
    else if '.' = height[1] then begin
        e   := StrToFloatDef( Copy( height,  2, 4 ), 1 );
        hh  := Round( e * h  + 0.5 );
    end
    else begin
        hh  := YSize( height, (pnl.Height - topoffset) );  //pnl );
    end;

    if '.' = left[1] then begin
        e   := StrToFloatDef( Copy( left, 2, 4 ), 1 );
        e2  := w;
        x   := Round( e * e2 + 0.5 );
    end
    else begin
        x   := XPos( left, pnl );
    end;

    if '.' = top[1] then begin
        e   := StrToFloatDef( Copy( top,  2, 4 ), 1 );
        e2  := h;
        y   := Round( e * e2 + 0.5 ) ;
    end
    else begin
        y   := YPos( top, (pnl.Height - topoffset) ); //pnl );
    end;

    Result  := RECT( x, y+topoffset, ww, hh );
end;

//-----------------------------------------------------------------------------
//  マウス移動処理
//  マウス位置からカーソルの形状変更
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.PanelTmpMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
    pnl : TPortPanel;
    rct : TRect;
    r : array [0..7] of TRect;
    sel, i : integer;

begin

    pnl := TPortPanel( Sender );

    if FDragStart = False then begin

//-- ドラッグしていないとき ---------------------------------------------------

        rct := RECT( pnl.Left, pnl.Top, pnl.Left+pnl.Width, pnl.Top+pnl.Height );

        r[0] := Bounds( 0,              0,          10,                     10 );
        r[1] := Bounds( 10,             0,          rct.Width - 10*2,       10 );
        r[2] := Bounds( rct.Width - 10, 0,          10,                     10 );
        r[3] := Bounds( 0,              10,         10,                     rct.Height - 10*2 );
        r[4] := Bounds( rct.Width - 10, 10,         10,                     rct.Height - 10*2 );
        r[5] := Bounds( 0,              rct.Height-10,  10,                 10 );
        r[6] := Bounds( 10,             rct.Height-10,  rct.Width - 10*2,   10 );
        r[7] := Bounds( rct.Width - 10, rct.Height-10,  10,                 10 );

        sel := -1;
        for i:=0 to HIGH( r ) do begin

            if PtInRect( r[i], Point( x, y ) ) then begin

                // カーソル変更
                case i of
                0, 7:   Screen.Cursor   := crSizeNWSE;
                1, 6:   Screen.Cursor   := crSizeNS;
                2, 5:   Screen.Cursor   := crSizeNESW;
                3, 4:   Screen.Cursor   := crSizeWE;
                end;

                sel := i;

                break;
            end
            else begin

                // カーソル戻し
                Screen.Cursor   := crDefault;
            end;
        end;

        FDragType   := sel;

    end
    else begin

//-- ドラッグ中 ---------------------------------------------------------------

        DragOverProc( pnl, x, y );

    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    Screen.Cursor   := crDefault;
end;

//-----------------------------------------------------------------------------
//  マウスアップ（移動終了）
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm._MovePanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

    // 移動用パネル非表示
    MovePanel.Visible   := False;

    FDragType           := 1000{無効};

    // カーソル戻し
    Screen.Cursor       := crDefault;
end;


//-----------------------------------------------------------------------------
//  マウスアップ
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.PanelTmpMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    ret : Boolean;
    po, po2 : TPoint;
    i : integer;
    rct : TRect;

begin

    // 選択がないとき
    if (True = FMultiSelectFlag)
        or (nil = FDragPanel) then begin

        Exit;
    end;

    ret := False;

    // ドロップ
    if True = FIrekae then begin
        // 場所を入れ替える

        // 離した位置を検索
        po := TPortPanel( Sender ).ClientToScreen( POINT( x, y ) );

        for i:=0 to HIGH( FLayoutButton ) do begin

            po2 := LayoutPanel.ClientToScreen( POINT( FLayoutButton[i].Left, FLayoutButton[i].Top ) );
            rct := RECT( po2.X, po2.Y,
                            po2.X + FLayoutButton[i].Width,
                            po2.Y + FLayoutButton[i].Height );

            if True = PtInRect( rct, po ) then begin
                ret := IrekaeProc( FDragPanel, FLayoutButton[i] );
                break;
            end;

        end;

        FIrekae := False;
    end
    else begin
        // 移動する

        ret := DropProc( FDragPanel );
    end;

    // UNDO 作成
    if True = ret then begin
        MainForm.MakeUndo;
    end;

    MovePanel.Visible   := False;

    FDragStart          := False;

    Screen.Cursor       := crDefault;
end;

//-----------------------------------------------------------------------------
//  ボタン表示
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.DispXPTLayout;
begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.DispXPTLayout' );

    DispLayout;

    GroupComboBoxChangeProc
end;

//-----------------------------------------------------------------------------
//  ボタン表示
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.DispLayout;
var
    i, t, l, w, h : integer;
    lay : TLayoutData;
    rct : TRect;
    dst : TUiDstButton;
    btn : TLayoutButton;
    src : TUiSrcButton;
    pdst : TUiPanelDstButton;
    psrc : TUiPanelSrcButton;

begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.DispLayout' );

    lay := MainForm.GroupLayout;
    if lay = nil then Exit;

    t := StrToIntDef( lay.Frame.F_Top, 0 );
    l := StrToIntDef( lay.Frame.F_Left, 0 );
    w := StrToIntDef( lay.Frame.F_Width, -1 );
    h := StrToIntDef( lay.Frame.F_Height, -1 );

    LayoutPanel.Left            := (l * LayoutBasePanel.Width) div 100;
    LayoutPanel.Top             := (t * LayoutBasePanel.Height) div 100;
    LayoutPanel.Width           := (w * LayoutBasePanel.Width) div 100;
    LayoutPanel.Height          := (h * LayoutBasePanel.Height) div 100;

    for i:=0 to HIGH( FLayoutButton ) do begin

        btn := TLayoutButton( lay.List.Data[i] );

        if nil <> btn then begin

            case MainForm.DestSourceType of
            0:  // XPT + DESTINATION
                begin
                    dst := TUiDstButton( btn.Button );

                    rct := CalcButtonSize(
                            lay.Frame.F_ColCount,
                            lay.Frame.F_RowCount,
                            LayoutPanel,
                            dst.F_Left,
                            dst.F_Top,
                            dst.F_Width,
                            dst.F_Height,
                            StrToIntDef( lay.Frame.F_TitleBarHeightPix, 0 ) );

                    FLayoutButton[i].PortID     := dst.F_DstPortNo;
                    FLayoutButton[i].SubTitle   := dst.F_Order;
                    FLayoutButton[i].ID         := dst.F_Id;
                end;

            1:  // XPT + SOURCE
                begin
                    src := TUiSrcButton( btn.Button );

                    rct := CalcButtonSize(
                            lay.Frame.F_ColCount,
                            lay.Frame.F_RowCount,
                            LayoutPanel,
                            src.F_Left,
                            src.F_Top,
                            src.F_Width,
                            src.F_Height,
                            StrToIntDef( lay.Frame.F_TitleBarHeightPix, 0 ) );

                    FLayoutButton[i].PortID     := src.F_SrcPortNo;
                    FLayoutButton[i].SubTitle   := src.F_Order;
                    FLayoutButton[i].ID         := src.F_Id;

                end;

            2:  // PANEL + DESTINATION
                begin
                    pdst := TUiPanelDstButton( btn.Button );

                    rct := CalcButtonSize(
                            lay.Frame.F_ColCount,
                            lay.Frame.F_RowCount,
                            LayoutPanel,
                            pdst.F_Left,
                            pdst.F_Top,
                            pdst.F_Width,
                            pdst.F_Height,
                            StrToIntDef( lay.Frame.F_TitleBarHeightPix, 0 ) );

                    FLayoutButton[i].PortID     := pdst.F_DstPortNo;
                    FLayoutButton[i].SubTitle   := pdst.F_Order;
                    FLayoutButton[i].ID         := pdst.F_Id;
                end;

            3:  // PANEL + SOURCE
                begin
                    psrc := TUiPanelSrcButton( btn.Button );

                    rct := CalcButtonSize(
                            lay.Frame.F_ColCount,
                            lay.Frame.F_RowCount,
                            LayoutPanel,
                            psrc.F_Left,
                            psrc.F_Top,
                            psrc.F_Width,
                            psrc.F_Height,
                            StrToIntDef( lay.Frame.F_TitleBarHeightPix, 0 ) );

                    FLayoutButton[i].PortID     := psrc.F_SrcPortNo;
                    FLayoutButton[i].SubTitle   := psrc.F_Order;
                    FLayoutButton[i].ID         := psrc.F_Id;

                end;

            end;

            FLayoutButton[i].Left   := rct.Left;
            FLayoutButton[i].Top    := rct.Top;
            FLayoutButton[i].Width  := rct.Right;
            FLayoutButton[i].Height := rct.Bottom;

            FLayoutButton[i].Visible    := True;

        end
        else begin
            FLayoutButton[i].Visible    := False;
        end;

    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TXPTLayoutForm.IrekaeProc( mae : TPortpanel; tPanel : TPortpanel ) : Boolean;
var
    sb, sb2 : TlayoutButton;
    grp : TLayoutData;
    dst, dst2 : TUiDstButton;
    src, src2 : TUiSrcButton;
    pdst, pdst2 : TUiPanelDstButton;
    psrc, psrc2 : TUiPanelSrcButton;
//    e : Extended;
    btn, btn2, i : integer;
    l{, t, w, h} : string;
//    flg : Boolean;

begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.IrekaeProc' );

    Result := False;

    // ボタンを探す
    btn := -1;
    for i:=0 to HIGH( FLayoutButton ) do begin
        if FLayoutButton[i].ID = mae.ID then begin
            btn := i;
            break;
        end;
    end;

    // ボタンを探す
    btn2 := -1;
    for i:=0 to HIGH( FLayoutButton ) do begin
        if FLayoutButton[i].ID = tPanel.ID then begin
            btn2 := i;
            break;
        end;
    end;

    // ボタンなし
    if (-1 = btn) or (-1 = btn) then Exit;

    grp := MainForm.GroupLayout;
    sb  := grp.List.SearchId( FLayoutButton[ btn ].ID );
    if nil = sb then Exit;

    sb2 := grp.List.SearchId( FLayoutButton[ btn2 ].ID );
    if nil = sb2 then Exit;

    case MainForm.DestSourceType of
    0:  // XPT + DESTINATION
        begin
            dst     := TUiDstButton( sb.Button );
            dst2    := TUiDstButton( sb2.Button );

            // DESTINATION PORT 入れ替え
            l                   := dst.F_DstPortNo;
            dst.F_DstPortNo     := dst2.F_DstPortNo;
            dst2.F_DstPortNo    := l;

            FLayoutButton[ btn ].PortID     := dst.F_DstPortNo;
            FLayoutButton[ btn2 ].PortID    := dst2.F_DstPortNo;
        end;

    1:  // XPT + SOURCE
        begin
            src     := TUiSrcButton( sb.Button );
            src2    := TUiSrcButton( sb2.Button );

            // SOURCE PORT 入れ替え
            l                   := src.F_SrcPortNo;
            src.F_SrcPortNo     := src2.F_SrcPortNo;
            src2.F_SrcPortNo    := l;

            FLayoutButton[ btn ].PortID     := src.F_SrcPortNo;
            FLayoutButton[ btn2 ].PortID    := src2.F_SrcPortNo;
        end;

    2:  // PANEL + DESTINATION
        begin
            pdst    := TUiPanelDstButton( sb.Button );
            pdst2   := TUiPanelDstButton( sb2.Button );

            // DESTINATION PORT 入れ替え
            l                   := pdst.F_DstPortNo;
            pdst.F_DstPortNo    := pdst2.F_DstPortNo;
            pdst2.F_DstPortNo   := l;

            FLayoutButton[ btn ].PortID     := pdst.F_DstPortNo;
            FLayoutButton[ btn2 ].PortID    := pdst2.F_DstPortNo;
        end;

    3:  // PANEL + SOURCE
        begin
            psrc    := TUiPanelSrcButton( sb.Button );
            psrc2   := TUiPanelSrcButton( sb2.Button );

            // SOURCE PORT 入れ替え
            l                   := psrc.F_SrcPortNo;
            psrc.F_SrcPortNo    := psrc2.F_SrcPortNo;
            psrc2.F_SrcPortNo   := l;

            FLayoutButton[ btn ].PortID     := psrc.F_SrcPortNo;
            FLayoutButton[ btn2 ].PortID    := psrc2.F_SrcPortNo;
        end;
    end;

    FDragType   := 1000{無効};

    Result := True;
end;

//-----------------------------------------------------------------------------
//  ボタン移動終了処理
//  RESULT  True  : 変更あり
//          False : 変更なし
//-----------------------------------------------------------------------------
function TXPTLayoutForm.DropProc( mae : TPortpanel ) : Boolean;
var
    sb : TlayoutButton;
    grp : TLayoutData;
    dst : TUiDstButton;
    src : TUiSrcButton;
    pdst : TUiPanelDstButton;
    psrc : TUiPanelSrcButton;
    e : Extended;
    btn, i : integer;
    l, t, w, h : string;
    flg : Boolean;

begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.DropProc' );

    Result := False;

    // ボタンを探す
    btn := -1;
    for i:=0 to HIGH( FLayoutButton ) do begin
        if FLayoutButton[i].ID = mae.ID then begin
            btn := i;
            break;
        end;
    end;

    // ボタンなし
    if -1 = btn then Exit;

    grp := MainForm.GroupLayout;
    sb  := grp.List.SearchId( FLayoutButton[ btn ].ID );
    if nil = sb then Exit;

    flg := True;

    FLayoutButton[ btn ].Left   := MovePanel.Left;
    FLayoutButton[ btn ].Top    := MovePanel.Top;
    FLayoutButton[ btn ].Width  := MovePanel.Width;
    FLayoutButton[ btn ].Height := MovePanel.Height;

    // 正規化する
    e   := (MovePanel.Left * 100) / LayoutPanel.Width;
    l   := FloatToStr( e );
    e   := (MovePanel.Top * 100) / LayoutPanel.Height;
    t   := FloatToStr( e );
    e   := (MovePanel.Width * 100) / LayoutPanel.Width;
    w   := FloatToStr( e );
    e   := (MovePanel.Height * 100) / LayoutPanel.Height;
    h   := FloatToStr( e );

    case MainForm.DestSourceType of
    0:  // XPT + DESTINATION
        begin
            dst := TUiDstButton( sb.Button );
            flg := CompareRect( dst.F_Left, dst.F_Top, dst.F_Width, dst.F_Height, l, t, w, h );

            dst.F_Left      := l;
            dst.F_Top       := t;
            dst.F_Width     := w;
            dst.F_Height    := h;
        end;

    1:  // XPT + SOURCE
        begin
            src := TUiSrcButton( sb.Button );
            flg := CompareRect( src.F_Left, src.F_Top, src.F_Width, src.F_Height, l, t, w, h );

            src.F_Left      := l;
            src.F_Top       := t;
            src.F_Width     := w;
            src.F_Height    := h;
        end;

    2:  // PANEL + DESTINATION
        begin
            pdst := TUiPanelDstButton( sb.Button );
            flg := CompareRect( pdst.F_Left, pdst.F_Top, pdst.F_Width, pdst.F_Height, l, t, w, h );

            pdst.F_Left      := l;
            pdst.F_Top       := t;
            pdst.F_Width     := w;
            pdst.F_Height    := h;
        end;

    3:  // PANEL + SOURCE
        begin
            psrc := TUiPanelSrcButton( sb.Button );
            flg := CompareRect( psrc.F_Left, psrc.F_Top, psrc.F_Width, psrc.F_Height, l, t, w, h );

            psrc.F_Left      := l;
            psrc.F_Top       := t;
            psrc.F_Width     := w;
            psrc.F_Height    := h;
        end;
    end;

    FDragType   := 1000{無効};

    Result := (flg = False);
end;

//-----------------------------------------------------------------------------
//  ボタン移動中処理
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.DragOverProc( pnl : TPanel; x, y : integer );
var
    po : TPoint;
    sa : integer;

begin
//{log}SetOpeLog( 'OPE:TXPTLayoutForm.DragOverProc' );

    po := pnl{TPanel( Sender )}.ClientToScreen( Point( X, Y ) );
    po := LayoutPanel.ScreenToClient( po );

    case FDragType of
    -1: // 移動
        begin
            po.X := po.x - FDragOffset.X;
            po.Y := po.Y - FDragOffset.Y;

            MovePanel.Left := po.X; // - (MovePanel.Width div 2);    //TPortPanel( Source ).Left;
            MovePanel.Top  := po.Y; // - (MovePanel.Height div 2);    //TPortPanel( Source ).Top;
        end;

    0:  // 左上
        begin
            po.X := po.x - FDragOffset.X;
            po.Y := po.Y - FDragOffset.Y;

            if po.X > (MovePanel.Left + MovePanel.Width) then Exit;
            if po.Y > (MovePanel.Top + MovePanel.Height) then Exit;

            sa := MovePanel.Left - po.X;
            MovePanel.Left      := po.X;
            MovePanel.Width     := MovePanel.Width + sa;

            sa := MovePanel.Top - po.Y;
            MovePanel.Top       := po.Y;
            MovePanel.Height    := MovePanel.Height + sa;
        end;

    1:  // 中上
        begin
            po.Y := po.Y - FDragOffset.Y;

            if po.Y > (MovePanel.Top + MovePanel.Height) then Exit;

            sa := MovePanel.Top - po.Y;
            MovePanel.Top       := po.Y;
            MovePanel.Height    := MovePanel.Height + sa;
        end;

    2:  // 右上
        begin
            po.X := po.X + FDragOffset2.X;
            po.Y := po.Y - FDragOffset.Y;

            if po.X < MovePanel.Left then Exit;
            if po.Y > (MovePanel.Top + MovePanel.Height) then Exit;

            sa := po.X - (MovePanel.Left+MovePanel.Width);
            MovePanel.Width     := MovePanel.Width + sa;

            sa := MovePanel.Top - po.Y;
            MovePanel.Top       := po.Y;
            MovePanel.Height    := MovePanel.Height + sa;
        end;

    3:  // 中左
        begin
            po.X := po.x - FDragOffset.X;

            if (MovePanel.Left + MovePanel.Width) < po.X then Exit;

            sa := MovePanel.Left - po.X;
            MovePanel.Left      := po.X;
            MovePanel.Width     := MovePanel.Width + sa;
        end;

    4:  // 中右
        begin
            po.X := po.X + FDragOffset2.X;

            if po.X < MovePanel.Left then Exit;

            sa := po.X - (MovePanel.Left+MovePanel.Width);
            MovePanel.Width     := MovePanel.Width + sa;
        end;

    5:  // 左下
        begin
            po.X := po.x - FDragOffset.X;
            po.Y := po.Y + FDragOffset2.Y;

            if po.X > (MovePanel.Left + MovePanel.Width) then Exit;
            if po.Y < MovePanel.Top then Exit;

            sa := MovePanel.Left - po.X;
            MovePanel.Left      := po.X;
            MovePanel.Width     := MovePanel.Width + sa;

            sa := po.Y - (MovePanel.Top + MovePanel.Height);
//            MovePanel.Top       := po.Y;
            MovePanel.Height    := MovePanel.Height + sa;
        end;

    6:  // 中下
        begin
            po.Y := po.Y + FDragOffset2.Y;

            if po.Y < MovePanel.Top then Exit;

            sa := po.Y - (MovePanel.Top + MovePanel.Height);
            MovePanel.Height    := MovePanel.Height + sa;
        end;

    7:  // 右下
        begin
            po.X := po.X + FDragOffset2.X;
            po.Y := po.Y + FDragOffset2.Y;

            if po.X < MovePanel.Left then Exit;
            if po.Y < MovePanel.Top then Exit;

            sa := po.X - (MovePanel.Left+MovePanel.Width);
            MovePanel.Width     := MovePanel.Width + sa;

            sa := po.Y - (MovePanel.Top + MovePanel.Height);
            MovePanel.Height    := MovePanel.Height + sa;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TXPTLayoutForm.DeleteArray( ar : array of integer; n : integer ) : integer;
var
    i, len : integer;

begin
    Result := -1;

    len := Length( ar );
    for i:=0 to len-1 do begin
        if n = FMultiSelect[i] then begin
            Delete( FMultiSelect, i, 1 );
            Result := i;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//  ボタン上でマウスダウン
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.PanelTmpMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

var
    pnl : TPortPanel;
//    bl : TLayoutButtonList;
//    d : TLayoutButton;
    len : integer;
    po : TPoint;

begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.PanelTmpMouseDown' );

    pnl := TPortPanel( Sender );

    if mbRight = Button then begin

        po := pnl.ClientToScreen( Point( x, y ) );
        PopupMenu.Popup( po.X, po.Y );

        PopupMenu.Tag   := pnl.Tag;


{
        // 設定用ウィンドウ表示
        bl  := MainForm.GroupLayoutList;
        d   := bl.SearchId( pnl.ID );

        case d.Button.FDataType of
        UiDstButton_No:         UiDstButtonForm.Start(      TUiDstButton(       d.Button ) );
        UiSrcButton_No:         UiSrcButtonForm.Start(      TUiSrcButton(       d.Button ) );
        UiPanelDstButton_No:    UiPanelDstButtonForm.Start( TUiPanelDstButton(  d.Button ) );
        UiPanelSrcButton_No:    UiPanelSrcButtonForm.Start( TUiPanelSrcButton(  d.Button ) );
        else Exit;
        end;

        pnl.ID  := d.Button.F_Id;
}
    end
    else begin

        // + SHIFT (複数選択)
        if ssShift in Shift then begin

            if True = FMultiSelectFlag then begin

                if True = pnl.MultiSelect then begin
                    // 選択状態の時は選択解除

                    DeleteArray( FMultiSelect, pnl.Tag ); //( FMultiSelect, Pos( FMultiSelect, pnl.Tag, 0 ), 1 );

                    pnl.MultiSelect := False;

                    // 選択がなくなったとき
                    if 0 = Length( FMultiSelect ) then
                        MultiSelectClear;

                    Exit;
                end
                else begin
                    // 未選択の時は選択にする
                    len := Length( FMultiSelect );
                    if len >= 16 then Exit;

                end;

            end
            else begin
                FMultiSelectFlag        := True;
                len := 0;
            end;

            SetLength( FMultiSelect, (len + 1) );
            FMultiSelect[ len ] := pnl.Tag;

            pnl.MultiSelect := True;
        end
        else begin

            // + CTRL (入れ替え)
            FIrekae             := (ssCtrl in Shift);

            MultiSelectClear;

            // 移動、サイズ変更開始
            MovePanel.Left      := pnl.Left;
            MovePanel.Top       := pnl.Top;
            MovePanel.Width     := pnl.Width;
            MovePanel.Height    := pnl.Height;
            MovePanel.BringToFront;
            MovePanel.PortID    := pnl.PortID;
            MovePanel.SubTitle  := pnl.SubTitle;
            MovePanel.ID        := pnl.ID;
            MovePanel.Color     := MainForm.ConfigData.MoveColor;

            MovePanel.Visible   := True;

            FDragStart          := True;
            FDragPanel          := pnl;
            FDragOffset         := Point( x+2, y+2 );
            FDragOffset2        := Point( (pnl.Width - x-2), (pnl.Height - y-2) );
        end;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.N4Click(Sender: TObject);
var
    pnl : TPortPanel;
    bl : TLayoutButtonList;
    d : TLayoutButton;

begin
    pnl := FLayoutButton[ PopupMenu.Tag ];

    // 設定用ウィンドウ表示
    bl  := MainForm.GroupLayoutList;
    d   := bl.SearchId( pnl.ID );

    case d.Button.FDataType of
    UiDstButton_No:         UiDstButtonForm.Start(      TUiDstButton(       d.Button ) );
    UiSrcButton_No:         UiSrcButtonForm.Start(      TUiSrcButton(       d.Button ) );
    UiPanelDstButton_No:    UiPanelDstButtonForm.Start( TUiPanelDstButton(  d.Button ) );
    UiPanelSrcButton_No:    UiPanelSrcButtonForm.Start( TUiPanelSrcButton(  d.Button ) );
    else Exit;
    end;

    pnl.ID  := d.Button.F_Id;

    // 変更したときUNDO作成
    MainForm.MakeUndo;

    // 再表示
    DispLayout;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.MultiSelectClear;
var
    i : integer;

begin

    FMultiSelectFlag        := False;
    SetLength( FMultiSelect, 0 );

    for i:=0 to HIGH( FLayoutButton ) do begin
        FLayoutButton[i].MultiSelect := False;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TXPTLayoutForm.LayoutPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    lay : TLayoutData;
    po : TPoint;

begin

    if mbLeft = Button then begin
        // UiFrame 詳細設定

        lay := MainForm.GroupLayout;
        UiFrameForm.Start( lay.Frame );
    end
    else begin
        // 整列用ポップアップメニュ

        po := TPanel( Sender ).ClientToScreen( Point( X, Y ) );
        PopupMenu.Popup( po.X, po.Y );
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	カスタムパネル関連
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPortPanel.SetTitle( ttl : string );
begin
	FPortID := ttl;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPortPanel.SetSubTitle( ttl : string );
begin
	FSubTitle  := ttl;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPortPanel.SetID( id : integer );
begin
	FID := id;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPortPanel.SetMultiSelect( sel : Boolean );
begin
	if FMultiSelect = sel then Exit;

	FMultiSelect := sel;

    if sel = True then  Color := clSkyBlue
    else                Color := clBtnFace;

    Invalidate;
end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPortPanel.Paint;
begin
    DispPortPanel;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPortPanel.DispPortPanel;
var
    h : integer;
    str : string;

begin
    if Caption <> '' then
		Caption  := '';

    // 下地
{
    // グラデーション使用
    if True = MainForm.ConfigData.GradColor then begin
		col := PerColor( Color, 50 );
    	GradientFillCanvas( Canvas,
				col,
        		Color,
            	RECT(0, 0, Width, Height), gdVertical );
    end;
}

	if FMultiSelect = True then begin
        Color   := clSkyBlue;
    end
    else begin
    end;

    Canvas.Brush.Color	:= Color;
	Canvas.FrameRect( Rect( 0, 0, Width, Height ) );

    // ALIAS
    Canvas.Font.Name    := 'Arial Rounded MT Bold';
    Canvas.Font.Size	:= 12;
    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    h := Height * 50 div 100;
    CenterTextRect( Canvas, Rect( 0, 0, Width, Height-h ), FPortID, False );

    // ID名称
//    Canvas.Font.Name    := 'メイリオ';
    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [{fsBold}];
//    Canvas.Font.Style	:= [];
//    Canvas.Font.Color	:= clBlack;

//    CenterTextRect( Canvas, Rect( 0, h, Width, Height ), FSubTitle );
    str := Format( 'id=%d tag=%d', [FID, Tag] );
    CenterTextRect( Canvas, Rect( 0, h, Width, Height ), str{IntToStr(FID)}, False );


{
    // 素材名称
    LeftTextRect( Canvas, Rect( 160, 0, 160+100, Height ), FMaterial );
}


    // 表示順
//    Canvas.Font.Name    := 'メイリオ';
//    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
//    Canvas.Font.Style	:= [];
//    Canvas.Font.Color	:= clBlack;

//    CenterTextRect( Canvas, Rect( 250, 0, 250+80, Height ), IntToStr( FIndex ), True );

end;


end.


