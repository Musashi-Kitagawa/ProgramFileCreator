unit SbPanelTypeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
//
    ScreenDbUnit;

type
  TSbPanelTypeForm = class(TForm)
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
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    Label25: TLabel;
    Label26: TLabel;
    Edit28: TEdit;
    Edit29: TEdit;
  private
    { Private êÈåæ }
    procedure   SetData( b : TSbPanelType );
    procedure   GetData( b : TSbPanelType );

  public
    { Public êÈåæ }

    function Start( b : TSbPanelType ) : Boolean;
  end;

var
  SbPanelTypeForm: TSbPanelTypeForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbPanelTypeForm.Start( b : TSbPanelType ) : Boolean;
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
procedure TSbPanelTypeForm.SetData( b : TSbPanelType );
begin

    Edit17.Text             := b.F_Id;

    Edit1.Text              := b.F_Name;
    CheckBox1.Checked       := b.E_Name;

    Edit2.Text              := b.F_Note;
    CheckBox2.Checked       := b.E_Note;

    Edit3.Text              := b.F_UiKey;
    CheckBox3.Checked       := b.E_UiKey;

    Edit4.Text              := b.F_PageCount;
    CheckBox4.Checked       := b.E_PageCount;

    Edit5.Text              := b.F_HasBusNameLabel;
    CheckBox5.Checked       := b.E_HasBusNameLabel;

    Edit6.Text              := b.F_KeyCount;
    CheckBox6.Checked       := b.E_KeyCount;

    Edit7.Text              := b.F_HasControlDst;
    CheckBox7.Checked       := b.E_HasControlDst;

    Edit8.Text              := b.F_CanCdsAssign;
    CheckBox8.Checked       := b.E_CanCdsAssign;

    Edit9.Text              := b.F_CanSrcAssign;
    CheckBox9.Checked       := b.E_CanSrcAssign;

    Edit10.Text             := b.F_CanDstAssign;
    CheckBox10.Checked      := b.E_CanDstAssign;

    Edit11.Text             := b.F_CanFncAssign;
    CheckBox11.Checked      := b.E_CanFncAssign;

    Edit12.Text             := b.F_AssignCancelSrcDstGpSel;
    CheckBox12.Checked      := b.E_AssignCancelSrcDstGpSel;

    Edit13.Text             := b.F_CdsStartBytes;
    CheckBox13.Checked      := b.E_CdsStartBytes;

    Edit14.Text             := b.F_CdsPageByteCount;
    CheckBox14.Checked      := b.E_CdsPageByteCount;

    Edit15.Text             := b.F_CdsIsLitteEndian;
    CheckBox15.Checked      := b.E_CdsIsLitteEndian;

    Edit16.Text             := b.F_SrcStartBytes;
    CheckBox16.Checked      := b.E_SrcStartBytes;

    Edit18.Text             := b.F_SrcPageByteCount;
    CheckBox17.Checked      := b.E_SrcPageByteCount;

    Edit19.Text             := b.F_DstStartBytes;
    CheckBox18.Checked      := b.E_DstStartBytes;

    Edit20.Text             := b.F_DstPageByteCount;
    CheckBox19.Checked      := b.E_DstPageByteCount;

    Edit21.Text             := b.F_IsCdstAutoAssign;
    CheckBox20.Checked      := b.E_IsCdstAutoAssign;

    Edit22.Text             := b.F_CanPageCountSetting;
    CheckBox21.Checked      := b.E_CanPageCountSetting;

    Edit23.Text             := b.F_CanDstAssignEachPages;
    CheckBox22.Checked      := b.E_CanDstAssignEachPages;

    Edit24.Text             := b.F_AvailablePageStartBytes;
    CheckBox23.Checked      := b.E_AvailablePageStartBytes;

    Edit25.Text             := b.F_SrcDstAreaZeroClearDisabled;
    CheckBox24.Checked      := b.E_SrcDstAreaZeroClearDisabled;

    Edit26.Text             := b.F_IsSrcDstBothPanel;
    CheckBox25.Checked      := b.E_IsSrcDstBothPanel;

    Edit27.Text             := b.F_IsManualInputModeSupported;
    CheckBox26.Checked      := b.E_IsManualInputModeSupported;

    Edit28.Text             := b.F_IsOpeMdEnabled;
    CheckBox27.Checked      := b.E_IsOpeMdEnabled;

    Edit29.Text             := b.F_IsOpeBpsEnabled;
    CheckBox28.Checked      := b.E_IsOpeBpsEnabled;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TSbPanelTypeForm.GetData( b : TSbPanelType );
begin

    b.F_Id                          := Edit17.Text;

    b.F_Name                        := Edit1.Text;
    b.E_Name                        := CheckBox1.Checked;

    b.F_Note                        := Edit2.Text;
    b.E_Note                        := CheckBox2.Checked;

    b.F_UiKey                       := Edit3.Text;
    b.E_UiKey                       := CheckBox3.Checked;

    b.F_PageCount                   := Edit4.Text;
    b.E_PageCount                   := CheckBox4.Checked;

    b.F_HasBusNameLabel             := Edit5.Text;
    b.E_HasBusNameLabel             := CheckBox5.Checked;

    b.F_KeyCount                    := Edit6.Text;
    b.E_KeyCount                    := CheckBox6.Checked;

    b.F_HasControlDst               := Edit7.Text;
    b.E_HasControlDst               := CheckBox7.Checked;

    b.F_CanCdsAssign                := Edit8.Text;
    b.E_CanCdsAssign                := CheckBox8.Checked;

    b.F_CanSrcAssign                := Edit9.Text;
    b.E_CanSrcAssign                := CheckBox8.Checked;

    b.F_CanDstAssign                := Edit10.Text;
    b.E_CanDstAssign                := CheckBox10.Checked;

    b.F_CanFncAssign                := Edit11.Text;
    b.E_CanFncAssign                := CheckBox11.Checked;

    b.F_AssignCancelSrcDstGpSel     := Edit12.Text;
    b.E_AssignCancelSrcDstGpSel     := CheckBox12.Checked;

    b.F_CdsStartBytes               := Edit13.Text;
    b.E_CdsStartBytes               := CheckBox13.Checked;

    b.F_CdsPageByteCount            := Edit14.Text;
    b.E_CdsPageByteCount            := CheckBox14.Checked;

    b.F_CdsIsLitteEndian            := Edit15.Text;
    b.E_CdsIsLitteEndian            := CheckBox15.Checked;

    b.F_SrcStartBytes               := Edit16.Text;
    b.E_SrcStartBytes               := CheckBox16.Checked;

    b.F_SrcPageByteCount            := Edit17.Text;
    b.E_SrcPageByteCount            := CheckBox17.Checked;

    b.F_DstStartBytes               := Edit18.Text;
    b.E_DstStartBytes               := CheckBox18.Checked;

    b.F_DstPageByteCount            := Edit19.Text;
    b.E_DstPageByteCount            := CheckBox19.Checked;

    b.F_IsCdstAutoAssign            := Edit20.Text;
    b.E_IsCdstAutoAssign            := CheckBox20.Checked;

    b.F_CanPageCountSetting         := Edit21.Text;
    b.E_CanPageCountSetting         := CheckBox21.Checked;

    b.F_CanDstAssignEachPages       := Edit22.Text;
    b.E_CanDstAssignEachPages       := CheckBox22.Checked;

    b.F_AvailablePageStartBytes     := Edit23.Text;
    b.E_AvailablePageStartBytes     := CheckBox23.Checked;

    b.F_SrcDstAreaZeroClearDisabled := Edit24.Text;
    b.E_SrcDstAreaZeroClearDisabled := CheckBox24.Checked;

    b.F_IsSrcDstBothPanel           := Edit25.Text;
    b.E_IsSrcDstBothPanel           := CheckBox25.Checked;

    b.F_IsManualInputModeSupported  := Edit26.Text;
    b.E_IsManualInputModeSupported  := CheckBox26.Checked;

    b.F_IsOpeMdEnabled              := Edit27.Text;
    b.E_IsOpeMdEnabled              := CheckBox27.Checked;

    b.F_IsOpeBpsEnabled             := Edit28.Text;
    b.E_IsOpeBpsEnabled             := CheckBox28.Checked;

end;

end.
