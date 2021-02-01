unit UiListCellButtonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TUiListCellButtonForm = class(TForm)
    CheckBox1: TCheckBox;
    F_FrameIdEdit: TEdit;
    CheckBox2: TCheckBox;
    F_TextEdit: TEdit;
    CheckBox3: TCheckBox;
    F_KeyEdit: TEdit;
    CheckBox4: TCheckBox;
    F_FrameNameEdit: TEdit;
    CheckBox5: TCheckBox;
    F_BeforeRelayKeyEdit: TEdit;
    CheckBox6: TCheckBox;
    F_AttributesEdit: TEdit;
    CheckBox7: TCheckBox;
    F_OrderEdit: TEdit;
    CheckBox8: TCheckBox;
    F_LeftEdit: TEdit;
    CheckBox9: TCheckBox;
    F_WidthEdit: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    Label2: TLabel;
    Edit17: TEdit;
    Label8: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox10: TCheckBox;
    Edit10: TEdit;
  private

    procedure   SetData( b : TUiListCellButton );
    procedure   GetData( b : TUiListCellButton );

  public
    { Public êÈåæ }

    function Start( b : TUiListCellButton ) : Boolean;

  end;

var
  UiListCellButtonForm: TUiListCellButtonForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiListCellButtonForm.Start( b : TUiListCellButton ) : Boolean;
begin
    Result := False;

    // ê›íËílìWäJ
    SetData( b );

    if mrOK <> ShowModal then Exit;

    // ê›íËíläiî[
    GetData( b );

    Result := True;

end;

//-----------------------------------------------------------------------------
//  ê›íËílìWäJ
//-----------------------------------------------------------------------------
procedure TUiListCellButtonForm.SetData( b : TUiListCellButton );
begin
    Edit17.Text                 := IntToStr( b.F_Id );

    CheckBox1.Checked           := b.E_ColumnId;
    F_FrameIdEdit.Text          := b.F_ColumnId;

    CheckBox2.Checked           := b.E_Order;
    F_TextEdit.Text             := b.F_Order;

    CheckBox3.Checked           := b.E_Width;
    F_KeyEdit.Text              := b.F_Width;

    CheckBox4.Checked           := b.E_Text;
    F_FrameNameEdit.Text        := b.F_Text;

    CheckBox5.Checked           := b.E_ClickAction;
    F_BeforeRelayKeyEdit.Text   := b.F_ClickAction;

    CheckBox6.Checked           := b.E_IsDefaultRowVisible;
    F_AttributesEdit.Text       := b.F_IsDefaultRowVisible;

    CheckBox7.Checked           := b.E_IsStandartRowVisible;
    F_OrderEdit.Text            := b.F_IsStandartRowVisible;

    CheckBox8.Checked           := b.E_FontSize;
    F_LeftEdit.Text             := b.F_FontSize;

    CheckBox9.Checked           := b.E_IsRowSelectSync;
    F_WidthEdit.Text            := b.F_IsRowSelectSync;

    CheckBox10.Checked          := b.E_HeadbarHeight;
    Edit10.Text                 := b.F_HeadbarHeight;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TUiListCellButtonForm.GetData( b : TUiListCellButton );
begin
    b.F_Id                      := StrToIntDef( Edit17.Text, 1 );
    b.E_Id                      := True;

    b.E_ColumnId                := CheckBox1.Checked;
    b.F_ColumnId                := F_FrameIdEdit.Text;

    b.E_Order                   := CheckBox2.Checked;
    b.F_Order                   := F_TextEdit.Text;

    b.E_Width                   := CheckBox3.Checked;
    b.F_Width                   := F_KeyEdit.Text;

    b.E_Text                    := CheckBox4.Checked;
    b.F_Text                    := F_FrameNameEdit.Text;

    b.E_ClickAction             := CheckBox5.Checked;
    b.F_ClickAction             := F_BeforeRelayKeyEdit.Text;

    b.E_IsDefaultRowVisible     := CheckBox6.Checked;
    b.F_IsDefaultRowVisible     := F_AttributesEdit.Text;

    b.E_IsStandartRowVisible    := CheckBox7.Checked;
    b.F_IsStandartRowVisible    := F_OrderEdit.Text;

    b.E_FontSize                := CheckBox8.Checked;
    b.F_FontSize                := F_LeftEdit.Text;

    b.E_IsRowSelectSync         := CheckBox9.Checked;
    b.F_IsRowSelectSync         := F_WidthEdit.Text;

    b.E_HeadbarHeight           := CheckBox10.Checked;
    b.F_HeadbarHeight           := Edit10.Text;

end;

end.

