unit DisplayEnumTypeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TDisplayEnumTypeForm = class(TForm)
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    CheckBox2: TCheckBox;
    Edit2: TEdit;
  private
    procedure   SetData( s : TDisplayEnumType );
    procedure   GetData( s : TDisplayEnumType );

  public
    { Public êÈåæ }

    function Start( s : TDisplayEnumType ) : Boolean;
  end;

var
  DisplayEnumTypeForm: TDisplayEnumTypeForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TDisplayEnumTypeForm.Start( s : TDisplayEnumType ) : Boolean;
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
procedure TDisplayEnumTypeForm.SetData( s : TDisplayEnumType );
begin
    CheckBox1.Checked   := s.E_Name;
    Edit1.Text          := s.F_Name;

    CheckBox2.Checked   := s.E_Note;
    Edit2.Text          := s.F_Note;
end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TDisplayEnumTypeForm.GetData( s : TDisplayEnumType );
begin

    s.E_Name        := CheckBox1.Checked;
    s.F_Name        := Edit1.Text;

    s.E_Note        := CheckBox2.Checked;
    s.F_Note        := Edit2.Text;

end;

end.


