unit DisplayDbUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Contnrs,
//
    ScreenDbUnit, Vcl.StdCtrls, MusFlatButton, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TDisplayDBForm = class(TForm)
    PageControl: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    MessListView: TListView;
    TypeListView: TListView;
    ValueListView: TListView;
    ColorListView: TListView;
    procedure FormCreate(Sender: TObject);
    procedure MessListViewDblClick(Sender: TObject);
  private
    { Private 宣言 }

    FWorkList   : TDisplayList;

    procedure   MakeList;

  public
    { Public 宣言 }

    procedure   Start( lst : TDisplayList );

  end;

var
  DisplayDBForm: TDisplayDBForm;

implementation

{$R *.dfm}

uses
    DisplayDspSettingsUnit, DisplayMessageUnit, DisplayEnumTypeUnit, DisplayEnumvalueUnit;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TDisplayDBForm.FormCreate(Sender: TObject);
begin
    PageControl.ActivePageIndex := 0;;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TDisplayDBForm.Start( lst : TDisplayList );
begin
    MessListView.Items.Clear;
    TypeListView.Items.Clear;
    ValueListView.Items.Clear;
    ColorListView.Items.Clear;

    FWorkList   := lst;

    MakeList;

    Show;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TDisplayDBForm.MakeList;
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
                li.SubItems.Add( ev.F_IsHidden );
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

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TDisplayDBForm.MessListViewDblClick(Sender: TObject);
var
    ms : TDisplayMessage;
    ev : TDisplayEnumvalue;
    et : TDisplayEnumType;
    ds : TDisplayDspSettings;
    id, v : string;

begin

    case PageControl.ActivePageIndex of
    TDisplayDb.typeMessage:  // MESSAGE
        begin
            if nil = MessListView.Selected then Exit;

            id := MessListView.Items[ MessListView.Selected.Index ].SubItems[0];
            ms := TDisplayMessage( FWorkList.Search( TDisplayDb.typeMessage, id ) );

            if nil <> ms then
                DisplayMessageForm.Start( ms );
        end;

    TDisplayDb.typeEnumType:  // ENUM TYPE
        begin
            if nil = TypeListView.Selected then Exit;

            id := TypeListView.Items[ TypeListView.Selected.Index ].SubItems[0];
            et := TDisplayEnumType( FWorkList.Search( TDisplayDb.typeEnumType, id ) );

            if nil <> et then
                DisplayEnumTypeForm.Start( et );
        end;

    TDisplayDb.typeEnumValue:  // ENUM VALUE
        begin
            if nil = ValueListView.Selected then Exit;

            id  := ValueListView.Items[ ValueListView.Selected.Index ].SubItems[0];
            v   := ValueListView.Items[ ValueListView.Selected.Index ].SubItems[2];
            ev := TDisplayEnumvalue( FWorkList.Search( TDisplayDb.typeEnumValue, (id + ' ' + v) ) );

            if nil <> ev then
                DisplayEnumvalueForm.Start( ev );
        end;

    TDisplayDb.typeSetting:  // DISPLAY SETTING
        begin
            if nil = ColorListView.Selected then Exit;

            id := ColorListView.Items[ ColorListView.Selected.Index ].SubItems[0];
            ds := TDisplayDspSettings( FWorkList.Search( TDisplayDb.typeSetting, id ) );

            if nil <> ds then
                DisplayDspSettingsForm.Start( ds );
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

(*
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TDisplayDBForm.ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
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
*)

