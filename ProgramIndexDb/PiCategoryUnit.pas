unit PiCategoryUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
//
    ScreenDbUnit;

type
  TPiCategoryForm = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    Edit2: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    Edit17: TEdit;
  private
    { Private êÈåæ }

    procedure   SetData( b : TPiCategory );
    procedure   GetData( b : TPiCategory );

  public
    { Public êÈåæ }

    function    Start( b : TPiCategory ) : Boolean;

  end;

var
  PiCategoryForm: TPiCategoryForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPiCategoryForm.Start( b : TPiCategory ) : Boolean;
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
procedure TPiCategoryForm.SetData( b : TPiCategory );
begin
    Edit17.Text             := b.F_Id;

    CheckBox1.Checked       := b.E_CategoryName;
    Edit1.Text              := b.F_CategoryName;

    CheckBox2.Checked       := b.E_Order;
    Edit2.Text              := b.F_Order;
end;

//-----------------------------------------------------------------------------
//  ê›íËíläiî[
//-----------------------------------------------------------------------------
procedure TPiCategoryForm.GetData( b : TPiCategory );
begin
    b.F_Id                  := Edit17.Text;
    b.E_Id                  := True;

    b.E_CategoryName        := CheckBox1.Checked;
    b.F_CategoryName        := Edit1.Text;

    b.E_Order               := CheckBox2.Checked;
    b.F_Order               := Edit2.Text;
end;

end.
