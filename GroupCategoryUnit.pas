//*****************************************************************************
//  ニューテレステクノ株式会社殿向け 「PROGRAM FILE CREATOR」
//  カテゴリ設定画面
//
//  Dec - 25 - '20
//  武蔵株式会社
//*****************************************************************************
unit GroupCategoryUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Types, Vcl.Graphics, System.Contnrs, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, MusFlatButton, Vcl.Menus,
//
    ScreenDbUnit, CommonUnit;

type
//-----------------------------------------------------------------------------
//	プレイリスト表示用
//-----------------------------------------------------------------------------
  TCategoryPanel	= class( TPanel )
  private
	FTitle		: string;
    FIndex	    : string;
    FID	        : string;

//    FUp         : TLabel;
//    FDown       : TLabel;

    procedure   DiapCategory;
    procedure   SetTitle( ttl : string );
    procedure   SetIndex( inx : string );
    procedure   SetID( id : string );

  protected
  	procedure 	Paint; override;

  public
	property	Title   : string	    read FTitle		write SetTitle;
	property	IndexNo	: string        read FIndex	    write SetIndex;
	property	ID	    : string        read FID        write SetID;

  end;

//-----------------------------------------------------------------------------
//	プレイリスト表示用
//-----------------------------------------------------------------------------
  TCategoryPanelList = class( TObjectList )
    private

        function    GetData( index : integer ) :  TCategoryPanel;

        procedure   SetSelect( index : integer );
        function    GetSelect : integer;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

		procedure   ClearAll;

        property    Data[index:integer] : TCategoryPanel	read GetData;
        property    Select : integer    read GetSelect      write SetSelect;
    end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

type
  TGroupCategoryForm = class(TForm)
    NoPanel: TPanel;
    NamePanel: TPanel;
    DispPanel: TPanel;
    CatePanel: TPanel;
    IndexPopupMenu: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    InputEdit: TEdit;
    RebuildButton: TMusFlatButton;
    UpLabel: TLabel;
    DownLabel: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CatePanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InputEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InputEditEnter(Sender: TObject);
    procedure InputEditExit(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure RebuildButtonClick(Sender: TObject);

  private
    { Private 宣言 }

    FCatePanel      : array [0..9] of TCategoryPanel;

    procedure   DataTypeChangeMessage( var Msg : TMessage );    message WM_DATATYPE_CHANGE_MESSAGE;
    procedure   MakeCategoryPanel;

  public
    { Public 宣言 }

    procedure   DispCategory;
  end;

var
  GroupCategoryForm: TGroupCategoryForm;

implementation

{$R *.dfm}

uses
    MainUnit, LogUtilUnit;

//-----------------------------------------------------------------------------
//  データタイプ（XPT、パネル）変更通知）
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.DataTypeChangeMessage( var Msg : TMessage );
begin
{log}SetOpeLog( 'OPE:TGroupCategoryForm.DataTypeChangeMessage' );

    // 再表示
    DispCategory;
end;

//-----------------------------------------------------------------------------
//  マウスダウンイベント
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.CatePanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   cate : integer;
   po : TPoint;

begin
    cate := TPanel( Sender ).Tag;

{log}SetOpeLog( 'OPE:TGroupCategoryForm.CatePanelMouseDown', cate );

    if mbLeft = Button then begin
        // 名称

        // 名称入力ボックス表示
        InputEdit.Parent    := FCatePanel[ cate ];
        InputEdit.Top       := 0;
        InputEdit.Left      := 50;
        InputEdit.Width     := NamePanel.Width;
        InputEdit.Text      := FCatePanel[ cate ].Title;
        InputEdit.Tag       := cate;
        InputEdit.Visible   := True;

        InputEdit.SetFocus;
    end
    else begin
        // 表示順

        IndexPopupMenu.Tag  := cate;

        // ポップアップメニュ表示
        po := TPanel( Sender ).ClientToScreen( Point( x, y ) );
        IndexPopupMenu.Popup( po.X, po.Y );
    end;
end;

//-----------------------------------------------------------------------------
//  ウィンドウ作成
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.FormCreate(Sender: TObject);
begin

    InputEdit.Visible   := False;

    NoPanel.Caption     := ' ' + NoPanel.Caption;
    NoPanel.Color       := TOP_COLOR;

    NamePanel.Caption   := ' ' + NamePanel.Caption;
    NamePanel.Color     := TOP_COLOR;

    DispPanel.Caption   := ' ' + DispPanel.Caption;
    DispPanel.Color     := TOP_COLOR;

    // カテゴリパネル作成
    MakeCategoryPanel;
end;

//-----------------------------------------------------------------------------
//  カテゴリリスト作成
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.MakeCategoryPanel;
var
    i : integer;

begin
{log}SetOpeLog( 'OPE:TGroupCategoryForm.MakeCategoryPanel' );

    for i:=0 to HIGH( FCatePanel ) do begin

        FCatePanel[i]           := TCategoryPanel.Create( Self );
        FCatePanel[i].Parent    := Self;
        FCatePanel[i].Tag       := i;
        FCatePanel[i].ID        := '';
        FCatePanel[i].Left      := CatePanel.Left;
        FCatePanel[i].Height    := CatePanel.Height;
        FCatePanel[i].Width     := CatePanel.Width;
        FCatePanel[i].Top       := CatePanel.Top + (CatePanel.Height + 1) * i;
        FCatePanel[i].Caption   := '';
        FCatePanel[i].BevelOuter    := CatePanel.BevelOuter;
        FCatePanel[i].Font      := CatePanel.Font;
        FCatePanel[i].Visible   := True;
        FCatePanel[i].Tag       := i;

        FCatePanel[i].OnMouseDown   := CatePanelMouseDown;

        FCatePanel[i].ParentBackground  := False;
        if ((i mod 2) = 0) then FCatePanel[i].Color := EVEN_COLOR
        else FCatePanel[i].Color                    := ODD_COLOR;

{
        FCatePanel[i].FUp           := TLabel.Create( FCatePanel[i] );
        FCatePanel[i].FUp.Parent    := FCatePanel[i];
        FCatePanel[i].FUp.Font      := UpLabel.Font;
        FCatePanel[i].FUp.Left      := 200;
        FCatePanel[i].FUp.Tag       := (i * 100) + 0;

        FCatePanel[i].FDown         := TLabel.Create( FCatePanel[i] );
        FCatePanel[i].FDown.Parent  := FCatePanel[i];
        FCatePanel[i].FDown.Font    := DownLabel.Font;
        FCatePanel[i].FDown.Left    := 200;
        FCatePanel[i].FDown.Tag     := (i * 100) + 1;
}

    end;
end;

//-----------------------------------------------------------------------------
//  リスト表示
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.DispCategory;
var
    i : integer;
    lst : TLayoutButtonList;
    sb : TUiScreenSelectButton;

begin
{log}SetOpeLog( 'OPE:TGroupCategoryForm.DispCategory' );

    lst := MainForm.CategoryList;

    for i:=0 to MainForm.MAX_CATEGORY-1 do begin

        if i < lst.Count then begin
            // 表示
            sb := TUiScreenSelectButton( lst.Data[i].Button );

            FCatePanel[i].Title     := sb.F_Text;
            FCatePanel[i].IndexNo   := sb.F_Order;
            FCatePanel[i].Visible   := True;
        end
        else begin
            // 非表示
            FCatePanel[i].Title     := '';
            FCatePanel[i].IndexNo   := '';
            FCatePanel[i].Visible   := False;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//  表示順ポップアップメニュ
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.N11Click(Sender: TObject);
var
    cate : TLayoutButton;
    n, cno : integer;

begin
{log}SetOpeLog( 'OPE:TGroupCategoryForm.N11Click' );

    // どこのカテゴリ？
    cno := IndexPopupMenu.Tag;

    // 変更する順番（１相対）
    n   := TMenuItem( Sender ).Tag;

    // 表示位置の書き換え
    cate := MainForm.CategoryList.Data[ cno ];

    if cate = nil then Exit;

    // ワークデータ変更
    TUiScreenSelectButton( cate.Button ).F_Left := Format( '.%d', [n-1] );

    // 表示書き換え
    FCatePanel[ cno ].IndexNo   := IntToStr( n );

end;

//-----------------------------------------------------------------------------
//  再構築
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.RebuildButtonClick(Sender: TObject);
begin
    MainForm.RebuildProc;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.InputEditEnter(Sender: TObject);
begin
    ;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.InputEditExit(Sender: TObject);
begin
    InputEdit.Parent    := nil;
    InputEdit.Visible   := False;
end;

//-----------------------------------------------------------------------------
//  名称入力
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    btn : TLayoutButton;

begin

	case Key of
    VK_RETURN:
        begin
        	//	ENTERが押された

            // 確定
            FCatePanel[ InputEdit.Tag ].Title   := InputEdit.Text;

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;

            // ワークデータにセット
            btn := MainForm.CategoryList.Data[ InputEdit.Tag ];
            TuiScreenselectButton( btn.Button ).F_Text  := InputEdit.Text;

{log}SetOpeLog( 'OPE:TGroupCategoryForm.InputEditKeyDown', InputEdit.Text );
        end;

    VK_ESCAPE:
        begin
        	// ESCAPEが押された

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;
        end;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	カスタムパネル関連
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TCategoryPanel.SetTitle( ttl : string );
begin
	FTitle := ttl;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TCategoryPanel.SetIndex( inx : string );
begin
	FIndex := inx;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TCategoryPanel.SetID( id : string );
begin
	FID := id;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TCategoryPanel.Paint;
begin
    DiapCategory;
end;

//-----------------------------------------------------------------------------
//	プレイリスト表示
//-----------------------------------------------------------------------------
procedure TCategoryPanel.DiapCategory;
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

    // No.
    Canvas.Font.Name    := 'Arial Rounded MT Bold';
    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    if FID = '' then
        CenterTextRect( Canvas, Rect( 0, 0, 50, Height ), IntToStr( Tag+1 ) )
    else
        CenterTextRect( Canvas, Rect( 0, 0, 50, Height ), FID );

    // 名称
    Canvas.Font.Name    := 'メイリオ';
    Canvas.Font.Size	:= 9;
    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    LeftTextRect( Canvas, Rect( 50+5, 0, 50+5+200, Height ), FTitle, True );

    // 表示順
//    Canvas.Font.Name    := 'メイリオ';
//    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
//    Canvas.Font.Style	:= [];
//    Canvas.Font.Color	:= clBlack;

    CenterTextRect( Canvas, Rect( 250+5, 0, 250+5+80, Height ), FIndex, True );

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
// コンストラクタ
//-----------------------------------------------------------------------------
constructor TCategoryPanelList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
// デストラクタ
//-----------------------------------------------------------------------------
destructor 	TCategoryPanelList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TCategoryPanelList.GetData( index : integer ) :  TCategoryPanel;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TCategoryPanel( Items[ index ] );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TCategoryPanelList.ClearAll;
var
    d : TCategoryPanel;

begin
    while True do begin
        d := Data[0];
        if d = nil then Break;

        Extract( d );
        d.Free;
    end;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TCategoryPanelList.SetSelect( index : integer );
var
    d : TCategoryPanel;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        d := Data[ i ];

        if i = index then begin
            d.Color := $000080ff;
        end
        else begin
            if (i mod 2) = 0  then  d.Color := EVEN_COLOR
            else                    d.Color := ODD_COLOR;
        end;
    end;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TCategoryPanelList.GetSelect : integer;
var
    d : TCategoryPanel;
    i : integer;

begin

    for i:=0 to Count-1 do begin
        d := Data[ i ];

        if d.Color = $000080ff then begin
            Result := i;
            Exit;
        end;
    end;

    Result := -1;
end;



{
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.DeleteButton( frid : integer );
var
    lst : TScreenList;
    i, j : integer;

begin

    lst := TScreenList.Create;

    // FRAME 削除
    MainForm.ScreenList.SearchSource( UiFrame_No, IntToStr( frid ), lst );
    for i:=0 to lst.Count-1 do begin

        DeleteButton( lst.Data[i].F_Id );

        MainForm.DeleteDataBase( lst.Data[i] );
    end;

    // ボタン類の削除
    for j:=UiScreenSelectButton_No to UiColorSrcKeyButton_No do begin

        lst.Empty;

        MainForm.ScreenList.SearchSource( j, IntToStr( frid ), lst );
        for i:=0 to lst.Count-1 do begin
            MainForm.DeleteDataBase( lst.Data[i] );
        end;

    end;

    lst.Free;
end;

//-----------------------------------------------------------------------------
//  カテゴリ内のフレーム、ボタン初期化
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.Button1Click(Sender: TObject);
var
    cate : TLayoutButton;
    fr : TUiButton;

begin

    cate := MainForm.CategoryList.Data[ 0 ];

    fr := MainForm.ScreenList.SearchByName( UiFrame_No, TUiScreenSelectButton( cate.Button ).F_FrameName );

    if fr = nil then Exit;

    DeleteButton( fr.F_Id );

    MainForm.SaveDataBase2;

end;
}


end.
