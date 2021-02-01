unit UiDstButtonListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.Contnrs,
//
    ScreenDbUnit, Vcl.Menus;

type
  TUiDstButtonListForm = class(TForm)
    ListView: TListView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private 宣言 }

    FListType   : integer;

    procedure   DispList( lst : TScreenList; uitype : integer );
    procedure   SortProc;

  public
    { Public 宣言 }

    procedure   Start( lst : TScreenList; uitype : integer );

  end;


var
  UiDstButtonListForm: TUiDstButtonListForm;

implementation

{$R *.dfm}

uses MainUnit, UiFrameUnit, ScreenButtonUnit, UiDstButtonUnit, UiSrcButtonUnit,
  UiPanelDstButtonUnit, UiPanelSrcButtonUnit, UiContentUnit;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TUiDstButtonListForm.FormCreate(Sender: TObject);
begin
    // 全削除
    ListView.Items.Clear;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TUiDstButtonListForm.Start( lst : TScreenList; uitype : integer );
begin

    FListType   := uitype;

    case uitype of
    UiFrame_No:
        begin
            Caption := 'UiFrame リスト';
            ListView.Columns[3].Caption := 'F_TitleText';
            ListView.Columns[4].Caption := 'F_Note';
        end;

    UiScreenSelectButton_No:
        begin
            Caption := 'UiScreenSelectButton リスト';
            ListView.Columns[3].Caption := 'F_FrameId';
            ListView.Columns[4].Caption := 'F_Text';
        end;

    UiDstButton_No:
        begin
            Caption := 'UiDstButton リスト';
            ListView.Columns[3].Caption := 'F_FrameId';
            ListView.Columns[4].Caption := 'F_DstPortNo';
        end;

    UiSrcButton_No:
        begin
            Caption := 'UiSrcButton リスト';
            ListView.Columns[3].Caption := 'F_FrameId';
            ListView.Columns[4].Caption := 'F_SrcPortNo';
        end;

    UiPanelDstButton_No:
        begin
            Caption := 'UiPanelDstButton リスト';
            ListView.Columns[3].Caption := 'F_FrameId';
            ListView.Columns[4].Caption := 'F_DstPortNo';
        end;

    UiPanelSrcButton_No:
        begin
            Caption := 'UiPanelSrcButton リスト';
            ListView.Columns[3].Caption := 'F_FrameId';
            ListView.Columns[4].Caption := 'F_SrcPortNo';
        end;

    UiContent_No:
        begin
            Caption := 'UiContent リスト';
            ListView.Columns[3].Caption := 'F_FrameId';
            ListView.Columns[4].Caption := 'F_SrcPortNo';
        end;

    end;

    ListView.Items.Clear;

    DispList( lst, uitype );

    Show;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TUiDstButtonListForm.DispList( lst : TScreenList; uitype : integer );
var
    cnt, i, ln : integer;
    s : TScreenDb;
    li : TListItem;

begin

    ln  := ListView.items.Count;
    cnt := 0;

    for i:=0 to lst.Count-1 do begin

        s := lst.Data[i];
        if s.FDataType <> uitype{UiDstButton_No} then continue;

        if cnt >= ln then begin
            li := ListView.Items.Add;
            li.SubItems.Add( '' );
            li.SubItems.Add( '' );
            li.SubItems.Add( '' );
            li.SubItems.Add( '' );
        end
        else begin
            li := ListView.Items[ cnt ];
        end;

        li.SubItems[0] := IntToStr( cnt + 1 );
        li.SubItems[1] := IntToStr( s.F_Id );

        case uitype of
        UiFrame_No:
            begin
                li.SubItems[2] := TUiFrame( s ).F_TitleText;
                li.SubItems[3] := TUiFrame( s ).F_Note;
            end;

        UiScreenSelectButton_No:
            begin
                li.SubItems[2] := TUiScreenSelectButton( s ).F_FrameId;
                li.SubItems[3] := TUiScreenSelectButton( s ).F_Text;
            end;

        UiDstButton_No:
            begin
                li.SubItems[2] := TUiDstButton( s ).F_FrameID;
                li.SubItems[3] := TUiDstButton( s ).F_DstPortNo;
            end;

        UiSrcButton_No:
            begin
                li.SubItems[2] := TUiSrcButton( s ).F_FrameID;
                li.SubItems[3] := TUiSrcButton( s ).F_SrcPortNo;
            end;

        UiPanelDstButton_No:
            begin
                li.SubItems[2] := TUiPanelDstButton( s ).F_FrameID;
                li.SubItems[3] := TUiPanelDstButton( s ).F_DstPortNo;
            end;

        UiPanelSrcButton_No:
            begin
                li.SubItems[2] := TUiPanelSrcButton( s ).F_FrameID;
                li.SubItems[3] := TUiPanelSrcButton( s ).F_SrcPortNo;
            end;

        UiContent_No:
            begin
                li.SubItems[2] := TUiContent( s ).F_Text;
                li.SubItems[3] := TUiContent( s ).F_UiType;
            end;

        end;

        Inc( cnt );
    end;

    // F_Iｄで並べ替え
    SortProc;

end;

//-----------------------------------------------------------------------------
//  ソート用コールバック関数
//-----------------------------------------------------------------------------
function Sort( Item1, Item2: TListItem; Index: Integer ) : Integer; stdcall;
var
    s1, s2 : integer;

begin

    s1 := StrToIntDef( Item1.SubItems[ 1 ], 0 );
    s2 := StrToIntDef( Item2.SubItems[ 1 ], 0 );

    // 昇順  ascending order
    if s1 > s2 then         Result := 1
    else if s1 < s2 then    Result := -1
    else                    Result := 0;

    // 降順  descending order
    //Result := -Result;
end;

//-----------------------------------------------------------------------------
//  ソート
//-----------------------------------------------------------------------------
procedure TUiDstButtonListForm.SortProc;
var
    i : integer;
    li : TListItem;

begin
    ListView.CustomSort( @Sort, 2 );

    // No.振り直し
    for i:=0 to ListView.items.Count-1 do begin
        li := ListView.Items[ i ];
        li.SubItems[0] := IntToStr( i + 1 );
    end;


end;

//-----------------------------------------------------------------------------
//  削除
//-----------------------------------------------------------------------------
procedure TUiDstButtonListForm.N2Click(Sender: TObject);
begin

end;

//-----------------------------------------------------------------------------
//  追加
//-----------------------------------------------------------------------------
procedure TUiDstButtonListForm.N4Click(Sender: TObject);
var
    uf : TUiFrame;
    uc : TUiContent;
    ub : TUiScreenSelectButton;
    ud  : TUiDstButton;
    us  : TUiSrcButton;
    upd : TUiPanelDstButton;
    ups : TUiPanelSrcButton;

begin

    case FListType of
    UiFrame_No:
        begin
            uf   := TUiFrame.Create;
            if False = UiFrameForm.Start( uf ) then begin
                uf.Free;
                Exit;
            end;

            MainForm.ScreenList.Add( uf );
        end;

    UiScreenSelectButton_No:
        begin
            ub  := TUiScreenSelectButton.Create;
            if False = ScreenButtonForm.Start( ub ) then begin
                ub.Free;
                Exit;
            end;

            MainForm.ScreenList.Add( ub );
        end;

    UiDstButton_No:
        begin
            ud  := TUiDstButton.Create;
            if False = UiDstButtonForm.Start( ud ) then begin
                ud.Free;
                Exit;
            end;

            MainForm.ScreenList.Add( ud );
        end;

    UiSrcButton_No:
        begin
            us  := TUiSrcButton.Create;
            if False = UiSrcButtonForm.Start( us ) then begin
                us.Free;
                Exit;
            end;

            MainForm.ScreenList.Add( us );
        end;

    UiPanelDstButton_No:
        begin
            upd := TUiPanelDstButton.Create;
            if False = UiPanelDstButtonForm.Start( upd ) then begin
                upd.Free;
                Exit;
            end;

            MainForm.ScreenList.Add( upd );
        end;

    UiPanelSrcButton_No:
        begin
            ups := TUiPanelSrcButton.Create;
            if False = UiPanelSrcButtonForm.Start( ups ) then begin
                ups.Free;
                Exit;
            end;

            MainForm.ScreenList.Add( ups );
        end;

    UiContent_No:
        begin
            uc  := TUiContent.Create;
            if False = UiContentForm.Start( uc ) then begin
                uc.Free;
                Exit;
            end;

            MainForm.ScreenList.Add( uc );
        end;

    else
        Exit;

    end;

end;

//-----------------------------------------------------------------------------
//  変更
//-----------------------------------------------------------------------------
procedure TUiDstButtonListForm.N1Click(Sender: TObject);
var
    it : TListItem;
    u : TUiButton;
    id : integer;


begin
    if nil = ListView.Selected then Exit;

    it := ListView.Items[ ListView.Selected.Index ];
    id := StrToIntDef( it.SubItems[1], -1 );
    if id < 0 then Exit;

    u := MainForm.ScreenList.Search( FListType, id );
    if u = nil then Exit;

    case FListType of
    UiFrame_No:                 UiFrameForm.Start( TUiFrame( u ) );
    UiScreenSelectButton_No:    ScreenButtonForm.Start( TUiScreenSelectButton( u ) );
    UiDstButton_No:             UiDstButtonForm.Start( TUiDstButton( u ) );
    UiSrcButton_No:             UiSrcButtonForm.Start( TUiSrcButton( u ) );
    UiPanelDstButton_No:        UiPanelDstButtonForm.Start( TUiPanelDstButton( u ) );
    UiPanelSrcButton_No:        UiPanelSrcButtonForm.Start( TUiPanelSrcButton( u ) );
    UiContent_No:               UiContentForm.Start( TUiContent( u ) );
    end;
end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
end.



(*
unit UiFrameIDListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
//
    ScreenDbUnit;

type
  TUiFrameIDListForm = class(TForm)
    ListView: TListView;
    procedure FormCreate(Sender: TObject);
  private
    { Private 宣言 }

    procedure   DispList( lst : TScreenList );

  public
    { Public 宣言 }

    procedure   Start( lst : TScreenList );
  end;

var
  UiFrameIDListForm: TUiFrameIDListForm;

implementation

{$R *.dfm}


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TUiFrameIDListForm.FormCreate(Sender: TObject);
begin
    // 全削除
    ListView.Items.Clear;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure   TUiFrameIDListForm.Start( lst : TScreenList );
begin

    DispList( lst );

    Show;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TUiFrameIDListForm.DispList( lst : TScreenList );
var
    cnt, i, ln : integer;
    s : TScreenDb;
    li : TListItem;

begin

    ln  := ListView.items.Count;
    cnt := 0;

    for i:=0 to lst.Count-1 do begin

        s := lst.Data[i];
        if s.FDataType <> UiFrame_No then continue;

        if cnt >= ln then begin
            li := ListView.Items.Add;
            li.SubItems.Add( '' );
            li.SubItems.Add( '' );
            li.SubItems.Add( '' );
            li.SubItems.Add( '' );
        end
        else begin
            li := ListView.Items[ cnt ];
        end;

        li.SubItems[0] := IntToStr( cnt + 1 );
        li.SubItems[1] := IntToStr( TUiFrame( s ).F_Id );
        li.SubItems[2] := TUiFrame( s ).F_TitleText;
        li.SubItems[3] := TUiFrame( s ).F_Note;

        Inc( cnt );
    end;

end;

end.
*)
