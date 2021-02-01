unit ScreenButtonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
//
    ScreenDbUnit;

type
  TScreenButtonForm = class(TForm)
    Label1: TLabel;
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
    CheckBox10: TCheckBox;
    F_TopEdit: TEdit;
    CheckBox11: TCheckBox;
    F_HeightEdit: TEdit;
    CheckBox12: TCheckBox;
    F_BorderWidthEdit: TEdit;
    CheckBox13: TCheckBox;
    F_IncludeHeadbarEdit: TEdit;
    CheckBox14: TCheckBox;
    F_HeadbarColorEdit: TEdit;
    CheckBox15: TCheckBox;
    F_HeadbarHeightEdit: TEdit;
    CheckBox16: TCheckBox;
    F_HeadbarTextEdit: TEdit;
    CheckBox17: TCheckBox;
    F_HeadbarFontSizeEdit: TEdit;
    CheckBox18: TCheckBox;
    F_IsPermissionHandledEdit: TEdit;
    CheckBox19: TCheckBox;
    F_IsSelectionCancelEdit: TEdit;
    CheckBox20: TCheckBox;
    F_FontSizeEdit: TEdit;
    CheckBox21: TCheckBox;
    F_IsDisabledEdit: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    CheckBox22: TCheckBox;
    Edit2: TEdit;
  private
    { Private êÈåæ }

    procedure   SetData( b : TUiScreenSelectButton );
    procedure   GetData( b : TUiScreenSelectButton );

  public
    { Public êÈåæ }

    function Start( b : TUiScreenSelectButton ) : Boolean;

  end;

var
  ScreenButtonForm: TScreenButtonForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TScreenButtonForm.Start( b : TUiScreenSelectButton ) : Boolean;
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
procedure TScreenButtonForm.SetData( b : TUiScreenSelectButton );
begin

    Edit1.Text                  := IntToStr( b.F_Id );

    CheckBox1.Checked           := b.E_FrameId;
    F_FrameIdEdit.Text          := b.F_FrameId;

    CheckBox2.Checked           := b.E_Text;
    F_TextEdit.Text             := b.F_Text;

    CheckBox3.Checked           := b.E_Key;
    F_KeyEdit.Text              := b.F_Key;

    CheckBox4.Checked           := b.E_FrameName;
    F_FrameNameEdit.Text        := b.F_FrameName;

    CheckBox5.Checked           := b.E_BeforeRelayKey;
    F_BeforeRelayKeyEdit.Text   := b.F_BeforeRelayKey;

    CheckBox6.Checked           := b.E_Attributes;
    F_AttributesEdit.Text       := b.F_Attributes;

    CheckBox7.Checked           := b.E_Order;
    F_OrderEdit.Text            := b.F_Order;

    CheckBox8.Checked           := b.E_Left;
    F_LeftEdit.Text             := b.F_Left;

    CheckBox9.Checked           := b.E_Width;
    F_WidthEdit.Text            := b.F_Width;

    CheckBox10.Checked          := b.E_Top;
    F_TopEdit.Text              := b.F_Top;

    CheckBox11.Checked          := b.E_Height;
    F_HeightEdit.Text           := b.F_Height;

    CheckBox12.Checked              := b.E_BorderWidth;
    F_BorderWidthEdit.Text          := b.F_BorderWidth;

    CheckBox13.Checked              := b.E_IncludeHeadbar;
    F_IncludeHeadbarEdit.Text       := b.F_IncludeHeadbar;

    CheckBox14.Checked              := b.E_HeadbarColor;
    F_HeadbarColorEdit.Text         := b.F_HeadbarColor;

    CheckBox15.Checked              := b.E_HeadbarHeight;
    F_HeadbarHeightEdit.Text        := b.F_HeadbarHeight;

    CheckBox16.Checked              := b.E_HeadbarText;
    F_HeadbarTextEdit.Text          := b.F_HeadbarText;

    CheckBox17.Checked              := b.E_HeadbarFontSize;
    F_HeadbarFontSizeEdit.Text      := b.F_HeadbarFontSize;

    CheckBox18.Checked              := b.E_IsPermissionHandled;
    F_IsPermissionHandledEdit.Text  := b.F_IsPermissionHandled;

    CheckBox19.Checked              := b.E_IsSelectionCancel;
    F_IsSelectionCancelEdit.Text    := b.F_IsSelectionCancel;

    CheckBox20.Checked              := b.E_FontSize;
    F_FontSizeEdit.Text             := b.F_FontSize;

    CheckBox21.Checked              := b.E_IsDisabled;
    F_IsDisabledEdit.Text           := b.F_IsDisabled;

    CheckBox21.Checked              := b.E_IsListItem;
    Edit2.Text                      := b.F_IsListItem;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TScreenButtonForm.GetData( b : TUiScreenSelectButton );
begin

    b.F_Id              := StrToIntDef( Edit1.Text, 1 );
    b.E_Id              := True;

    b.E_FrameId         := CheckBox1.Checked;
    b.F_FrameId         := F_FrameIdEdit.Text;

    b.E_Text            := CheckBox2.Checked;
    b.F_Text            := F_TextEdit.Text;

    b.E_Key             := CheckBox3.Checked;
    b.F_Key             := F_KeyEdit.Text;

    b.E_FrameName       := CheckBox4.Checked;
    b.F_FrameName       := F_FrameNameEdit.Text;

    b.E_BeforeRelayKey  := CheckBox5.Checked;
    b.F_BeforeRelayKey  := F_BeforeRelayKeyEdit.Text;

    b.E_Attributes      := CheckBox6.Checked;
    b.F_Attributes      := F_AttributesEdit.Text;

    b.E_Order           := CheckBox7.Checked;
    b.F_Order           := F_OrderEdit.Text;

    b.E_Left            := CheckBox8.Checked;
    b.F_Left            := F_LeftEdit.Text;

    b.E_Width           := CheckBox9.Checked;
    b.F_Width           := F_WidthEdit.Text;

    b.E_Top             := CheckBox10.Checked;
    b.F_Top             := F_TopEdit.Text;

    b.E_Height          := CheckBox11.Checked;
    b.F_Height          := F_HeightEdit.Text;

    b.E_BorderWidth     := CheckBox12.Checked;
    b.F_BorderWidth     := F_BorderWidthEdit.Text;

    b.E_IncludeHeadbar  := CheckBox13.Checked;
    b.F_IncludeHeadbar  := F_IncludeHeadbarEdit.Text;

    b.E_HeadbarColor    := CheckBox14.Checked;
    b.F_HeadbarColor    := F_HeadbarColorEdit.Text;

    b.E_HeadbarHeight   := CheckBox15.Checked;
    b.F_HeadbarHeight   := F_HeadbarHeightEdit.Text;

    b.E_HeadbarText     := CheckBox16.Checked;
    b.F_HeadbarText     := F_HeadbarTextEdit.Text;

    b.E_HeadbarFontSize := CheckBox17.Checked;
    b.F_HeadbarFontSize := F_HeadbarFontSizeEdit.Text;

    b.E_IsPermissionHandled := CheckBox18.Checked;
    b.F_IsPermissionHandled := F_IsPermissionHandledEdit.Text;

    b.E_IsSelectionCancel   := CheckBox19.Checked;
    b.F_IsSelectionCancel   := F_IsSelectionCancelEdit.Text;

    b.E_FontSize        := CheckBox20.Checked;
    b.F_FontSize        := F_FontSizeEdit.Text;

    b.E_IsDisabled      := CheckBox21.Checked;
    b.F_IsDisabled      := F_IsDisabledEdit.Text;

    b.E_IsListItem      := CheckBox21.Checked;
    b.F_IsListItem      := Edit2.Text;

end;



end.
