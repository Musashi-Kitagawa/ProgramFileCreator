unit UiPanelKeyButtonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TUiPanelKeyButtonForm = class(TForm)
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
    CheckBox10: TCheckBox;
    Edit10: TEdit;
    CheckBox11: TCheckBox;
    Edit11: TEdit;
    CheckBox12: TCheckBox;
    Edit12: TEdit;
    Edit13: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
  private
    { Private êÈåæ }

    procedure   SetData( s : TUiPanelKeyButton );
    procedure   GetData( s : TUiPanelKeyButton );

  public
    { Public êÈåæ }

    function Start( s : TUiPanelKeyButton ) : Boolean;

  end;

var
  UiPanelKeyButtonForm: TUiPanelKeyButtonForm;

implementation

{$R *.dfm}


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiPanelKeyButtonForm.Start( s : TUiPanelKeyButton ) : Boolean;
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
procedure TUiPanelKeyButtonForm.SetData( s : TUiPanelKeyButton );
begin

    Edit13.Text         := IntToStr( s.F_Id );

    CheckBox1.Checked   := s.E_FrameId;
    Edit1.Text          := s.F_FrameId;

    CheckBox2.Checked   := s.E_ButtonNo;
    Edit2.Text          := s.F_ButtonNo;

    CheckBox3.Checked   := s.E_DstAssignDisable;
    Edit3.Text          := s.F_DstAssignDisable;

    CheckBox4.Checked   := s.E_SrcAssignDisable;
    Edit4.Text          := s.F_SrcAssignDisable;

    CheckBox5.Checked   := s.E_CopyButtonNo;
    Edit5.Text          := s.F_CopyButtonNo;

    CheckBox6.Checked   := s.E_SyncPageRange;
    Edit6.Text          := s.F_SyncPageRange;

    CheckBox7.Checked   := s.E_DispMode;
    Edit7.Text          := s.F_DispMode;

    CheckBox8.Checked   := s.E_Order;
    Edit8.Text          := s.F_Order;

    CheckBox9.Checked   := s.E_Left;
    Edit9.Text          := s.F_Left;

    CheckBox10.Checked  := s.E_Width;
    Edit10.Text         := s.F_Width;

    CheckBox11.Checked  := s.E_Top;
    Edit11.Text         := s.F_Top;

    CheckBox12.Checked  := s.E_Height;
    Edit12.Text         := s.F_Height;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TUiPanelKeyButtonForm.GetData( s : TUiPanelKeyButton );
begin

    s.F_Id                  := StrToIntDef( Edit13.Text, 1 );
    s.E_Id                  := True;

    s.E_FrameId             := CheckBox1.Checked;
    s.F_FrameId             := Edit1.Text;

    s.E_ButtonNo            := CheckBox2.Checked;
    s.F_ButtonNo            := Edit2.Text;

    s.E_DstAssignDisable    := CheckBox3.Checked;
    s.F_DstAssignDisable    := Edit3.Text;

    s.E_SrcAssignDisable    := CheckBox4.Checked;
    s.F_SrcAssignDisable    := Edit4.Text;

    s.E_CopyButtonNo        := CheckBox5.Checked;
    s.F_CopyButtonNo        := Edit5.Text;

    s.E_SyncPageRange       := CheckBox6.Checked;
    s.F_SyncPageRange       := Edit6.Text;

    s.E_DispMode            := CheckBox7.Checked;
    s.F_DispMode            := Edit7.Text;

    s.E_Order               := CheckBox8.Checked;
    s.F_Order               := Edit8.Text;

    s.E_Left                := CheckBox9.Checked;
    s.F_Left                := Edit9.Text;

    s.E_Width               := CheckBox10.Checked;
    s.F_Width               := Edit10.Text;

    s.E_Top                 := CheckBox11.Checked;
    s.F_Top                 := Edit11.Text;

    s.E_Height              := CheckBox12.Checked;
    s.F_Height              := Edit12.Text;

end;

end.


