unit UiFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
//
    ScreenDbUnit;

type
  TUiFrameForm = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    CheckBox3: TCheckBox;
    Edit2: TEdit;
    CheckBox4: TCheckBox;
    Edit3: TEdit;
    CheckBox5: TCheckBox;
    Edit4: TEdit;
    CheckBox6: TCheckBox;
    Edit5: TEdit;
    CheckBox7: TCheckBox;
    Edit6: TEdit;
    CheckBox8: TCheckBox;
    Edit7: TEdit;
    CheckBox9: TCheckBox;
    Edit8: TEdit;
    CheckBox10: TCheckBox;
    Edit9: TEdit;
    CheckBox11: TCheckBox;
    Edit10: TEdit;
    CheckBox12: TCheckBox;
    Edit11: TEdit;
    CheckBox13: TCheckBox;
    Edit12: TEdit;
    CheckBox14: TCheckBox;
    Edit13: TEdit;
    CheckBox15: TCheckBox;
    Edit14: TEdit;
    CheckBox16: TCheckBox;
    Edit15: TEdit;
    CheckBox17: TCheckBox;
    Edit16: TEdit;
    CheckBox18: TCheckBox;
    Edit17: TEdit;
    CheckBox19: TCheckBox;
    Edit18: TEdit;
    CheckBox20: TCheckBox;
    Edit19: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    Edit20: TEdit;
    Label2: TLabel;
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
    Label16: TLabel;
    Edit21: TEdit;
    Label1: TLabel;
    Label17: TLabel;
  private
    { Private êÈåæ }

    procedure   SetData( u : TUiFrame );
    procedure   GetData( u : TUiFrame );

  public
    { Public êÈåæ }

    function Start( u : TUiFrame ) : Boolean;

    { Public êÈåæ }
  end;

var
  UiFrameForm: TUiFrameForm;

implementation

{$R *.dfm}


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiFrameForm.Start( u : TUiFrame ) : Boolean;
begin
    Result := False;

    // ê›íËílìWäJ
    SetData( u );

    if mrOK <> ShowModal then Exit;

    // ê›íËíläiî[
    GetData( u );

    Result := True;

end;

//-----------------------------------------------------------------------------
//  ê›íËílìWäJ
//-----------------------------------------------------------------------------
procedure TUiFrameForm.SetData( u : TUiFrame );
begin

    Edit21.Text         := IntToStr( u.F_Id );

    CheckBox1.Checked   := u.E_Note;
    Edit1.Text          := u.F_Note;

    CheckBox2.Checked   := u.E_ParentFrameId;
    Edit2.Text          := u.F_ParentFrameId;

    CheckBox3.Checked   := u.E_TitleText;
    Edit3.Text          := u.F_TitleText;

    CheckBox4.Checked   := u.E_TitleBarHeightPix;
    Edit4.Text          := u.F_TitleBarHeightPix;

    CheckBox5.Checked   := u.E_TitleBarVisible;
    Edit5.Text          := u.F_TitleBarVisible;

    CheckBox6.Checked   := u.E_BackColor;
    Edit6.Text          := u.F_BackColor;

    CheckBox7.Checked   := u.E_Type;
    Edit7.Text          := u.F_Type;

    CheckBox8.Checked   := u.E_Name;
    Edit8.Text          := u.F_Name;

    CheckBox9.Checked   := u.E_Attribute;
    Edit9.Text          := u.F_Attribute;

    CheckBox10.Checked   := u.E_ColCount;
    Edit10.Text          := u.F_ColCount;

    CheckBox11.Checked   := u.E_RowCount;
    Edit11.Text          := u.F_RowCount;

    CheckBox12.Checked   := u.E_IsModal;
    Edit12.Text          := u.F_IsModal;

    CheckBox13.Checked   := u.E_Order;
    Edit13.Text          := u.F_Order;

    CheckBox14.Checked   := u.E_InnerOrder;
    Edit14.Text          := u.F_InnerOrder;

    CheckBox15.Checked   := u.E_Left;
    Edit15.Text          := u.F_Left;

    CheckBox16.Checked   := u.E_Width;
    Edit16.Text          := u.F_Width;

    CheckBox17.Checked   := u.E_Top;
    Edit17.Text          := u.F_Top;

    CheckBox18.Checked   := u.E_Height;
    Edit18.Text          := u.F_Height;

    CheckBox19.Checked   := u.E_BorderWidth;
    Edit19.Text          := u.F_BorderWidth;

    CheckBox20.Checked   := u.E_BorderColor;
    Edit20.Text          := u.F_BorderColor;


end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TUiFrameForm.GetData( u : TUiFrame );
begin
    u.F_Id                  := StrToIntDef( Edit21.Text, 1 );
    u.E_Id                  := True;

    u.E_Note                := CheckBox1.Checked;
    u.F_Note                := Edit1.Text;

    u.E_ParentFrameId       := CheckBox2.Checked;
    u.F_ParentFrameId       := Edit2.Text;

    u.E_TitleText           := CheckBox3.Checked;
    u.F_TitleText           := Edit3.Text;

    u.E_TitleBarHeightPix   := CheckBox4.Checked;
    u.F_TitleBarHeightPix   := Edit4.Text;

    u.E_TitleBarVisible     := CheckBox5.Checked;
    u.F_TitleBarVisible     := Edit5.Text;

    u.E_BackColor           := CheckBox6.Checked;
    u.F_BackColor           := Edit6.Text;

    u.E_Type                := CheckBox7.Checked;
    u.F_Type                := Edit7.Text;

    u.E_Name                := CheckBox8.Checked;
    u.F_Name                := Edit8.Text;

    u.E_Attribute           := CheckBox9.Checked;
    u.F_Attribute           := Edit9.Text;

    u.E_ColCount            := CheckBox10.Checked;
    u.F_ColCount            := Edit10.Text;

    u.E_RowCount            := CheckBox11.Checked;
    u.F_RowCount            := Edit11.Text;

    u.E_IsModal             := CheckBox12.Checked;
    u.F_IsModal             := Edit12.Text;

    u.E_Order               := CheckBox13.Checked;
    u.F_Order               := Edit13.Text;

    u.E_InnerOrder          := CheckBox14.Checked;
    u.F_InnerOrder          := Edit14.Text;

    u.E_Left                := CheckBox15.Checked;
    u.F_Left                := Edit15.Text;

    u.E_Width               := CheckBox16.Checked;
    u.F_Width               := Edit16.Text;

    u.E_Top                 := CheckBox17.Checked;
    u.F_Top                 := Edit17.Text;

    u.E_Height              := CheckBox18.Checked;
    u.F_Height              := Edit18.Text;

    u.E_BorderWidth         := CheckBox19.Checked;
    u.F_BorderWidth         := Edit19.Text;

    u.E_BorderColor         := CheckBox20.Checked;
    u.F_BorderColor         := Edit20.Text;

end;


end.



