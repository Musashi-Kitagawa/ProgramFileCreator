//*****************************************************************************
//  �j���[�e���X�e�N�m������Гa���� �uPROGRAM FILE CREATOR�v
//  �ԑg�J�e�S�����C�A�E�g
//
//  Dec - 25 - '20
//  �����������
//*****************************************************************************
unit ProgramCategoryUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Contnrs, System.Types,
//
    GroupCategoryUnit, MusFlatButton, ScreenDbUnit;

type
  TProgramCategoryForm = class(TForm)
    CaScrollBox: TScrollBox;
    TerPanel: TPanel;
    DispPanel: TPanel;
    NamePanel: TPanel;
    NoPanel: TPanel;
    Cate1Button: TMusFlatButton;
    Cate2Button: TMusFlatButton;
    Cate3Button: TMusFlatButton;
    InputEdit: TEdit;
    Label4: TLabel;
    PlusLabel: TLabel;
    MinusLabel: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TerPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Cate1ButtonClick(Sender: TObject);
//    procedure InputEditEnter(Sender: TObject);
//    procedure InputEditExit(Sender: TObject);
//    procedure InputEditKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure MinusLabelClick(Sender: TObject);
  private
    { Private �錾 }

    FCategoryPanelList      : TCategoryPanelList;
    FSelectCategory         : integer;

    function    GetSelectCategory : integer;
    procedure   SetSelectCategory( cate : integer );

    property    SelectCategory : integer    read GetSelectCategory      write SetSelectCategory;

  public
    { Public �錾 }

    procedure   MakeComponent;
//    procedure   DispCategory;

  end;

var
  ProgramCategoryForm: TProgramCategoryForm;

implementation

{$R *.dfm}

uses
    MainUnit, CommonUnit, LogUtilUnit, PiCategoryUnit;

//-----------------------------------------------------------------------------
//  �I���J�e�S���擾
//-----------------------------------------------------------------------------
function TProgramCategoryForm.GetSelectCategory : integer;
begin
//    Result := 0;
    Result := FSelectCategory;
end;

//-----------------------------------------------------------------------------
//  �I���J�e�S���ݒ�
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.SetSelectCategory( cate : integer );
begin
    if cate = -1 then begin
        // ������
        cate            := 0;
        FSelectCategory := cate;
    end
    else begin
        // �ω��Ȃ�
        if FSelectCategory = cate then Exit;

        FSelectCategory := cate;

        // �ĕ\��
        MakeComponent;
    end;

    // �J�e�S���ύX�{�^���\��
    SetButtonOnOff( Cate1Button, (cate = Cate1Button.Tag) );
    SetButtonOnOff( Cate2Button, (cate = Cate2Button.Tag) );
    SetButtonOnOff( Cate3Button, (cate = Cate3Button.Tag) );
end;

//-----------------------------------------------------------------------------
//  �E�B���h�E�쐬
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.FormCreate(Sender: TObject);
begin

    FCategoryPanelList      := TCategoryPanelList.Create;

    SelectCategory         := -1;

    InputEdit.Visible   := False;

    NoPanel.Caption     := ' ' + NoPanel.Caption;
    NoPanel.Color       := TOP_COLOR;

    NamePanel.Caption   := ' ' + NamePanel.Caption;
    NamePanel.Color     := TOP_COLOR;

    DispPanel.Caption   := ' ' + DispPanel.Caption;
    DispPanel.Color     := TOP_COLOR;
end;

//-----------------------------------------------------------------------------
//  �E�B���h�E�p��
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.FormDestroy(Sender: TObject);
begin
    FCategoryPanelList.ClearAll;
    FCategoryPanelList.Free;

end;

//-----------------------------------------------------------------------------
//  �J�e�S���I���{�^������
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.Cate1ButtonClick(Sender: TObject);
begin
    SelectCategory  := TMusFlatButton( Sender ).Tag;
end;

//-----------------------------------------------------------------------------
//  �R���|�[�l���g�쐬
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.MakeComponent;
var
    pl : TPiCategoryList;
    pi : TPiCategory;
    i, t, n : integer;
    ca : TCategoryPanel;

begin

    pl  := MainForm.ProgramIndexDb.PiCategoryList[ SelectCategory ];

    if pl.Count > FCategoryPanelList.Count then begin
        // �s�����Ă���̂Ńp�l���ǉ�

        n := pl.Count - FCategoryPanelList.Count;
        t := TerPanel.Top + (TerPanel.Height + 1) * FCategoryPanelList.Count;
        for i:=0 to n-1 do begin
//            pi := pl.Data[ i ];
            ca              := TCategoryPanel.Create( CaScrollBox );
            ca.Parent       := CaScrollBox;
            ca.Left         := TerPanel.Left;
            ca.Top          := t;
            ca.Width        := TerPanel.Width;
            ca.Height       := TerPanel.Height;
            ca.BevelOuter   := TerPanel.BevelOuter;
            ca.Font         := TerPanel.Font;
            ca.ParentBackground := False;
            ca.Visible      := True;
            ca.OnMouseDown  := TerPanelMouseDown;
            FCategoryPanelList.Add( ca );

            t := t + (ca.Height + 1);
        end;

    end
    else if FCategoryPanelList.Count > pl.Count then begin
        // �����̂ō폜
        n := FCategoryPanelList.Count - pl.Count;

        for i:=0 to n-1 do begin
            ca := FCategoryPanelList.Data[0];
            FCategoryPanelList.Extract( ca );
            ca.Free;
        end;
    end;

    // �C���f�b�N�X�ŕ��ёւ�
    pl.SortOrder;

    // �ĕ\��
    t   := TerPanel.Top;
    for i:=0 to pl.Count-1 do begin
        pi              := pl.Data[ i ];
        ca              := FCategoryPanelList.Data[i];
        ca.Title        := pi.F_CategoryName;
        ca.IndexNo      := pi.F_Order;
        ca.ID           := pi.F_Id;
        ca.Top          := t;
        ca.Tag          := i;
        if (i mod 2) = 0 then   ca.Color := EVEN_COLOR
        else                    ca.Color := ODD_COLOR;
//        ca.OnMouseDown  := TerPanelMouseDown;

        t := t + (ca.Height + 1);
    end;
end;

//-----------------------------------------------------------------------------
//  �ҏW�A�폜�A�ǉ�
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.MinusLabelClick(Sender: TObject);
var
    pl : TPiCategoryList;
    pi : TPiCategory;
    sel : integer;

begin
    pl  := MainForm.ProgramIndexDb.PiCategoryList[ SelectCategory ];

    case TLabel( Sender ).Tag of
    0:  // �ǉ�
        begin
            // �I���Ȃ�
            FCategoryPanelList.Select   := -1;

            pi := TPiCategory.Create;

            pi.F_Id             := pl.GetMaxId;
            pi.E_Id             := True;
            pi.F_CategoryName   := '';
            pi.E_CategoryName   := True;
            pi.F_Order          := pl.GetMaxOrder;
            pi.E_Order          := True;

            if False = PiCategoryForm.Start( pi ) then begin
                pi.Free;
                Exit;
            end;

            pl.Add( pi );
        end;

    1:  // �폜
        begin
            sel := FCategoryPanelList.Select;
            if -1 = sel then Exit;

            pi := pl.Data[ sel ];
            pl.Extract( pi );
            pi.Free;
        end;

    2:  // �ҏW
        begin
            sel := FCategoryPanelList.Select;
            if -1 = sel then Exit;

            pi := pl.Data[ sel ];
            if False = PiCategoryForm.Start( pi ) then begin
                Exit;
            end;
        end;

    else
        Exit;

    end;

    // �ĕ\��
    MakeComponent;
end;

//-----------------------------------------------------------------------------
//  ���X�g�p�l�� �}�E�X����
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.TerPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   cate : integer;
//   pnl : TCategoryPanel;

begin
    cate := TPanel( Sender ).Tag;

{log}SetOpeLog( 'OPE:TProgramCategoryForm.CatePanelMouseDown', cate );

    if mbLeft = Button then begin

        // �I����Ԃɂ���
        FCategoryPanelList.Select    := cate;

    end
    else begin

{
        // ����

        // ���̓��̓{�b�N�X�\��
        pnl := FCategoryPanelList.Data[ cate ];

        InputEdit.Parent    := pnl;
        InputEdit.Top       := 0;
        InputEdit.Left      := 50;
        InputEdit.Width     := NamePanel.Width;
        InputEdit.Text      := pnl.Title;
        InputEdit.Tag       := cate;
        InputEdit.Visible   := True;

        InputEdit.SetFocus;
}
        // �\����
//       IndexPopupMenu.Tag  := cate;
//        // �|�b�v�A�b�v���j���\��
//        po := TPanel( Sender ).ClientToScreen( Point( x, y ) );
//        IndexPopupMenu.Popup( po.X, po.Y );
    end;
end;

(*
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.InputEditEnter(Sender: TObject);
begin
    ;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.InputEditExit(Sender: TObject);
begin
    InputEdit.Parent    := nil;
    InputEdit.Visible   := False;
end;

//-----------------------------------------------------------------------------
//  ���̓��� �C�x���g
//-----------------------------------------------------------------------------
procedure TProgramCategoryForm.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
//    btn : TLayoutButton;
    pnl : TCategoryPanel;

begin

	case Key of
    VK_RETURN:
        begin
        	//	ENTER�������ꂽ

            // �m��
            pnl := FCategoryPanelList.Data[ InputEdit.Tag ];
            pnl.Title   := InputEdit.Text;

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;

            // ���[�N�f�[�^�ɃZ�b�g
//            btn := MainForm.CategoryList.Data[ InputEdit.Tag ];
//            TuiScreenselectButton( btn.Button ).F_Text  := InputEdit.Text;

{log}SetOpeLog( 'OPE:TGroupCategoryForm.InputEditKeyDown', InputEdit.Text );
        end;

    VK_ESCAPE:
        begin
        	// ESCAPE�������ꂽ

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;
        end;
    end;

end;
*)




end.
