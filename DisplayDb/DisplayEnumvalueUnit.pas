unit DisplayEnumvalueUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TDisplayEnumvalueForm = class(TForm)
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
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
  private
    procedure   SetData( s : TDisplayEnumvalue );
    procedure   GetData( s : TDisplayEnumvalue );

  public
    { Public êÈåæ }

    function Start( s : TDisplayEnumvalue ) : Boolean;
  end;

var
  DisplayEnumvalueForm: TDisplayEnumvalueForm;

implementation

{$R *.dfm}


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TDisplayEnumvalueForm.Start( s : TDisplayEnumvalue ) : Boolean;
begin
    Result := False;

//    Label1.Caption  := IntToStr( s.F_Id );

    // ê›íËílìWäJ
    SetData( s );

    if mrOK <> ShowModal then Exit;

    // ê›íËíläiî[
    GetData( s );

    Result := True;

end;

//-----------------------------------------------------------------------------
//  ê›íËílìWäJ
//-----------------------------------------------------------------------------
procedure TDisplayEnumvalueForm.SetData( s : TDisplayEnumvalue );
begin
    CheckBox1.Checked   := s.E_EnumName;
    Edit1.Text          := s.F_EnumName;

    CheckBox2.Checked   := s.E_Value;
    Edit2.Text          := s.F_Value;

    CheckBox3.Checked   := s.E_Order;
    Edit3.Text          := s.F_Order;

    CheckBox4.Checked   := s.E_Text;
    Edit4.Text          := s.F_Text;

    CheckBox5.Checked   := s.E_Arrtibute;
    Edit5.Text          := s.F_Arrtibute;

    CheckBox6.Checked   := s.E_Tag;
    Edit6.Text          := s.F_Tag;

    CheckBox6.Checked   := s.E_Tag;
    Edit6.Text          := s.F_Tag;

    CheckBox7.Checked   := s.E_IsHidden;
    Edit7.Text          := s.F_IsHidden;


end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TDisplayEnumvalueForm.GetData( s : TDisplayEnumvalue );
begin

    s.E_EnumName    := CheckBox1.Checked;
    s.F_EnumName    := Edit1.Text;

    s.E_Value       := CheckBox2.Checked;
    s.F_Value       := Edit2.Text;

    s.E_Order       := CheckBox3.Checked;
    s.F_Order       := Edit3.Text;

    s.E_Text        := CheckBox4.Checked;
    s.F_Text        := Edit4.Text;

    s.E_Arrtibute   := CheckBox5.Checked;
    s.F_Arrtibute   := Edit5.Text;

    s.E_Tag         := CheckBox6.Checked;
    s.F_Tag         := Edit6.Text;

    s.E_IsHidden    := CheckBox7.Checked;
    s.F_IsHidden    := Edit7.Text;

end;

end.

