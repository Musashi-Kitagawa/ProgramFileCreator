//*****************************************************************************
//  ニューテレステクノ株式会社殿向け 「PROGRAM FILE CREATOR」
//  番組カテゴリレイアウト
//
//  Dec - 25 - '20
//  武蔵株式会社
//*****************************************************************************
unit ProgramCategoryUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Contnrs, System.Types,
//
    GroupCategoryUnit, MusFlatButton, ScreenDbUnit;

type
  TProgramCategoryForm = class(TForm)
    CaScrollBox: TScrollBox;
    TerPanel: TPanel;
    DispPanel: TPanel;
    NamePanel: TPanel;
    NoPanel: TPanel;
    Cate1Button: TMusFlatButton;
    Cate2Button: TMusFlatButton;
    Cate3Button: TMusFlatButton;
    InputEdit: TEdit;
    Label4: TLabel;
    PlusLabel: TLabel;
    MinusLabel: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TerPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Cate1ButtonClick(Sender: TObject);
//    procedure InputEditEnter(Sender: TObject);
//    procedure InputEditExit(Sender: TObject);
//    procedure InputEditKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure MinusLabelClick(Sender: TObject);
  private
    { Private 宣言 }

    FCategoryPanelList      : TCategoryPanelList;
    FSelectCategory         : integer;

    function    GetSelectCategory : integer;
    procedure   SetSelectCategory( cate : integer );

    property    SelectCategory : integer    read GetSelectCategory      write SetSelectCategory;

  public
    { Public 宣言 }

    procedure   MakeComponent;
//    procedure   DispCategory;

  end;

var
  ProgramCategoryForm: TProgramCategoryForm;

implementation

{$R *.dfm}

uses
    MainUnit, CommonUnit, LogUtilUnit, PiCategoryUnit;

//-----------------------------------------------------------------------------
//  選択カテゴリ取得
//-----------------------------------------------------------------------------
function TProgramCategoryForm.GetSelectCategory : integer;
begin
//    Result := 0;
    Result := FSelectCategory;
end;

//-----------------------------------------------------------------------------
//  選択カテゴリ設定
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.SetSelectCategory( cate : integer );
begin
    if cate = -1 then begin
        // 初期化
        cate            := 0;
        FSelectCategory := cate;
    end
    else begin
        // 変化なし
        if FSelectCategory = cate then Exit;

        FSelectCategory := cate;

        // 再表示
        MakeComponent;
    end;

    // カテゴリ変更ボタン表示
    SetButtonOnOff( Cate1Button, (cate = Cate1Button.Tag) );
    SetButtonOnOff( Cate2Button, (cate = Cate2Button.Tag) );
    SetButtonOnOff( Cate3Button, (cate = Cate3Button.Tag) );
end;

//-----------------------------------------------------------------------------
//  ウィンドウ作成
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.FormCreate(Sender: TObject);
begin

    FCategoryPanelList      := TCategoryPanelList.Create;

    SelectCategory         := -1;

    InputEdit.Visible   := False;

    NoPanel.Caption     := ' ' + NoPanel.Caption;
    NoPanel.Color       := TOP_COLOR;

    NamePanel.Caption   := ' ' + NamePanel.Caption;
    NamePanel.Color     := TOP_COLOR;

    DispPanel.Caption   := ' ' + DispPanel.Caption;
    DispPanel.Color     := TOP_COLOR;
end;

//-----------------------------------------------------------------------------
//  ウィンドウ廃棄
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.FormDestroy(Sender: TObject);
begin
    FCategoryPanelList.ClearAll;
    FCategoryPanelList.Free;

end;

//-----------------------------------------------------------------------------
//  カテゴリ選択ボタン押下
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.Cate1ButtonClick(Sender: TObject);
begin
    SelectCategory  := TMusFlatButton( Sender ).Tag;
end;

//-----------------------------------------------------------------------------
//  コンポーネント作成
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.MakeComponent;
var
    pl : TPiCategoryList;
    pi : TPiCategory;
    i, t, n : integer;
    ca : TCategoryPanel;

begin

    pl  := MainForm.ProgramIndexDb.PiCategoryList[ SelectCategory ];

    if pl.Count > FCategoryPanelList.Count then begin
        // 不足しているのでパネル追加

        n := pl.Count - FCategoryPanelList.Count;
        t := TerPanel.Top + (TerPanel.Height + 1) * FCategoryPanelList.Count;
        for i:=0 to n-1 do begin
//            pi := pl.Data[ i ];
            ca              := TCategoryPanel.Create( CaScrollBox );
            ca.Parent       := CaScrollBox;
            ca.Left         := TerPanel.Left;
            ca.Top          := t;
            ca.Width        := TerPanel.Width;
            ca.Height       := TerPanel.Height;
            ca.BevelOuter   := TerPanel.BevelOuter;
            ca.Font         := TerPanel.Font;
            ca.ParentBackground := False;
            ca.Visible      := True;
            ca.OnMouseDown  := TerPanelMouseDown;
            FCategoryPanelList.Add( ca );

            t := t + (ca.Height + 1);
        end;

    end
    else if FCategoryPanelList.Count > pl.Count then begin
        // 多いので削除
        n := FCategoryPanelList.Count - pl.Count;

        for i:=0 to n-1 do begin
            ca := FCategoryPanelList.Data[0];
            FCategoryPanelList.Extract( ca );
            ca.Free;
        end;
    end;

    // インデックスで並び替え
    pl.SortOrder;

    // 再表示
    t   := TerPanel.Top;
    for i:=0 to pl.Count-1 do begin
        pi              := pl.Data[ i ];
        ca              := FCategoryPanelList.Data[i];
        ca.Title        := pi.F_CategoryName;
        ca.IndexNo      := pi.F_Order;
        ca.ID           := pi.F_Id;
        ca.Top          := t;
        ca.Tag          := i;
        if (i mod 2) = 0 then   ca.Color := EVEN_COLOR
        else                    ca.Color := ODD_COLOR;
//        ca.OnMouseDown  := TerPanelMouseDown;

        t := t + (ca.Height + 1);
    end;
end;

//-----------------------------------------------------------------------------
//  編集、削除、追加
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.MinusLabelClick(Sender: TObject);
var
    pl : TPiCategoryList;
    pi : TPiCategory;
    sel : integer;

begin
    pl  := MainForm.ProgramIndexDb.PiCategoryList[ SelectCategory ];

    case TLabel( Sender ).Tag of
    0:  // 追加
        begin
            // 選択なし
            FCategoryPanelList.Select   := -1;

            pi := TPiCategory.Create;

            pi.F_Id             := pl.GetMaxId;
            pi.E_Id             := True;
            pi.F_CategoryName   := '';
            pi.E_CategoryName   := True;
            pi.F_Order          := pl.GetMaxOrder;
            pi.E_Order          := True;

            if False = PiCategoryForm.Start( pi ) then begin
                pi.Free;
                Exit;
            end;

            pl.Add( pi );
        end;

    1:  // 削除
        begin
            sel := FCategoryPanelList.Select;
            if -1 = sel then Exit;

            pi := pl.Data[ sel ];
            pl.Extract( pi );
            pi.Free;
        end;

    2:  // 編集
        begin
            sel := FCategoryPanelList.Select;
            if -1 = sel then Exit;

            pi := pl.Data[ sel ];
            if False = PiCategoryForm.Start( pi ) then begin
                Exit;
            end;
        end;

    else
        Exit;

    end;

    // 再表示
    MakeComponent;
end;

//-----------------------------------------------------------------------------
//  リストパネル マウス押下
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.TerPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   cate : integer;
//   pnl : TCategoryPanel;

begin
    cate := TPanel( Sender ).Tag;

{log}SetOpeLog( 'OPE:TProgramCategoryForm.CatePanelMouseDown', cate );

    if mbLeft = Button then begin

        // 選択状態にする
        FCategoryPanelList.Select    := cate;

    end
    else begin

{
        // 名称

        // 名称入力ボックス表示
        pnl := FCategoryPanelList.Data[ cate ];

        InputEdit.Parent    := pnl;
        InputEdit.Top       := 0;
        InputEdit.Left      := 50;
        InputEdit.Width     := NamePanel.Width;
        InputEdit.Text      := pnl.Title;
        InputEdit.Tag       := cate;
        InputEdit.Visible   := True;

        InputEdit.SetFocus;
}
        // 表示順
//       IndexPopupMenu.Tag  := cate;
//        // ポップアップメニュ表示
//        po := TPanel( Sender ).ClientToScreen( Point( x, y ) );
//        IndexPopupMenu.Popup( po.X, po.Y );
    end;
end;

(*
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.InputEditEnter(Sender: TObject);
begin
    ;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.InputEditExit(Sender: TObject);
begin
    InputEdit.Parent    := nil;
    InputEdit.Visible   := False;
end;

//-----------------------------------------------------------------------------
//  名称入力 イベント
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
//    btn : TLayoutButton;
    pnl : TCategoryPanel;

begin

	case Key of
    VK_RETURN:
        begin
        	//	ENTERが押された

            // 確定
            pnl := FCategoryPanelList.Data[ InputEdit.Tag ];
            pnl.Title   := InputEdit.Text;

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;

            // ワークデータにセット
//            btn := MainForm.CategoryList.Data[ InputEdit.Tag ];
//            TuiScreenselectButton( btn.Button ).F_Text  := InputEdit.Text;

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
*)




end.
