unit UiPanelDstButtonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TUiPanelDstButtonForm = class(TForm)
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
    CheckBox8: TCheckBox;
    Edit8: TEdit;
    CheckBox9: TCheckBox;
    Edit9: TEdit;
    Edit10: TEdit;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;

    procedure   SetData( s : TUiPanelDstButton );
    procedure   GetData( s : TUiPanelDstButton );

  public
    { Public �錾 }

    function Start( s : TUiPanelDstButton ) : Boolean;

  end;

var
  UiPanelDstButtonForm: TUiPanelDstButtonForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiPanelDstButtonForm.Start( s : TUiPanelDstButton ) : Boolean;
begin
    Result := False;

    // �ݒ�l�W�J
    SetData( s );

    if mrOK <> ShowModal then Exit;

    // �ݒ�l�i�[
    GetData( s );

    Result := True;

end;

//-----------------------------------------------------------------------------
//  �ݒ�l�W�J
//-----------------------------------------------------------------------------
procedure TUiPanelDstButtonForm.SetData( s : TUiPanelDstButton );
begin
    Edit10.Text         := IntToStr( s.F_Id );

    CheckBox1.Checked   := s.E_FrameId;
    Edit1.Text          := s.F_FrameId;

    CheckBox2.Checked   := s.E_DstPortNo;
    Edit2.Text          := s.F_DstPortNo;

    CheckBox3.Checked   := s.E_Order;
    Edit3.Text          := s.F_Order;

    CheckBox4.Checked   := s.E_Left;
    Edit4.Text          := s.F_Left;

    CheckBox5.Checked   := s.E_Width;
    Edit5.Text          := s.F_Width;

    CheckBox6.Checked   := s.E_Top;
    Edit6.Text          := s.F_Top;

    CheckBox7.Checked   := s.E_Height;
    Edit7.Text          := s.F_Height;

    CheckBox8.Checked   := s.E_BorderWidth;
    Edit8.Text          := s.F_BorderWidth;

    CheckBox9.Checked   := s.E_SystemModeBitMask;
    Edit9.Text          := s.F_SystemModeBitMask;

end;

//-----------------------------------------------------------------------------
//  �ݒ�l�i�[
//-----------------------------------------------------------------------------
procedure TUiPanelDstButtonForm.GetData( s : TUiPanelDstButton );
begin

    s.F_Id              := StrToIntDef( Edit10.Text, 1 );
    s.E_Id              := True;

    s.E_FrameId         := CheckBox1.Checked;
    s.F_FrameId         := Edit1.Text;

    s.E_DstPortNo       := CheckBox2.Checked;
    s.F_DstPortNo       := Edit2.Text;

    s.E_Order           := CheckBox3.Checked;
    s.F_Order           := Edit3.Text;

    s.E_Left            := CheckBox4.Checked;
    s.F_Left            := Edit4.Text;

    s.E_Width           := CheckBox5.Checked;
    s.F_Width           := Edit5.Text;

    s.E_Top             := CheckBox6.Checked;
    s.F_Top             := Edit6.Text;

    s.E_Height          := CheckBox7.Checked;
    s.F_Height          := Edit7.Text;

    s.E_BorderWidth     := CheckBox8.Checked;
    s.F_BorderWidth     := Edit8.Text;

    s.E_SystemModeBitMask   := CheckBox9.Checked;
    s.F_SystemModeBitMask   := Edit9.Text;

end;


end.
