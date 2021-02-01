unit SbDeviceTypeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TSbDeviceTypeForm = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label12: TLabel;
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
    OKButton: TButton;
    CancelButton: TButton;
    Edit17: TEdit;
  private
    { Private êÈåæ }
    procedure   SetData( b : TSbDeviceType );
    procedure   GetData( b : TSbDeviceType );

  public
    { Public êÈåæ }

    function Start( b : TSbDeviceType ) : Boolean;

  end;

var
  SbDeviceTypeForm: TSbDeviceTypeForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDeviceTypeForm.Start( b : TSbDeviceType ) : Boolean;
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
procedure TSbDeviceTypeForm.SetData( b : TSbDeviceType );
begin
    Edit17.Text             := b.F_Id;

    CheckBox1.Checked       := b.E_Name;
    Edit1.Text              := b.F_Name;

    CheckBox2.Checked       := b.E_PanelTypeId;
    Edit2.Text              := b.F_PanelTypeId;

    CheckBox3.Checked       := b.E_IsSubnetControllable;
    Edit3.Text              := b.F_IsSubnetControllable;

    CheckBox4.Checked       := b.E_IsSoapSupported;
    Edit4.Text              := b.F_IsSoapSupported;

    CheckBox5.Checked       := b.E_IsNsbusDevice;
    Edit5.Text              := b.F_IsNsbusDevice;

    CheckBox6.Checked       := b.E_IsPanelTypeVisible;
    Edit6.Text              := b.F_IsPanelTypeVisible;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TSbDeviceTypeForm.GetData( b : TSbDeviceType );
begin

    b.F_Id                      := Edit17.Text;

    b.E_Name                    := CheckBox1.Checked;
    b.F_Name                    := Edit1.Text;

    b.E_PanelTypeId             := CheckBox2.Checked;
    b.F_PanelTypeId             := Edit2.Text;

    b.E_IsSubnetControllable    := CheckBox3.Checked;
    b.F_IsSubnetControllable    := Edit3.Text;

    b.E_IsSoapSupported         := CheckBox4.Checked;
    b.F_IsSoapSupported         := Edit4.Text;

    b.E_IsNsbusDevice           := CheckBox5.Checked;
    b.F_IsNsbusDevice           := Edit5.Text;

    b.E_IsPanelTypeVisible      := CheckBox6.Checked;
    b.F_IsPanelTypeVisible      := Edit6.Text;

end;


end.

