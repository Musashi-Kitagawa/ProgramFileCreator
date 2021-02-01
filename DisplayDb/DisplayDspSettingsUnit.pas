unit DisplayDspSettingsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TDisplayDspSettingsForm = class(TForm)
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
    procedure   SetData( s : TDisplayDspSettings );
    procedure   GetData( s : TDisplayDspSettings );

  public
    { Public êÈåæ }

    function Start( s : TDisplayDspSettings ) : Boolean;
  end;

var
  DisplayDspSettingsForm: TDisplayDspSettingsForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TDisplayDspSettingsForm.Start( s : TDisplayDspSettings ) : Boolean;
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
procedure TDisplayDspSettingsForm.SetData( s : TDisplayDspSettings );
begin
    CheckBox1.Checked   := s.E_ValueId;
    Edit1.Text          := s.F_ValueId;

    CheckBox2.Checked   := s.E_Value;
    Edit2.Text          := s.F_Value;

    CheckBox3.Checked   := s.E_Order;
    Edit3.Text          := s.F_Order;

    CheckBox4.Checked   := s.E_Note;
    Edit4.Text          := s.F_Note;
end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TDisplayDspSettingsForm.GetData( s : TDisplayDspSettings );
begin

    s.E_ValueId     := CheckBox1.Checked;
    s.F_ValueId     := Edit1.Text;

    s.E_Value       := CheckBox2.Checked;
    s.F_Value       := Edit2.Text;

    s.E_Order       := CheckBox3.Checked;
    s.F_Order       := Edit3.Text;

    s.E_Note        := CheckBox4.Checked;
    s.F_Note        := Edit4.Text;

end;

end.
