unit UiListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TUiListForm = class(TForm)
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
  private

    procedure   SetData( b : TUiList );
    procedure   GetData( b : TUiList );

  public
    { Public êÈåæ }

    function Start( b : TUiList ) : Boolean;

  end;

var
  UiListForm: TUiListForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiListForm.Start( b : TUiList ) : Boolean;
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
procedure TUiListForm.SetData( b : TUiList );
begin
    Edit17.Text             := IntToStr( b.F_Id );

    CheckBox1.Checked       := b.E_FrameId;
    Edit1.Text              := b.F_FrameId;

    CheckBox2.Checked       := b.E_ListType;
    Edit2.Text              := b.F_ListType;

    CheckBox3.Checked       := b.E_Attributes;
    Edit3.Text              := b.F_Attributes;

    CheckBox4.Checked       := b.E_DefaultSortColumnName;
    Edit4.Text              := b.F_DefaultSortColumnName;

    CheckBox5.Checked       := b.E_AllowMultiSort;
    Edit5.Text              := b.F_AllowMultiSort;

    CheckBox6.Checked       := b.E_FilterButtonWidth;
    Edit6.Text              := b.F_FilterButtonWidth;

    CheckBox7.Checked       := b.E_RowHeight;
    Edit7.Text              := b.F_RowHeight;

    CheckBox8.Checked       := b.E_RowHeaderColumnName;
    Edit8.Text              := b.F_RowHeaderColumnName;

    CheckBox9.Checked       := b.E_RowHeaderClickAction;
    Edit9.Text              := b.F_RowHeaderClickAction;

    CheckBox10.Checked      := b.E_ColumnFontSize;
    Edit10.Text             := b.F_ColumnFontSize;

    CheckBox11.Checked      := b.E_CellFontSize;
    Edit11.Text             := b.F_CellFontSize;

    CheckBox12.Checked      := b.E_Order;
    Edit12.Text             := b.F_Order;

    CheckBox13.Checked      := b.E_Left;
    Edit13.Text             := b.F_Left;

    CheckBox14.Checked      := b.E_Width;
    Edit14.Text             := b.F_Width;

    CheckBox15.Checked      := b.E_Top;
    Edit15.Text             := b.F_Top;

    CheckBox16.Checked      := b.E_Height;
    Edit16.Text             := b.F_Height;

end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TUiListForm.GetData( b : TUiList );
begin
    b.F_Id                      := strToIntDef( Edit17.Text, 1 );
    b.E_Id                      := True;

    b.E_FrameId                 := CheckBox1.Checked;
    b.F_FrameId                 := Edit1.Text;

    b.E_ListType                := CheckBox2.Checked;
    b.F_ListType                := Edit2.Text;

    b.E_Attributes              := CheckBox3.Checked;
    b.F_Attributes              := Edit3.Text;

    b.E_DefaultSortColumnName   := CheckBox4.Checked;
    b.F_DefaultSortColumnName   := Edit4.Text;

    b.E_AllowMultiSort          := CheckBox5.Checked;
    b.F_AllowMultiSort          := Edit5.Text;

    b.E_FilterButtonWidth       := CheckBox6.Checked;
    b.F_FilterButtonWidth       := Edit6.Text;

    b.E_RowHeight               := CheckBox7.Checked;
    b.F_RowHeight               := Edit7.Text;

    b.E_RowHeaderColumnName     := CheckBox8.Checked;
    b.F_RowHeaderColumnName     := Edit8.Text;

    b.E_RowHeaderClickAction    := CheckBox9.Checked;
    b.F_RowHeaderClickAction    := Edit9.Text;

    b.E_ColumnFontSize          := CheckBox10.Checked;
    b.F_ColumnFontSize          := Edit10.Text;

    b.E_CellFontSize            := CheckBox11.Checked;
    b.F_CellFontSize            := Edit11.Text;

    b.E_Order                   := CheckBox13.Checked;
    b.F_Order                   := Edit12.Text;

    b.E_Left                    := CheckBox14.Checked;
    b.F_Left                    := Edit13.Text;

    b.E_Width                   := CheckBox15.Checked;
    b.F_Width                   := Edit14.Text;

    b.E_Top                     := CheckBox16.Checked;
    b.F_Top                     := Edit15.Text;

    b.E_Height                  := CheckBox16.Checked;
    b.F_Height                  := Edit16.Text;

end;



end.


