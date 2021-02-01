unit UiListColumnUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
//
    ScreenDbUnit, Vcl.StdCtrls;

type
  TUiListColumnForm = class(TForm)
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
    CheckBox16: TCheckBox;
    Edit16: TEdit;
    CheckBox17: TCheckBox;
    Edit17: TEdit;
    CheckBox18: TCheckBox;
    Edit18: TEdit;
    CheckBox19: TCheckBox;
    Edit19: TEdit;
    CheckBox20: TCheckBox;
    Edit20: TEdit;
    CheckBox21: TCheckBox;
    Edit21: TEdit;
    CheckBox22: TCheckBox;
    Edit22: TEdit;
    CheckBox23: TCheckBox;
    Edit23: TEdit;
    CheckBox24: TCheckBox;
    Edit24: TEdit;
    CheckBox25: TCheckBox;
    Edit25: TEdit;
    CheckBox26: TCheckBox;
    Edit26: TEdit;
    CheckBox27: TCheckBox;
    Edit27: TEdit;
    CheckBox28: TCheckBox;
    Edit28: TEdit;
    CheckBox29: TCheckBox;
    Edit29: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Edit30: TEdit;
    Label8: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    CheckBox30: TCheckBox;
    Edit31: TEdit;
    procedure Button1Click(Sender: TObject);
  private

    FParentList : TUiList;

    procedure   SetData( b : TUiListColumn );
    procedure   GetData( b : TUiListColumn );

  public
    { Public êÈåæ }

    function Start( b : TUiListColumn; cl : TUiList ) : Boolean;
  end;

var
  UiListColumnForm: TUiListColumnForm;

implementation

{$R *.dfm}

uses
    MainUnit, UiListUnit;   //, UiListUnit;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiListColumnForm.Start( b : TUiListColumn; cl : TUiList ) : Boolean;
begin
    Result := False;

    // êeLIST
    FParentList     := cl;

    // ê›íËílìWäJ
    SetData( b );

    if mrOK <> ShowModal then Exit;

    // ê›íËíläiî[
    GetData( b );

    Result := True;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TUiListColumnForm.Button1Click(Sender: TObject);
//var
//    lst : TUiList;

begin

{
    lst := MainForm.ScreenList.SearchList( Edit1.Text );
    if lst = nil then Exit;
}
    UiListForm.Start( FParentList );
end;

//-----------------------------------------------------------------------------
//  ê›íËílìWäJ
//-----------------------------------------------------------------------------
procedure TUiListColumnForm.SetData( b : TUiListColumn );
begin
    Edit30.Text                 := IntToStr( b.F_Id );

    CheckBox1.Checked           := b.E_ListId;
    Edit1.Text                  := b.F_ListId;

    CheckBox2.Checked           := b.E_Order;
    Edit2.Text                  := b.F_Order;

    CheckBox3.Checked           := b.E_SortOrder;
    Edit3.Text                  := b.F_SortOrder;

    CheckBox4.Checked           := b.E_Width;
    Edit4.Text                  := b.F_Width;

    CheckBox5.Checked           := b.E_IsVisible;
    Edit5.Text                  := b.F_IsVisible;

    CheckBox6.Checked           := b.E_IsReadOnly;
    Edit6.Text                  := b.F_IsReadOnly;

    CheckBox7.Checked           := b.E_Text;
    Edit7.Text                  := b.F_Text;

    CheckBox8.Checked           := b.E_ColName;
    Edit8.Text                  := b.F_ColName;

    CheckBox9.Checked           := b.E_ColAlias;
    Edit9.Text                  := b.F_ColAlias;

    CheckBox10.Checked          := b.E_ColHeaderClickAction;
    Edit10.Text                 := b.F_ColHeaderClickAction;

    CheckBox11.Checked          := b.E_CellType;
    Edit11.Text                 := b.F_CellType;

    CheckBox12.Checked          := b.E_EnumTypeName;
    Edit12.Text                 := b.F_EnumTypeName;

    CheckBox13.Checked          := b.E_Format;
    Edit13.Text                 := b.F_Format;

    CheckBox14.Checked          := b.E_Attribute;
    Edit14.Text                 := b.F_Attribute;

    CheckBox15.Checked          := b.E_AllowSort;
    Edit15.Text                 := b.F_AllowSort;

    CheckBox16.Checked          := b.E_AllowFilter;
    Edit16.Text                 := b.F_AllowFilter;

    CheckBox17.Checked          := b.E_AllowWideChar;
    Edit17.Text                 := b.F_AllowWideChar;

    CheckBox18.Checked          := b.E_MaxLangth;
    Edit18.Text                 := b.F_MaxLangth;

    CheckBox19.Checked          := b.E_MaxLengthIsBytes;
    Edit19.Text                 := b.F_MaxLengthIsBytes;

    CheckBox20.Checked          := b.E_DisplayMaxLineCount;
    Edit20.Text                 := b.F_DisplayMaxLineCount;

    CheckBox21.Checked          := b.E_ColumnFontSize;
    Edit21.Text                 := b.F_ColumnFontSize;

    CheckBox22.Checked          := b.E_CellFontSize;
    Edit22.Text                 := b.F_CellFontSize;

    CheckBox23.Checked          := b.E_CellTextHAlign;
    Edit23.Text                 := b.F_CellTextHAlign;

    CheckBox24.Checked          := b.E_CanReEntry;
    Edit24.Text                 := b.F_CanReEntry;

    CheckBox25.Checked          := b.E_IsCellButtonCol;
    Edit25.Text                 := b.F_IsCellButtonCol;

    CheckBox26.Checked          := b.E_IsRowSelectSync;
    Edit26.Text                 := b.F_IsRowSelectSync;

    CheckBox27.Checked          := b.E_BoolTrueText;
    Edit27.Text                 := b.F_BoolTrueText;

    CheckBox28.Checked          := b.E_BoolFalseText;
    Edit28.Text                 := b.F_BoolFalseText;

    CheckBox29.Checked          := b.E_IsFontSizeAdjustable;
    Edit29.Text                 := b.F_IsFontSizeAdjustable;

    CheckBox30.Checked          := b.E_FooterText;
    Edit31.text                 := b.F_FooterText;


end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TUiListColumnForm.GetData( b : TUiListColumn );
begin
    b.F_Id                      := StrToIntDef( Edit30.Text, 1 );
    b.E_Id                      := True;

    b.E_ListId                  := CheckBox1.Checked;
    b.F_ListId                  := Edit1.Text;

    b.E_Order                   := CheckBox2.Checked;
    b.F_Order                   := Edit2.Text;

    b.E_SortOrder               := CheckBox3.Checked;
    b.F_SortOrder               := Edit3.Text;

    b.E_Width                   := CheckBox4.Checked;
    b.F_Width                   := Edit4.Text;

    b.E_IsVisible               := CheckBox5.Checked;
    b.F_IsVisible               := Edit5.Text;

    b.E_IsReadOnly              := CheckBox6.Checked;
    b.F_IsReadOnly              := Edit6.Text;

    b.E_Text                    := CheckBox7.Checked;
    b.F_Text                    := Edit7.Text;

    b.E_ColName                 := CheckBox8.Checked;
    b.F_ColName                 := Edit8.Text;

    b.E_ColAlias                := CheckBox9.Checked;
    b.F_ColAlias                := Edit9.Text;

    b.E_ColHeaderClickAction    := CheckBox10.Checked;
    b.F_ColHeaderClickAction    := Edit10.Text;

    b.E_CellType                := CheckBox11.Checked;
    b.F_CellType                := Edit11.Text;

    b.E_EnumTypeName            := CheckBox12.Checked;
    b.F_EnumTypeName            := Edit12.Text;

    b.E_Format                  := CheckBox13.Checked;
    b.F_Format                  := Edit13.Text;

    b.E_Attribute               := CheckBox14.Checked;
    b.F_Attribute               := Edit14.Text;

    b.E_AllowSort               := CheckBox15.Checked;
    b.F_AllowSort               := Edit15.Text;

    b.E_AllowFilter             := CheckBox16.Checked;
    b.F_AllowFilter             := Edit16.Text;

    b.E_AllowWideChar           := CheckBox17.Checked;
    b.F_AllowWideChar           := Edit17.Text;

    b.E_MaxLangth               := CheckBox18.Checked;
    b.F_MaxLangth               := Edit18.Text;

    b.E_MaxLengthIsBytes        := CheckBox19.Checked;
    b.F_MaxLengthIsBytes        := Edit19.Text;

    b.E_DisplayMaxLineCount     := CheckBox20.Checked;
    b.F_DisplayMaxLineCount     := Edit20.Text;

    b.E_ColumnFontSize          := CheckBox21.Checked;
    b.F_ColumnFontSize          := Edit21.Text;

    b.E_CellFontSize            := CheckBox22.Checked;
    b.F_CellFontSize            := Edit22.Text;

    b.E_CellTextHAlign          := CheckBox23.Checked;
    b.F_CellTextHAlign          := Edit23.Text;

    b.E_CanReEntry              := CheckBox24.Checked;
    b.F_CanReEntry              := Edit24.Text;

    b.E_IsCellButtonCol         := CheckBox25.Checked;
    b.F_IsCellButtonCol         := Edit25.Text;

    b.E_IsRowSelectSync         := CheckBox26.Checked;
    b.F_IsRowSelectSync         := Edit26.Text;

    b.E_BoolTrueText            := CheckBox27.Checked;
    b.F_BoolTrueText            := Edit27.Text;

    b.E_BoolFalseText           := CheckBox28.Checked;
    b.F_BoolFalseText           := Edit28.Text;

    b.E_IsFontSizeAdjustable    := CheckBox29.Checked;
    b.F_IsFontSizeAdjustable    := Edit29.Text;

    b.E_FooterText              := CheckBox30.Checked;
    b.F_FooterText              := Edit31.Text;

end;

end.


