unit PanelLayoutUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Contnrs, System.Types,
//
    ScreenDbUnit, XPTLayoutUnit, Vcl.Menus, MusFlatButton;

type
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
  TPanelType = class(TPanel)

  private

    FName       : string;
    FTypeName   : string;
    FPanelID    : string;
    FStationID  : string;
    FIP         : string;

    FSbPanel    : TSbPanelType;

    FSelect     : Boolean;

    procedure   DiapCategory;
    procedure   SetSelect( sw : Boolean );

  protected
  	procedure 	Paint; override;

  public

    // コンストラクタ
//        constructor Create; virtual;
    constructor Create(AOwner: TComponent); override;

    // デストラクタ
    destructor 	Destroy; override;

    property Select : Boolean   read FSelect    write SetSelect;

  end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
  TPanelTypeList = class(TObjectList)
    private

        function    GetData( index : integer ) : TPanelType;

        function    GetSelect : integer;
        procedure   SetSelect( index : integer );

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

		procedure   ClearAll;

        property    Data[index:integer] : TPanelType	read GetData;

        property    Select : integer    read GetSelect    write SetSelect;

  end;

type
  TPanelLayoutForm = class(TForm)
    LayoutBasePanel: TPanel;
    LayoutPanel: TPanel;
    PanelTmp: TPanel;
    _MovePanel: TPanel;
    GScrollBox: TScrollBox;
    TerPanel: TPanel;
    NoPanel: TPanel;
    NamePanel: TPanel;
    TypePanel: TPanel;
    IDPanel: TPanel;
    KeyPanel: TPanel;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    SbDeviceButton: TMusFlatButton;
    SbDeviceTypeButton: TMusFlatButton;
    SbPanelTypeButton: TMusFlatButton;
    IPPanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure GScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure TerPanelClick(Sender: TObject);
    procedure PanelTmpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N4Click(Sender: TObject);
    procedure SbDeviceButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private 宣言 }

    FPanelTypeList      : TPanelTypeList;
    MovePanel           : TPortPanel;

    FLayoutButton       : array [0..49] of TPortPanel;

    procedure   MakeComponent;
    function    GetPanelLayoutListData( pat : integer ) : TLayoutData;

  public
    { Public 宣言 }

    procedure   MakeDeviceList;
    procedure   DispLayout( pat : integer=0 );

  end;

var
  PanelLayoutForm: TPanelLayoutForm;

implementation

{$R *.dfm}

uses
    MainUnit, CommonUnit, LogUtilUnit, UiPanelKeyButtonUnit, SbDeviceUnit,
  SbDeviceTypeUnit, SbPanelTypeUnit;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPanelLayoutForm.GetPanelLayoutListData( pat : integer ) : TLayoutData;
var
    i : integer;
    lay : TLayoutData;
    pt  : TPanelType;

begin
    pt  := FPanelTypeList.Data[ pat ];

    for i:=0 to MainForm.PanelKeyLayoutData.List.Count-1 do begin

        lay := MainForm.PanelKeyLayoutData.List.Data[i].Child[0];

        // F_UiKeyが一致しているものを探す
        if lay.Frame.F_name = pt.FSbPanel.F_UiKey then begin
            Result := lay;
            Exit;
        end;
    end;

    Result := nil;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.DispLayout( pat : integer );
var
//    lb : TLayoutButton;
    i, t, l, w, h : integer;
    lay : TLayoutData;
    rct : TRect;
    dst : TUiPanelKeyButton;
    btn : TLayoutButton;

begin

    // リストを選択状態にする
//    FPanelTypeList.Data[ pat ].Select   := True;
    FPanelTypeList.Select   := pat;

    // F_UiKeyをリストから探す
    lay := GetPanelLayoutListData( pat );
    if lay = nil then begin
        beep;
        Exit;
    end;

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

            dst := TUiPanelKeyButton( btn.Button );

            rct := CalcButtonSize(
                    lay.Frame.F_ColCount,
                    lay.Frame.F_RowCount,
                    LayoutPanel,
                    dst.F_Left,
                    dst.F_Top,
                    dst.F_Width,
                    dst.F_Height,
                    StrToIntDef( lay.Frame.F_TitleBarHeightPix, 0 ) );

            FLayoutButton[i].PortID     := dst.F_ButtonNo;
            FLayoutButton[i].SubTitle   := dst.F_Order;
            FLayoutButton[i].ID         := dst.F_Id;

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
procedure TPanelLayoutForm.FormCreate(Sender: TObject);
begin

    NoPanel.Color       := TOP_COLOR;
    IDPanel.Color       := TOP_COLOR;
    NamePanel.Color     := TOP_COLOR;
    TypePanel.Color     := TOP_COLOR;
    KeyPanel.Color      := TOP_COLOR;
    IPPanel.Color       := TOP_COLOR;

    MakeComponent;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.FormDestroy(Sender: TObject);
begin

//    FPanelTypeList.ClearAll;
    FPanelTypeList.Free;

//    MovePanel.           : TPortPanel;

end;

//-----------------------------------------------------------------------------
//  コンポーネント制作
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.MakeComponent;
var
    i : integer;
    pnl : TPortPanel;

begin
{log}SetOpeLog( 'OPE:TXPTLayoutForm.MakeConponent' );

//    _MovePanel.Visible          := False;

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

    // DEST/SOURCE ボタン
    for i:=0 to HIGH( FLayoutButton ) do begin
        pnl         := TPortPanel.Create( LayoutPanel );
        pnl.Parent  := LayoutPanel;
        pnl.Width   := PanelTmp.Width;
        pnl.Height  := PanelTmp.Height;
        pnl.Top     := 0 + (PanelTmp.Height + 2) * (i div 10);
        pnl.Left    := 0 + (PanelTmp.Width + 2) * (i mod 10);

        pnl.BevelKind       := PanelTmp.BevelKind;
        pnl.BevelOuter      := PanelTmp.BevelOuter;
        pnl.ParentBackGround    := False;
        pnl.Caption         := '';
        pnl.Color           := PanelTmp.Color;
        pnl.DoubleBuffered  := True;
        pnl.Tag             := i;

        pnl.OnMouseDown     := PanelTmpMouseDown;

//        pnl.OnMouseDown := PanelTmpMouseDown;
//        pnl.OnMouseMove := PanelTmpMouseMove;
//        pnl.OnMouseUp   := PanelTmpMouseUp;

        FLayoutButton[i]  := pnl;
    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.MakeDeviceList;
var
    lst : TSbDeviceList;
    d : TSbDevice;
    i, t, index : integer;
    tls : TSbDeviceTypeList;
    pls : TSbPanelTypeList;
    id : string;
    p : TPanelType;

begin

    FPanelTypeList  := TPanelTypeList.Create;

    lst := MainForm.SBusDb.SbDeviceList;
    tls := MainForm.SBusDb.SbDeviceTypeList;
    pls := MainForm.SBusDb.SbPanelTypeList;

    t       := TerPanel.Top;
    index   := 0;

    for i:=0 to lst.Count-1 do begin
        d := lst.Data[i];
        if (d.F_Name = '') or (d.F_TypeName = '') then continue;

        id := tls.GetPanelTypeId( d.F_TypeName );
        if '' = id then continue;

        p               := TPanelType.Create( GScrollBox );
        p.FName         := d.F_Name;
        p.FTypeName     := d.F_TypeName;
        p.FPanelID      := id;
        p.FSbPanel      := pls.Search( id );
        p.FStationID    := d.F_StationID;
        p.FIP           := d.F_IpAddress;

        FPanelTypeList.Add( p );

        p.Parent        := GScrollBox;
        p.ParentBackground  := False;
        p.Width         := TerPanel.Width;
        p.Height        := TerPanel.Height;
        p.Left          := TerPanel.Left;
        p.Top           := t;
        p.Font          := TerPanel.Font;
        p.Tag           := Index;
        p.Caption       := '';
        p.OnClick       := TerPanelClick;

        if (index mod 2) = 0 then   p.Color := EVEN_COLOR
        else                        p.Color := ODD_COLOR;

        t := t + (p.Height + 1);
        Inc( index );
    end;

end;

//-----------------------------------------------------------------------------
//  個別設定
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.N4Click(Sender: TObject);
var
    pnl : TPortPanel;
    d : TLayoutButton;
    lay : TLayoutData;

begin
    pnl := FLayoutButton[ PopupMenu.Tag ];

    // 設定用ウィンドウ表示
    lay := GetPanelLayoutListData( FPanelTypeList.Select );

    d   := lay.List.SearchId( pnl.ID );

    if True = UiPanelKeyButtonForm.Start( TUiPanelKeyButton( d.Button ) ) then begin

        pnl.ID  := d.Button.F_Id;

        // 変更したときUNDO作成
//        MainForm.MakeUndo;

        // 再表示
        DispLayout;
    end;

end;

//-----------------------------------------------------------------------------
//  ボタン上でマウスダウン
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.PanelTmpMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    pnl : TPortPanel;
    po : TPoint;

begin
{log}SetOpeLog( 'OPE:TPanelLayoutForm.PanelTmpMouseDown' );

    pnl := TPortPanel( Sender );

    if mbRight = Button then begin

        po := pnl.ClientToScreen( Point( x, y ) );
        PopupMenu.Popup( po.X, po.Y );

        PopupMenu.Tag   := pnl.Tag;
    end
    else begin



    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.TerPanelClick(Sender: TObject);
var
    i : integer;
    tmp, p : TPanelType;

begin
    p := TPanelType( Sender );

    if True = p.Select then begin
        // 非選択
//        p.Select        := False;
    end
    else begin
        // 選択
        for i:=0 to FPanelTypeList.Count-1 do begin
            tmp := FPanelTypeList.Data[ i ];
            tmp.Select    := (p.Tag = i);

            // レイアウト表示
            if True = tmp.Select then
                DispLayout( i );

        end;
    end;


end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.SbDeviceButtonClick(Sender: TObject);
var
    n : integer;
    b : TSbDevice;
    b1 : TSbDeviceType;
    p : TPanelType;

begin

    n := FPanelTypeList.Select;
    p := FPanelTypeList.Data[ n ];

    case TMusFlatButton( Sender ).Tag of
    0:
        begin
            b := MainForm.SBusDb.SbDeviceList.SearchStationId( p.FStationID );
            SbDeviceForm.Start( b );
        end;

    1:
        begin
            b1 := MainForm.SBusDb.SbDeviceTypeList.SearchPanelTypeId( p.FPanelID );
            SbDeviceTypeForm.Start( b1 );
        end;

    2:
        begin
//            b2 := p.FSbPanel;
            SbPanelTypeForm.Start( p.FSbPanel );
        end;

    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelLayoutForm.GScrollBoxMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
const
	WheelScrollSize		= 62;

var
    mv : integer;

begin
	// 移動量
	if WheelDelta > 0 then mv := -WheelScrollSize
    else                   mv := WheelScrollSize;

    GScrollBox.VertScrollBar.Position := GScrollBox.VertScrollBar.Position + mv;
    Handled := True;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPanelType.Create(AOwner: TComponent);
begin

    inherited;

    FName       := '';
    FTypeName   := '';
    FPanelID    := '';

    FSbPanel    := nil;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelType.SetSelect( sw : Boolean );
begin
    FSelect := sw;

    if True = sw then begin
        Color   := $000080ff
    end
    else begin
        if 0 = (tag mod 2) then Color := EVEN_COLOR
        else                    Color := ODD_COLOR;

    end;

//    Invalidate;
end;

//-----------------------------------------------------------------------------
// デストラクタ
//-----------------------------------------------------------------------------
destructor 	TPanelType.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelType.Paint;
begin
    DiapCategory;
end;

//-----------------------------------------------------------------------------
//	プレイリスト表示
//-----------------------------------------------------------------------------
procedure TPanelType.DiapCategory;
//var
//	col : TColor;

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

    Canvas.Brush.Color	:= Color;
//	Canvas.FrameRect( Rect( 0, 0, Width, Height ) );
	Canvas.FillRect( Rect( 0, 0, Width, Height ) );

//    Canvas.Font.Name    := 'Arial Rounded MT Bold';
    Canvas.Font.Name    := 'メイリオ';
    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
//    Canvas.Font.Size	:= 9;
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    // No.
//    CenterTextRect( Canvas, Rect( 0, 0, 50, Height ), IntToStr( Tag+1 ) );
    CenterTextRect( Canvas, Rect( 0, 0, 50, Height ), FStationID );

    // NAME
    LeftTextRect( Canvas, Rect( 50, 0, 240, Height ), FName );

    // 名称
    Canvas.Font.Name    := 'メイリオ';
    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    LeftTextRect( Canvas, Rect( 240+5, 0, 240+5+240, Height ), FTypeName, True );

    // 表示順
//    Canvas.Font.Name    := 'メイリオ';
//    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
//    Canvas.Font.Style	:= [];
//    Canvas.Font.Color	:= clBlack;
    CenterTextRect( Canvas, Rect( 480+5, 0, 480+5+80, Height ), FPanelID, True );

    // UiKey
    LeftTextRect( Canvas, Rect( 570, 0, 570+150, Height ), FSbPanel.F_UiKey, True );

    // UiKey
    LeftTextRect( Canvas, Rect( 760, 0, 760+150, Height ), FIP, True );

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPanelTypeList.Create;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
// デストラクタ
//-----------------------------------------------------------------------------
destructor 	TPanelTypeList.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPanelTypeList.GetData( index : integer ) : TPanelType;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TPanelType( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelTypeList.ClearAll;
var
    d : TPanelType;

begin
    while True do begin
        d := Data[0];
        if d = nil then break;

        Extract( d );
        d.Free;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPanelTypeList.GetSelect : integer;
var
    d : TPanelType;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        d := Data[i];
        if True = d.Select then begin
            Result := i;
            Exit;
        end;
    end;

    Result := -1;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPanelTypeList.SetSelect( index : integer );
var
    d : TPanelType;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        d := Data[i];
        d.Select := (i = index);
    end;
end;

    end.
