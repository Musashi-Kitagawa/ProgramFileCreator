unit UiDstButtonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TUiDstButtonForm = class(TForm)
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
    CheckBox13: TCheckBox;
    Edit13: TEdit;
    CheckBox14: TCheckBox;
    Edit14: TEdit;
    CheckBox15: TCheckBox;
    Edit15: TEdit;
    Edit16: TEdit;
    Label9: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CheckBox16: TCheckBox;
    Edit17: TEdit;
  private
    { Private êÈåæ }
    procedure   SetData( d : TUiDstButton );
    procedure   GetData( d : TUiDstButton );

  public
    { Public êÈåæ }

    function Start( d : TUiDstButton ) : Boolean;
  end;

var
  UiDstButtonForm: TUiDstButtonForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiDstButtonForm.Start( d : TUiDstButton ) : Boolean;
begin
    Result := False;

    // ê›íËílìWäJ
    SetData( d );

    if mrOK <> ShowModal then Exit;

    // ê›íËíläiî[
    GetData( d );

    Result := True;

end;

//-----------------------------------------------------------------------------
//  ê›íËílìWäJ
//-----------------------------------------------------------------------------
procedure TUiDstButtonForm.SetData( d : TUiDstButton );
begin

    Edit16.Text         := IntToStr( d.F_Id );

    CheckBox1.Checked   := d.E_FrameId;
    Edit1.Text          := d.F_FrameId;

    CheckBox2.Checked   := d.E_DstPortNo;
    Edit2.Text          := d.F_DstPortNo;

    CheckBox3.Checked   := d.E_IsListItem;
    Edit3.Text          := d.F_IsListItem;

    CheckBox4.Checked   := d.E_DstHeightPx;
    Edit4.Text          := d.F_DstHeightPx;

    CheckBox5.Checked   := d.E_FontSize;
    Edit5.Text          := d.F_FontSize;

    CheckBox6.Checked   := d.E_Order;
    Edit6.Text          := d.F_Order;

    CheckBox7.Checked   := d.E_Left;
    Edit7.Text          := d.F_Left;

    CheckBox8.Checked   := d.E_Width;
    Edit8.Text          := d.F_Width;

    CheckBox9.Checked   := d.E_Top;
    Edit9.Text          := d.F_Top;

    CheckBox10.Checked  := d.E_Height;
    Edit10.Text         := d.F_Height;

    CheckBox11.Checked  := d.E_BorderWidth;
    Edit11.Text         := d.F_BorderWidth;

    CheckBox12.Checked  := d.E_IsDisabled;
    Edit12.Text         := d.F_IsDisabled;

    CheckBox13.Checked  := d.E_SystemModeBitMask;
    Edit13.Text         := d.F_SystemModeBitMask;

    CheckBox14.Checked  := d.E_Attrubute;
    Edit14.Text         := d.F_Attrubute;

    CheckBox15.Checked  := d.E_IsHeadBarHidden;
    Edit15.Text         := d.F_IsHeadBarHidden;

    CheckBox16.Checked  := d.E_DstFontSize;
    Edit17.Text         := d.F_DstFontSize;


end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TUiDstButtonForm.GetData( d : TUiDstButton );
begin

    d.F_Id              := StrToIntDef( Edit16.Text, 1 );
    d.E_Id              := True;

    d.E_FrameId         := CheckBox1.Checked;
    d.F_FrameId         := Edit1.Text;

    d.E_DstPortNo       := CheckBox2.Checked;
    d.F_DstPortNo       := Edit2.Text;

    d.E_IsListItem      := CheckBox3.Checked;
    d.F_IsListItem      := Edit3.Text;

    d.E_DstHeightPx     := CheckBox4.Checked;
    d.F_DstHeightPx     := Edit4.Text;

    d.E_FontSize        := CheckBox5.Checked;
    d.F_FontSize        := Edit5.Text;

    d.E_Order           := CheckBox6.Checked;
    d.F_Order           := Edit6.Text;

    d.E_Left            := CheckBox7.Checked;
    d.F_Left            := Edit7.Text;

    d.E_Width           := CheckBox8.Checked;
    d.F_Width           := Edit8.Text;

    d.E_Top             := CheckBox9.Checked;
    d.F_Top             := Edit9.Text;

    d.E_Height          := CheckBox10.Checked;
    d.F_Height          := Edit10.Text;

    d.E_BorderWidth     := CheckBox11.Checked;
    d.F_BorderWidth     := Edit11.Text;

    d.E_IsDisabled      := CheckBox12.Checked;
    d.F_IsDisabled      := Edit12.Text;

    d.E_SystemModeBitMask   := CheckBox13.Checked;
    d.F_SystemModeBitMask   := Edit13.Text;

    d.E_Attrubute       := CheckBox14.Checked;
    d.F_Attrubute       := Edit14.Text;

    d.E_IsHeadBarHidden := CheckBox15.Checked;
    d.F_IsHeadBarHidden := Edit15.Text;

    d.E_DstFontSize     := CheckBox16.Checked;
    d.F_DstFontSize     := Edit17.Text;

end;


end.
