unit DisplayMessageUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TDisplayMessageForm = class(TForm)
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
  private

    procedure   SetData( s : TDisplayMessage );
    procedure   GetData( s : TDisplayMessage );

  public
    { Public êÈåæ }

    function Start( s : TDisplayMessage ) : Boolean;

  end;

var
  DisplayMessageForm: TDisplayMessageForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TDisplayMessageForm.Start( s : TDisplayMessage ) : Boolean;
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
procedure TDisplayMessageForm.SetData( s : TDisplayMessage );
begin
    CheckBox1.Checked   := s.E_Id;
    Edit1.Text          := s.F_Id;

    CheckBox2.Checked   := s.E_MessageCode;
    Edit2.Text          := s.F_MessageCode;

    CheckBox3.Checked   := s.E_Message;
    Edit3.Text          := s.F_Message;

    CheckBox4.Checked   := s.E_Memo;
    Edit4.Text          := s.F_Memo;
end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TDisplayMessageForm.GetData( s : TDisplayMessage );
begin

    s.E_Id              := CheckBox1.Checked;
    s.F_Id              := Edit1.Text;

    s.E_MessageCode     := CheckBox2.Checked;
    s.F_MessageCode     := Edit2.Text;

    s.E_Message         := CheckBox3.Checked;
    s.F_Message         := Edit3.Text;

    s.E_Memo            := CheckBox4.Checked;
    s.F_Memo            := Edit4.Text;

end;


end.


