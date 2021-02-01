unit UiPanelSrcButtonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TUiPanelSrcButtonForm = class(TForm)
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    IDEdit: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
  private

    procedure   SetData( s : TUiPanelSrcButton );
    procedure   GetData( s : TUiPanelSrcButton );

  public
    { Public êÈåæ }

    function Start( s : TUiPanelSrcButton ) : Boolean;
  end;

var
  UiPanelSrcButtonForm: TUiPanelSrcButtonForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiPanelSrcButtonForm.Start( s : TUiPanelSrcButton ) : Boolean;
begin
    Result := False;

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
procedure TUiPanelSrcButtonForm.SetData( s : TUiPanelSrcButton );
begin

    IDEdit.Text         := IntToStr( s.F_Id );

    CheckBox1.Checked   := s.E_FrameId;
    Edit1.Text          := s.F_FrameId;

    CheckBox2.Checked   := s.E_SrcPortNo;
    Edit2.Text          := s.F_SrcPortNo;

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

    CheckBox8.Checked   := s.E_SystemModeBitMask;
    Edit8.Text          := s.F_SystemModeBitMask;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TUiPanelSrcButtonForm.GetData( s : TUiPanelSrcButton );
begin

    s.F_Id          := StrToIntDef( IDEdit.Text, 1 );
    s.E_Id          := True;

    s.E_FrameId     := CheckBox1.Checked;
    s.F_FrameId     := Edit1.Text;

    s.E_SrcPortNo   := CheckBox2.Checked;
    s.F_SrcPortNo   := Edit2.Text;

    s.E_Order       := CheckBox3.Checked;
    s.F_Order       := Edit3.Text;

    s.E_Left        := CheckBox4.Checked;
    s.F_Left        := Edit4.Text;

    s.E_Width       := CheckBox5.Checked;
    s.F_Width       := Edit5.Text;

    s.E_Top         := CheckBox6.Checked;
    s.F_Top         := Edit6.Text;

    s.E_Height      := CheckBox7.Checked;
    s.F_Height      := Edit7.Text;

    s.E_SystemModeBitMask   := CheckBox8.Checked;
    s.F_SystemModeBitMask   := Edit8.Text;

end;


end.


