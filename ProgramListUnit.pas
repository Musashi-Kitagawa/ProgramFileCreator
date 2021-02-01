//*****************************************************************************
//  �j���[�e���X�e�N�m������Гa���� �uPROGRAM FILE CREATOR�v
//  �ԑg���X�g���C�A�E�g
//
//  Dec - 25 - '20
//  �����������
//*****************************************************************************
unit ProgramListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Contnrs,
  System.Types,
//
    ListUnit, ScreenDbUnit, CommonUnit, MusFlatButton;

type
  TProgramListForm = class(TForm)
    CSScrollBox: TScrollBox;
    Panel1: TPanel;
    Label4: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    ListPanel: TPanel;
    PanelTmp: TPanel;
    NamePanel: TPanel;
    Panel4: TPanel;
    UpLabel: TLabel;
    DownLabel: TLabel;
    CellButton: TMusFlatButton;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PanelTmpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure CSScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure UpLabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CellButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private �錾 }

    FOpenMode   : integer;

    FLayoutPanel    : array [0..19] of TListLayoutPanel;
    FColumnStyle	: array [0..19] of TColumnStyle;

    procedure   MakeComponent;
    function    ColumnList : TColumnList;
    function    GetSelectIndex : integer;
    procedure   DispColumnListLayout;

  public
    { Public �錾 }

    procedure   DispLayout( opt : integer );

  const
    modeProg        = 0;        // �ԑg���C�A�E�g
    modeDevice      = 1;        // �f�B�o�C�X���C�A�E�g

  end;

var
  ProgramListForm: TProgramListForm;

implementation

{$R *.dfm}

uses
    MainUnit, UiListColumnUnit, LogUtilUnit, UiListCellButtonUnit;

//-----------------------------------------------------------------------------
//  �ԑg���X�g�擾�i���[�N�p�j
//-----------------------------------------------------------------------------
function TProgramListForm.ColumnList : TColumnList;
begin

    case FOpenMode of
    modeProg:   Result := TListLayout( MainForm.ProgramLayoutList.Data[0] ).ColumnList[0];
    modeDevice: Result := TListLayout( MainForm.DeviceLayoutList.Data[0] ).ColumnList[0];
    else
                Result := nil;
    end;

end;

//-----------------------------------------------------------------------------
//  �}�E�X�z�C�[��
//-----------------------------------------------------------------------------
procedure TProgramListForm.CSScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
const
	WheelScrollSize		= 36;

var
    mv : integer;

begin
	// �ړ���
	if WheelDelta > 0 then mv := -WheelScrollSize
    else                   mv := WheelScrollSize;

    CSScrollBox.VertScrollBar.Position := CSScrollBox.VertScrollBar.Position + mv;
    Handled := True;
end;

//-----------------------------------------------------------------------------
//  ���C�A�E�g���X�g�\��
//-----------------------------------------------------------------------------
//procedure TProgramListForm.DispLayout;
procedure   TProgramListForm.DispLayout( opt : integer );
var
    cl : TColumnList;
    co : TColumnData;
    i, l, w, fit : integer;

begin
{log}SetOpeLog( 'OPE:TProgramListForm.DispLayout' );

    FOpenMode := opt;

    cl := ColumnList;

    // ORDER���Ƀ\�[�g
    cl.SortOrder;

    // �͂��߂ɑS��\��
    for i:=0 to HIGH( FLayoutPanel ) do begin
        FLayoutPanel[i].Visible := False;
        FLayoutPanel[i].Align   := alNone;
    end;

    // FIT�p
    fit := -1;
    w   := 0;
    l   := PanelTmp.Left;

    for i:=0 to cl.Count-1 do begin

        co := cl.Data[i];

        FLayoutPanel[i].Title   := co.Column.F_Text;
        FLayoutPanel[i].IDName  := co.Column.F_Width;

        FLayoutPanel[i].Left    := l;

        FLayoutPanel[i].Width   := XSize( co.Column.F_Width, LAYOUT_IMAGE_SIZE );   //ListPanel.Width );
        FLayoutPanel[i].Visible := (co.Column.F_IsVisible = 'true');
//        FLayoutPanel[i].Align   := alLeft;
        if True = FLayoutPanel[i].Visible then
            l := l + FLayoutPanel[i].Width;

        // FIT������
        if '' = co.Column.F_Width then begin
            fit := i;
        end
        else begin
            if True = FLayoutPanel[i].Visible then
                w := w + FLayoutPanel[i].Width;
        end;

    end;

    // FIT������Ƃ�
    if -1 <> fit then begin

        // �T�C�Y����J�����Z�b�g
        FLayoutPanel[ fit ].Width   := LAYOUT_IMAGE_SIZE -  w;

        // �Ĕz�u
        l := PanelTmp.Left;
        for i:=0 to cl.Count-1 do begin
            FLayoutPanel[i].Left    := l;
            if True = FLayoutPanel[i].Visible then
                l := l + FLayoutPanel[i].Width;
        end;
    end;

    // �C���[�W�T�C�Y�Z�b�g
    ListPanel.Width     := (l + 1);

    // �J�������X�g�\��
    DispColumnListLayout;
end;

//-----------------------------------------------------------------------------
//  �J�������X�g�\��
//-----------------------------------------------------------------------------
procedure TProgramListForm.DispColumnListLayout;
var
    cl : TColumnList;
    i, j : integer;
    cd : TColumnData;
    key : string;

begin
    cl := ColumnList;

    for i:=0 to HIGH( FColumnStyle ) do begin

        cd := cl.Data[ i ] ;

        FColumnStyle[i].Visible := (cd <> nil);

        if cd <> nil then begin

            //  �J������
            if '' <> cd.Column.F_ColName then   key := cd.Column.F_ColName
            else                                key := cd.Column.F_ColAlias;
            FColumnStyle[i].CkLabel.Caption := Format( '%s (%s)', [key, cd.Column.F_Order] );

            // �I��p�`�F�b�N�{�b�N�X
            FColumnStyle[i].Check.OnClick       := nil;
            FColumnStyle[i].Check.Checked       := (cd.Column.F_IsVisible = 'true');
            FColumnStyle[i].Check.OnClick       := CheckBox1Click;

            // ���X�g�^�C�g��
            FColumnStyle[i].Edit.Text           := cd.Column.F_Text;

            // �Z���{�^��
            // ��U��\��
            for j:=0 to FColumnStyle[i].CellCount-1 do begin
                FColumnStyle[i].CellButton[j].Visible  := False;
            end;

            for j:=0 to cd.Buttons.Count-1 do begin
                FColumnStyle[i].CellButton[j].Visible  := True;
                FColumnStyle[i].CellButton[j].Caption  := TUiListCellButton( cd.Buttons.Data[j]).F_Text;
                FColumnStyle[i].CellButton[j].Tag      := (i * 100) + j;
            end;

        end;

    end;
end;

//-----------------------------------------------------------------------------
//  �E�B���h�E�쐬
//-----------------------------------------------------------------------------
procedure TProgramListForm.FormCreate(Sender: TObject);
begin
    MakeComponent;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramListForm.MakeComponent;
var
    i, j : integer;
    pnl : TListLayoutPanel;
    ed : TEdit;
    ck : TCheckBox;
    lb : TLabel;
//    cm : TComboBox;
    btn : TMusFlatButton;

begin
{log}SetOpeLog( 'OPE:TProgramListForm.MakeComponent' );

    ListPanel.Color     := TOP_COLOR;

    // ���C�A�E�g�C���[�W�{�^��
    for i:=0 to HIGH( FLayoutPanel ) do begin
        pnl                     := TListLayoutPanel.Create( ListPanel );
        pnl.Parent              := ListPanel;
        pnl.Width               := PanelTmp.Width;
        pnl.Height              := PanelTmp.Height;
        pnl.Top                 := PanelTmp.Top;
        pnl.Left                := 0 + (PanelTmp.Width + 2) * i;
        pnl.BevelKind           := PanelTmp.BevelKind;
        pnl.BevelOuter          := PanelTmp.BevelOuter;
        pnl.ParentBackGround    := False;
        pnl.Caption             := '';
        pnl.Color               := PanelTmp.Color;
        pnl.Tag                 := i;
        pnl.Visible             := False;
        pnl.DoubleBuffered      := True;
        pnl.OnMouseDown         := PanelTmpMouseDown;

        FLayoutPanel[i]         := pnl;
    end;

    // ���C�A�E�g�\���p
    for i:=0 to HIGH( FColumnStyle ) do begin
        FColumnStyle[i]                     := TColumnStyle.Create( CSScrollBox );
        FColumnStyle[i].Parent              := CSScrollBox;

        FColumnStyle[i].Width               := Panel1.Width;
        FColumnStyle[i].Height              := Panel1.Height;
        FColumnStyle[i].Top                 := 2 + i * (FColumnStyle[i].Height + 1);
        FColumnStyle[i].Left                := 2;
        FColumnStyle[i].Select              := False;
        FColumnStyle[i].BevelKind           := Panel1.BevelKind;
        FColumnStyle[i].BevelOuter          := Panel1.BevelOuter;
        FColumnStyle[i].ParentBackGround    := False;
        FColumnStyle[i].DoubleBuffered      := True;
        FColumnStyle[i].Color               := PanelTmp.Color;

        if 0 = (i mod 2) then   FColumnStyle[i].Color := EVEN_COLOR
        else                    FColumnStyle[i].Color := ODD_COLOR;

        FColumnStyle[i].OnClick             := Panel1Click;

        // �^�C�g�����͗p�G�f�B�b�g
        ed := TEdit.Create( FColumnStyle[i] );
        ed.Parent       := FColumnStyle[i];
        ed.Left         := Edit1.Left;
        ed.Top          := Edit1.Top;
        ed.Width        := Edit1.Width;
        ed.Height       := Edit1.Height;
        ed.Text         := '';
        ed.Font         := Edit1.Font;
        ed.Tag          := i;
        ed.OnkeyPress   := Edit1KeyPress;
        FColumnStyle[i].Edit    := ed;

        // �I��p�`�F�b�N�{�b�N�X
        ck := TCheckBox.Create( FColumnStyle[i] );
        ck.Parent       := FColumnStyle[i];
        ck.Left         := CheckBox1.Left;
        ck.Top          := CheckBox1.Top;
        ck.Width        := CheckBox1.Width;
        ck.Height       := CheckBox1.Height;
        ck.Caption      := '';
        ck.Font         := CheckBox1.Font;
        ck.Tag          := i;
        ck.OnClick      := CheckBox1Click;
        FColumnStyle[i].Check   := ck;

        // �J�����^�C�v
        lb := TLabel.Create( FColumnStyle[i] );
        lb.Parent       := FColumnStyle[i];
        lb.Left         := Label4.Left;
        lb.Top          := Label4.Top;
        lb.Width        := Label4.Width;
        lb.Height       := Label4.Height;
        lb.Caption      := '';
        lb.Font         := Label4.Font;
        lb.Enabled      := True;
        lb.Tag          := i;
        lb.OnClick      := Panel1Click;
        FColumnStyle[i].CkLabel   := lb;

        // �Z���{�^��
        for j:=0 to 4-1 do begin
            btn             := TMusFlatButton.Create( FColumnStyle[i] );
            btn.Parent      := FColumnStyle[i];
            btn.Left        := CellButton.Left + (CellButton.Width + 3) * j;
            btn.Top         := CellButton.Top;
            btn.Width       := CellButton.Width;
            btn.Height      := CellButton.Height;
            btn.Caption     := '';
            btn.Font        := CellButton.Font;
            btn.Color       := clBtnFace;
            btn.DownColor   := $000080ff;
            btn.Enabled     := True;
            btn.Tag         := i;
            btn.Visible     := False;
            btn.OnMouseDown := CellButtonMouseDown;
            FColumnStyle[i].CellButton[j]  := btn;
        end;

        FColumnStyle[i].Tag     := i;
    end;

end;

//-----------------------------------------------------------------------------
//  ���X�g�p�l���N���b�N
//-----------------------------------------------------------------------------
procedure TProgramListForm.Panel1Click(Sender: TObject);
var
    i, n : integer;

begin

    n := TColumnStyle( Sender ).Tag;

    if True = FColumnStyle[ n ].Select then begin
        // �S�Ĕ�I��
        FColumnStyle[ n ].Select        := False;
    end
    else begin
        // �S�Ĕ�I��
        for i:=0 to HIGH( FColumnStyle ) do begin
            FColumnStyle[ i ].Select    := (n = i);
        end;
    end;
end;

//-----------------------------------------------------------------------------
//  ���C�A�E�g�C���[�W �J�����N���b�N
//-----------------------------------------------------------------------------
procedure TProgramListForm.PanelTmpMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    cl : TColumnList;
    co : TColumnData;

begin
{log}SetOpeLog( 'OPE:TProgramListForm.PanelTmpMouseDown' );

    // MAINTE LIST ����
    cl := ColumnList;
    co := cl.Data[ Tpanel( Sender ).Tag ];
    if nil = co then Exit;

    UiListColumnForm.Start( co.Column, cl.List );
end;

//-----------------------------------------------------------------------------
//  �I�����X�g�C���f�b�N�X�擾
//-----------------------------------------------------------------------------
function TProgramListForm.GetSelectIndex : integer;
var
    i : integer;

begin
    for i:=0 to HIGH( FColumnStyle ) do begin
        if True = FColumnStyle[ i ].Select then begin
            Result := i;
            Exit;
        end;
    end;

    Result := -1;
end;

//-----------------------------------------------------------------------------
//  �㉺�ړ��{�^������
//-----------------------------------------------------------------------------
procedure TProgramListForm.UpLabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    cl : TColumnList;
    co : TColumnData;
    inx, i : integer;

begin

    inx     := GetSelectIndex;

    // �I���Ȃ�
    if inx = -1 then Exit;

    // MAINTE LIST ����
    cl := ColumnList;

    case TLabel( Sender ).Tag of
    0:  // UP
        begin
            // �擪�I����
            if inx = 0 then Exit;

            // ���X�g���甲���ĂP�O�ɑ}��
            co := cl.Data[ inx ];
            cl.Extract( co );
            cl.Insert( (inx - 1), co );

            inx := inx - 1;
        end;

    1:
        begin
            // �����I����
            if cl.Count <= (inx + 1) then Exit;

            // ���X�g���甲���ĂP�O�ɑ}��
            co := cl.Data[ inx ];
            cl.Extract( co );
            cl.Insert( (inx + 1), co );

            inx := inx + 1;
        end;

    else
        Exit;
    end;

    //  �J�������X�g�\��
//    DispColumnListLayout( inx );


    // �J�����X�^�C���\��
    for i:=0 to HIGH( FColumnStyle ) do begin
        co := cl.Data[ i ] ;
//        FColumnStyle[i].Visible := (co <> nil);

        // �I�[�_�[�ԍ��Z�b�g
        if co <> nil then begin
            co.Column.F_Order   := IntToStr( i + 1 );
        end;

        // �I����ԃZ�b�g
        FColumnStyle[ i ].Select  := (i = inx);
    end;

    // �X�N���[�����Ă�������悤��
    CSScrollBox.ScrollInView( FColumnStyle[ inx ] );

    // �ĕ\��
    DispLayout( FOpenMode );
end;

//-----------------------------------------------------------------------------
//  �^�C�g������
//-----------------------------------------------------------------------------
procedure TProgramListForm.Edit1KeyPress(Sender: TObject; var Key: Char);
var
    cl : TColumnList;
    co : TColumnData;

begin

    // MAINTE LIST ����
    cl := ColumnList;
    co := cl.Data[ TEdit( Sender ).Tag ];

	case Integer( Key ) of
    VK_RETURN:
        begin
        	//	ENTER�������ꂽ
            // �m��

            co.Column.F_Text    := TEdit( Sender ).Text;

            // �ĕ\��
            DispLayout( FOpenMode );

{log}SetOpeLog( 'OPE:TProgramListForm.Edit1KeyPress', TEdit( Sender ).Text );

            key := #0;
        end;

    VK_ESCAPE:
        begin
        	// ESCAPE�������ꂽ

            TEdit( Sender ).Text    := co.Column.F_Text;

            key := #0;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//  �Z���{�^���N���b�N
//-----------------------------------------------------------------------------
procedure TProgramListForm.CellButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    l, b : integer;
    cl : TColumnList;

begin
    l := TMusFlatButton( Sender ).Tag div 100;
    b := TMusFlatButton( Sender ).Tag mod 100;

    cl := ColumnList;

    UiListCellButtonForm.Start( TUiListCellButton( cl.Data[ l ].Buttons.Data[ b ] ) );
end;

//-----------------------------------------------------------------------------
//  �I��p�`�F�b�N�{�b�N�X�N���b�N
//-----------------------------------------------------------------------------
procedure TProgramListForm.CheckBox1Click(Sender: TObject);
var
    cl : TColumnList;
    co : TColumnData;
    cinx : integer;

begin
        cinx := TCheckBox( Sender ).Tag;

    // MAINTE LIST ����
    cl := ColumnList;
    co := cl.Data[ cinx ];

    co.Column.F_IsVisible := BoolString( TCheckBox( Sender ).Checked );

    // �ĕ\��
    DispLayout( FOpenMode );
end;


end.
