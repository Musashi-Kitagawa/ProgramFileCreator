unit SbDeviceUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;


type
  TSbDeviceForm = class(TForm)
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
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
    CheckBox12: TCheckBox;
    Edit12: TEdit;
    CheckBox13: TCheckBox;
    Edit13: TEdit;
    CheckBox14: TCheckBox;
    Edit14: TEdit;
    CheckBox15: TCheckBox;
    Edit15: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    CheckBox16: TCheckBox;
    Edit16: TEdit;
    Edit17: TEdit;
  private
    { Private êÈåæ }
    procedure   SetData( b : TSbDevice );
    procedure   GetData( b : TSbDevice );

  public
    { Public êÈåæ }

    function Start( b : TSbDevice ) : Boolean;

  end;

var
  SbDeviceForm: TSbDeviceForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDeviceForm.Start( b : TSbDevice ) : Boolean;
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
procedure TSbDeviceForm.SetData( b : TSbDevice );
begin
    Edit17.Text             := b.F_Id;

    CheckBox1.Checked       := b.E_StationId;
    Edit1.Text              := b.F_StationId;

    CheckBox2.Checked       := b.E_TypeName;
    Edit2.Text              := b.F_TypeName;

    CheckBox3.Checked       := b.E_Name;
    Edit3.Text              := b.F_Name;

    CheckBox4.Checked       := b.E_IpAddress;
    Edit4.Text              := b.F_IpAddress;

    CheckBox5.Checked       := b.E_TimeoutMsec;
    Edit5.Text              := b.F_TimeoutMsec;

    CheckBox6.Checked       := b.E_IsSendTarget;
    Edit6.Text              := b.F_IsSendTarget;

    CheckBox7.Checked       := b.E_IsRecvTarget;
    Edit7.Text              := b.F_IsRecvTarget;

    CheckBox8.Checked       := b.E_IsKeyAssign;
    Edit8.Text              := b.F_IsKeyAssign;

    CheckBox9.Checked       := b.E_KeyAssignPageCount;
    Edit9.Text              := b.F_KeyAssignPageCount;

    CheckBox10.Checked      := b.E_IsEditLocked;
    Edit10.Text             := b.F_IsEditLocked;

    CheckBox11.Checked      := b.E_DeviceCategoryName;
    Edit11.Text             := b.F_DeviceCategoryName;

    CheckBox12.Checked      := b.E_IsNsbusDevice;
    Edit12.Text             := b.F_IsNsbusDevice;

    CheckBox13.Checked      := b.E_Is4kHdChangeSendTarget;
    Edit13.Text             := b.F_Is4kHdChangeSendTarget;

    CheckBox14.Checked      := b.E_ParentStationId;
    Edit14.Text             := b.F_ParentStationId;

    CheckBox15.Checked      := b.E_Attribute;
    Edit15.Text             := b.F_Attribute;

    CheckBox16.Checked      := b.E_SentSystemMode;
    Edit16.Text             := b.F_SentSystemMode;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TSbDeviceForm.GetData( b : TSbDevice );
begin

    b.F_Id                      := Edit17.Text;

    b.E_StationId               := CheckBox1.Checked;
    b.F_StationId               := Edit1.Text;

    b.E_TypeName                := CheckBox2.Checked;
    b.F_TypeName                := Edit2.Text;

    b.E_Name                    := CheckBox3.Checked;
    b.F_Name                    := Edit3.Text;

    b.E_IpAddress               := CheckBox4.Checked;
    b.F_IpAddress               := Edit4.Text;

    b.E_TimeoutMsec             := CheckBox5.Checked;
    b.F_TimeoutMsec             := Edit5.Text;

    b.E_IsSendTarget            := CheckBox6.Checked;
    b.F_IsSendTarget            := Edit6.Text;

    b.E_IsRecvTarget            := CheckBox7.Checked;
    b.F_IsRecvTarget            := Edit7.Text;

    b.E_IsKeyAssign             := CheckBox8.Checked;
    b.F_IsKeyAssign             := Edit8.Text;

    b.E_KeyAssignPageCount      := CheckBox9.Checked;
    b.F_KeyAssignPageCount      := Edit9.Text;

    b.E_IsEditLocked            := CheckBox10.Checked;
    b.F_IsEditLocked            := Edit10.Text;

    b.E_DeviceCategoryName      := CheckBox11.Checked;
    b.F_DeviceCategoryName      := Edit11.Text;

    b.E_IsNsbusDevice           := CheckBox12.Checked;
    b.F_IsNsbusDevice           := Edit12.Text;

    b.E_Is4kHdChangeSendTarget  := CheckBox13.Checked;
    b.F_Is4kHdChangeSendTarget  := Edit13.Text;

    b.E_ParentStationId         := CheckBox14.Checked;
    b.F_ParentStationId         := Edit14.Text;

    b.E_Attribute               := CheckBox15.Checked;
    b.F_Attribute               := Edit15.Text;

    b.E_SentSystemMode          := CheckBox16.Checked;
    b.F_SentSystemMode          := Edit16.Text;

end;


end.
