unit UiContentUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
//
    ScreenDbUnit;

type
  TUiContentForm = class(TForm)
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    Edit2: TEdit;
    CheckBox3: TCheckBox;
    Edit3: TEdit;
    CheckBox4: TCheckBox;
    Edit4: TEdit;
    CheckBox5: TCheckBox;
    Edit5: TEdit;
    CheckBox6: TCheckBox;
    Edit6: TEdit;
    CheckBox7: TCheckBox;
    Edit7: TEdit;
    CheckBox8: TCheckBox;
    Edit8: TEdit;
    CheckBox9: TCheckBox;
    Edit9: TEdit;
    CheckBox10: TCheckBox;
    Edit10: TEdit;
    CheckBox11: TCheckBox;
    Edit11: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    Label2: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit12: TEdit;
    Label1: TLabel;
  private
    { Private êÈåæ }

    procedure   SetData( c : TUiContent );
    procedure   GetData( c : TUiContent );

  public
    { Public êÈåæ }

    function Start( c : TUiContent ) : Boolean;

  end;

var
  UiContentForm: TUiContentForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiContentForm.Start( c : TUiContent ) : Boolean;
begin
    Result := False;

    // ê›íËílìWäJ
    SetData( c );

    if mrOK <> ShowModal then Exit;

    // ê›íËíläiî[
    GetData( c );

    Result := True;

end;

//-----------------------------------------------------------------------------
//  ê›íËílìWäJ
//-----------------------------------------------------------------------------
procedure TUiContentForm.SetData( c : TUiContent );
begin

    Edit12.Text         := IntToStr( c.F_Id );

    CheckBox1.Checked   := c.E_FrameId;
    Edit1.Text          := c.F_FrameId;

    CheckBox2.Checked   := c.E_Text;
    Edit2.Text          := c.F_Text;

    CheckBox3.Checked   := c.E_UiType;
    Edit3.Text          := c.F_UiType;

    CheckBox4.Checked   := c.E_Name;
    Edit4.Text          := c.F_Name;

    CheckBox5.Checked   := c.E_Attributes;
    Edit5.Text          := c.F_Attributes;

    CheckBox6.Checked   := c.E_Order;
    Edit6.Text          := c.F_Order;

    CheckBox7.Checked   := c.E_Left;
    Edit7.TeXt          := c.F_Left;

    CheckBox8.Checked   := c.E_Width;
    Edit8.Text          := c.F_Width;

    CheckBox9.Checked   := c.E_Top;
    Edit9.Text          := c.F_Top;

    CheckBox10.Checked  := c.E_Height;
    Edit10.Text         := c.F_Height;

    CheckBox11.Checked  := c.E_BorderWidth;
    Edit11.Text         := c.F_BorderWidth;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TUiContentForm.GetData( c : TUiContent );
begin

    c.F_Id          := StrToIntDef( Edit12.Text, 1 );
    c.E_Id          := True;

    c.E_FrameId     := CheckBox1.Checked;
    c.F_FrameId     := Edit1.Text;

    c.E_Text        := CheckBox2.Checked;
    c.F_Text        := Edit2.Text;

    c.E_UiType      := CheckBox3.Checked;
    c.F_UiType      := Edit3.Text;

    c.E_Name        := CheckBox4.Checked;
    c.F_Name        := Edit4.Text;

    c.E_Attributes  := CheckBox5.Checked;
    c.F_Attributes  := Edit5.Text;

    c.E_Order       := CheckBox6.Checked;
    c.F_Order       := Edit6.Text;

    c.E_Left        := CheckBox7.Checked;
    c.F_Left        := Edit7.Text;

    c.E_Width       := CheckBox8.Checked;
    c.F_Width       := Edit8.Text;

    c.E_Top         := CheckBox9.Checked;
    c.F_Top         := Edit9.Text;

    c.E_Height      := CheckBox10.Checked;
    c.F_Height      := Edit10.Text;

    c.E_BorderWidth := CheckBox11.Checked;
    c.F_BorderWidth := Edit11.Text;

end;


end.
