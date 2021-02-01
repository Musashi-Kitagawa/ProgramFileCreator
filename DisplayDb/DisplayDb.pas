unit DisplayDb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Contnrs,
//
    ScreenDbUnit, Vcl.StdCtrls, MusFlatButton, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TColorSetForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    MessListView: TListView;
    TypeListView: TListView;
    ValueListView: TListView;
    ColorListView: TListView;
    BasePanel: TPanel;
    Panel1: TPanel;
    OKButton: TMusFlatButton;
    CancelButton: TMusFlatButton;
    PageControl: TPageControl;
    TabSheet2: TTabSheet;
    MESScrollBox: TScrollBox;
    Panel2: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    TabSheet3: TTabSheet;
    ETScrollBox: TScrollBox;
    Panel5: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    TabSheet4: TTabSheet;
    EVScrollBox: TScrollBox;
    Panel4: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    TabSheet1: TTabSheet;
    ScrollBox: TScrollBox;
    Panel3: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure EditPanelClick(Sender: TObject);
    procedure ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private 宣言 }

//    FPanelList      : TScreenPanelList;
//    FMessageList    : TScreenPanelList;
//    FEnumTypeList   : TScreenPanelList;
//    FEnumValueList  : TScreenPanelList;

    FWorkList   : TDisplayList;

//    procedure   MakePanel;
    procedure   MakeList;

  public
    { Public 宣言 }

//    function Start( lst : TDisplayList; opt : integer ) : Boolean;
    procedure   Start( lst : TDisplayList );

  end;

var
  DisplayDbForm: TDisplayDbForm;

implementation

{$R *.dfm}

uses DisplayDspSettingsUnit, DisplayMessageUnit, DisplayEnumTypeUnit,
  DisplayEnumvalueUnit;


(*
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColorSetForm.EditPanelClick(Sender: TObject);
var
    ed : TScreenPanel;
    db : TDisplayDb;

    dd : TDisplayDspSettings;
    ms : TDisplayMessage;
    et : TDisplayEnumType;
    ev : TDisplayEnumValue;

begin

    ed := TScreenPanel( Sender );
    db := FWorkList.Data[ ed.Tag ];

    case db.FDataType of
    0:
        begin
            ms := TDisplayMessage( FWorkList[ ed.Tag ] );

            if False = DisplayMessageForm.Start( ms ) then Exit;

            ed.Title    := ms.F_MessageCode;
            ed.SubTitle := ms.F_Message;
            ed.Memo     := ms.F_Memo;
        end;

    1:
        begin
            et := TDisplayEnumType( FWorkList[ ed.Tag ] );

            if False = DisplayEnumTypeForm.Start( et ) then Exit;

            ed.Title    := et.F_Name;
            ed.SubTitle := et.F_Note;
            ed.Memo     := '';
        end;

    2:
        begin
            ev := TDisplayEnumvalue( FWorkList[ ed.Tag ] );

            if False = DisplayEnumvalueForm.Start( ev ) then Exit;

            ed.Title    := ev.F_EnumName;
            ed.SubTitle := ev.F_Value;
            ed.Memo     := ev.F_Text;
        end;

    3:
        begin
            dd := TDisplayDspSettings( FWorkList[ ed.Tag ] );

            if False = DisplayDspSettingsForm.Start( dd ) then Exit;

            ed.Title    := dd.F_ValueId;
            ed.SubTitle := dd.F_Value;
            ed.Memo     := dd.F_Note;
        end;

    end;
end;
*)

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColorSetForm.FormCreate(Sender: TObject);
begin
    PageControl.Align   := alClient;
    PageControl.ActivePageIndex := 0;

    MESScrollBox.Align  := alClient;
    ETScrollBox.Align   := alClient;
    EVScrollBox.Align   := alClient;
    ScrollBox.Align     := alClient;

{
    FMessageList    := TScreenPanelList.Create;
    FEnumTypeList   := TScreenPanelList.Create;
    FEnumValueList  := TScreenPanelList.Create;
    FPanelList      := TScreenPanelList.Create;
}

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColorSetForm.ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
    sc : TScrollBox;
    mv : integer;
    po : TPoint;

begin
	Handled := False;

    // カテゴリパネル上のチェック
    case PageControl.ActivePageIndex of
    0:  sc := MESScrollBox;
    1:  sc := ETScrollBox;
    2:  sc := EVScrollBox;
    3:  sc := ScrollBox;
    else Exit;
    end;

    po := sc.ScreenToClient( MousePos );	//Point(sc.Left, sc.Top) );

    // カテゴリパネル上でマウスホイール操作したとき
    if True = PtInRect( Rect(sc.Left, sc.Top, sc.Left+sc.Width, sc.Top+sc.Height), po ) then begin
        mv := 30 + 2;
        if WheelDelta > 0 then  mv := -mv;

        sc.VertScrollBar.Position := sc.VertScrollBar.Position + mv;
        Handled := True;
        Exit;
    end;


end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColorSetForm.Start( lst : TDisplayList );
begin
    Result := False;

    FWorkList   := lst;

    BasePanel.Visible       := (opt = 1);
    PageControl1.Visible    := (opt = 0);

    Caption             := 'DisplayDb 一覧';
    PageControl1.Align  := alClient;
    BasePanel.Align     := alNone;

    MakeList;

(*    case opt of
    0:  // VIEW
        begin
            Caption             := 'DisplayDb 一覧';
            PageControl1.Align  := alClient;
            BasePanel.Align     := alNone;

            MakeList;
        end;

    1:  // EDIT
        begin
            Caption             := 'DisplayDb 編集';
            BasePanel.Align     := alClient;
            PageControl1.Align  := alNone;

            // パネル作成
            MakePanel;
        end;
    end;
*)

    Show;

//    Result := True;
end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColorSetForm.MakeList;
var
    i : integer;
    li : TListItem;
    d : TDisplayDb;
    ms : TDisplayMessage;
    dd : TDisplayDspSettings;
    et : TDisplayEnumType;
    ev : TDisplayEnumValue;

begin
    for i:=0 to FWorkList.Count-1 do begin

        d := FWorkList.Data[i];

        case d.FDataType of
        0:  // MEESAGE
            begin
                ms          := TDisplayMessage( d );

                li := MessListView.Items.Add;
                li.SubItems.Add( ms.F_Id );
                li.SubItems.Add( ms.F_MessageCode );
                li.SubItems.Add( ms.F_Message );
                li.SubItems.Add( ms.F_Memo );
            end;

        1:  // EnumType
            begin
                et          := TDisplayEnumType( d );

                li := TypeListView.Items.Add;
                li.SubItems.Add( et.F_Name );
                li.SubItems.Add( et.F_Note );
            end;

        2:  // EnumValue
            begin
                ev          := TDisplayEnumValue( d );

                li := ValueListView.Items.Add;
                li.SubItems.Add( ev.F_EnumName );
                li.SubItems.Add( ev.F_Order );
                li.SubItems.Add( ev.F_Value );
                li.SubItems.Add( ev.F_Text );
                li.SubItems.Add( ev.F_Arrtibute );
                li.SubItems.Add( ev.F_Tag );
            end;

        3:
            begin
                dd := TDisplayDspSettings( d );

                li := ColorListView.Items.Add;
                li.SubItems.Add( dd.F_ValueId );
                li.SubItems.Add( dd.F_Value );
                li.SubItems.Add( dd.F_Order );
                li.SubItems.Add( dd.F_Note );
            end;

        end;

    end;

end;

end.



(*

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColorSetForm.MakePanel;
var
    ed : TScreenPanel;
    {index, }i : integer;
    t : array [0..3] of integer;
    d : TDisplayDb;
    dd : TDisplayDspSettings;
    ms : TDisplayMessage;
    et : TDisplayEnumType;
    ev : TDisplayEnumValue;

begin

//    index := 0;
    t[0] := 2 - MESScrollBox.VertScrollBar.Position;
    t[1] := 2 - ETScrollBox.VertScrollBar.Position;
    t[2] := 2 - EVScrollBox.VertScrollBar.Position;
    t[3] := 2 - ScrollBox.VertScrollBar.Position;

    for i:=0 to FWorkList.Count-1 do begin

        d := FWorkList.Data[i];

        case d.FDataType of
        0:  // MEESAGE
            begin
                ed          := TScreenPanel.Create( MESScrollBox );
                ed.Parent   := MESScrollBox;
                ed.Left     := 2;
                ed.Top      := t[0];
                ed.Width    := MESScrollBox.Width - 32;
                ed.Height   := 30;
                ed.Tag      := i;
                ed.DispMode := 2;

                ms          := TDisplayMessage( d );
                ed.Title    := ms.F_MessageCode;
                ed.SubTitle := ms.F_Message;
                ed.Memo     := ms.F_Memo;
                ed.ID       := ms.F_Id;

                ed.OnClick  := EditPanelClick;

                FMessageList.Add( ed );

                t[0] := t[0] + ed.Height + 2;
            end;

        1:  // EnumType
            begin
                ed          := TScreenPanel.Create( ETScrollBox );
                ed.Parent   := ETScrollBox;
                ed.Left     := 2;
                ed.Top      := t[1];
                ed.Width    := ETScrollBox.Width - 32;
                ed.Height   := 30;
                ed.Tag      := i;
                ed.DispMode := 1;

                et          := TDisplayEnumType( d );
                ed.Title    := et.F_Name;
                ed.SubTitle := et.F_Note;
                ed.Memo     := '';

                ed.OnClick  := EditPanelClick;

                FEnumTypeList.Add( ed );

                t[1] := t[1] + ed.Height + 2;
            end;

        2:  // EnumValue
            begin
                ed          := TScreenPanel.Create( EVScrollBox );
                ed.Parent   := EVScrollBox;
                ed.Left     := 2;
                ed.Top      := t[2];
                ed.Width    := EVScrollBox.Width - 32;
                ed.Height   := 30;
                ed.Tag      := i;
                ed.DispMode := 1;

                ev          := TDisplayEnumValue( d );
                ed.Title    := ev.F_EnumName;
                ed.SubTitle := ev.F_Value;
                ed.Memo     := ev.F_Text;

                ed.OnClick  := EditPanelClick;

                FEnumValueList.Add( ed );

                t[2] := t[2] + ed.Height + 2;
            end;

        3:
            begin
                ed          := TScreenPanel.Create( ScrollBox );
                ed.Parent   := ScrollBox;
                ed.Left     := 2;
                ed.Top      := t[3];
                ed.Width    := ScrollBox.Width - 32;
                ed.Height   := 30;
                ed.Tag      := i;
                ed.DispMode := 1;

                dd := TDisplayDspSettings( d );
                ed.Title    := dd.F_ValueId;
                ed.SubTitle := dd.F_Value;
                ed.Memo     := dd.F_Note;

                ed.OnClick  := EditPanelClick;

                FPanelList.Add( ed );

                t[3] := t[3] + ed.Height + 2;
            end;

        end;

    end;

end;
*)
