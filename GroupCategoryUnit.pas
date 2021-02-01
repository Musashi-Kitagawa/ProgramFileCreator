//*****************************************************************************
//  �j���[�e���X�e�N�m������Гa���� �uPROGRAM FILE CREATOR�v
//  �J�e�S���ݒ���
//
//  Dec - 25 - '20
//  �����������
//*****************************************************************************
unit GroupCategoryUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Types, Vcl.Graphics, System.Contnrs, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, MusFlatButton, Vcl.Menus,
//
    ScreenDbUnit, CommonUnit;

type
//-----------------------------------------------------------------------------
//	�v���C���X�g�\���p
//-----------------------------------------------------------------------------
  TCategoryPanel	= class( TPanel )
  private
	FTitle		: string;
    FIndex	    : string;
    FID	        : string;

//    FUp         : TLabel;
//    FDown       : TLabel;

    procedure   DiapCategory;
    procedure   SetTitle( ttl : string );
    procedure   SetIndex( inx : string );
    procedure   SetID( id : string );

  protected
  	procedure 	Paint; override;

  public
	property	Title   : string	    read FTitle		write SetTitle;
	property	IndexNo	: string        read FIndex	    write SetIndex;
	property	ID	    : string        read FID        write SetID;

  end;

//-----------------------------------------------------------------------------
//	�v���C���X�g�\���p
//-----------------------------------------------------------------------------
  TCategoryPanelList = class( TObjectList )
    private

        function    GetData( index : integer ) :  TCategoryPanel;

        procedure   SetSelect( index : integer );
        function    GetSelect : integer;

  	public
        // �R���X�g���N�^
        constructor Create; virtual;

        // �f�X�g���N�^
        destructor 	Destroy; override;

		procedure   ClearAll;

        property    Data[index:integer] : TCategoryPanel	read GetData;
        property    Select : integer    read GetSelect      write SetSelect;
    end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

type
  TGroupCategoryForm = class(TForm)
    NoPanel: TPanel;
    NamePanel: TPanel;
    DispPanel: TPanel;
    CatePanel: TPanel;
    IndexPopupMenu: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    InputEdit: TEdit;
    RebuildButton: TMusFlatButton;
    UpLabel: TLabel;
    DownLabel: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CatePanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InputEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InputEditEnter(Sender: TObject);
    procedure InputEditExit(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure RebuildButtonClick(Sender: TObject);

  private
    { Private �錾 }

    FCatePanel      : array [0..9] of TCategoryPanel;

    procedure   DataTypeChangeMessage( var Msg : TMessage );    message WM_DATATYPE_CHANGE_MESSAGE;
    procedure   MakeCategoryPanel;

  public
    { Public �錾 }

    procedure   DispCategory;
  end;

var
  GroupCategoryForm: TGroupCategoryForm;

implementation

{$R *.dfm}

uses
    MainUnit, LogUtilUnit;

//-----------------------------------------------------------------------------
//  �f�[�^�^�C�v�iXPT�A�p�l���j�ύX�ʒm�j
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.DataTypeChangeMessage( var Msg : TMessage );
begin
{log}SetOpeLog( 'OPE:TGroupCategoryForm.DataTypeChangeMessage' );

    // �ĕ\��
    DispCategory;
end;

//-----------------------------------------------------------------------------
//  �}�E�X�_�E���C�x���g
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.CatePanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   cate : integer;
   po : TPoint;

begin
    cate := TPanel( Sender ).Tag;

{log}SetOpeLog( 'OPE:TGroupCategoryForm.CatePanelMouseDown', cate );

    if mbLeft = Button then begin
        // ����

        // ���̓��̓{�b�N�X�\��
        InputEdit.Parent    := FCatePanel[ cate ];
        InputEdit.Top       := 0;
        InputEdit.Left      := 50;
        InputEdit.Width     := NamePanel.Width;
        InputEdit.Text      := FCatePanel[ cate ].Title;
        InputEdit.Tag       := cate;
        InputEdit.Visible   := True;

        InputEdit.SetFocus;
    end
    else begin
        // �\����

        IndexPopupMenu.Tag  := cate;

        // �|�b�v�A�b�v���j���\��
        po := TPanel( Sender ).ClientToScreen( Point( x, y ) );
        IndexPopupMenu.Popup( po.X, po.Y );
    end;
end;

//-----------------------------------------------------------------------------
//  �E�B���h�E�쐬
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.FormCreate(Sender: TObject);
begin

    InputEdit.Visible   := False;

    NoPanel.Caption     := ' ' + NoPanel.Caption;
    NoPanel.Color       := TOP_COLOR;

    NamePanel.Caption   := ' ' + NamePanel.Caption;
    NamePanel.Color     := TOP_COLOR;

    DispPanel.Caption   := ' ' + DispPanel.Caption;
    DispPanel.Color     := TOP_COLOR;

    // �J�e�S���p�l���쐬
    MakeCategoryPanel;
end;

//-----------------------------------------------------------------------------
//  �J�e�S�����X�g�쐬
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.MakeCategoryPanel;
var
    i : integer;

begin
{log}SetOpeLog( 'OPE:TGroupCategoryForm.MakeCategoryPanel' );

    for i:=0 to HIGH( FCatePanel ) do begin

        FCatePanel[i]           := TCategoryPanel.Create( Self );
        FCatePanel[i].Parent    := Self;
        FCatePanel[i].Tag       := i;
        FCatePanel[i].ID        := '';
        FCatePanel[i].Left      := CatePanel.Left;
        FCatePanel[i].Height    := CatePanel.Height;
        FCatePanel[i].Width     := CatePanel.Width;
        FCatePanel[i].Top       := CatePanel.Top + (CatePanel.Height + 1) * i;
        FCatePanel[i].Caption   := '';
        FCatePanel[i].BevelOuter    := CatePanel.BevelOuter;
        FCatePanel[i].Font      := CatePanel.Font;
        FCatePanel[i].Visible   := True;
        FCatePanel[i].Tag       := i;

        FCatePanel[i].OnMouseDown   := CatePanelMouseDown;

        FCatePanel[i].ParentBackground  := False;
        if ((i mod 2) = 0) then FCatePanel[i].Color := EVEN_COLOR
        else FCatePanel[i].Color                    := ODD_COLOR;

{
        FCatePanel[i].FUp           := TLabel.Create( FCatePanel[i] );
        FCatePanel[i].FUp.Parent    := FCatePanel[i];
        FCatePanel[i].FUp.Font      := UpLabel.Font;
        FCatePanel[i].FUp.Left      := 200;
        FCatePanel[i].FUp.Tag       := (i * 100) + 0;

        FCatePanel[i].FDown         := TLabel.Create( FCatePanel[i] );
        FCatePanel[i].FDown.Parent  := FCatePanel[i];
        FCatePanel[i].FDown.Font    := DownLabel.Font;
        FCatePanel[i].FDown.Left    := 200;
        FCatePanel[i].FDown.Tag     := (i * 100) + 1;
}

    end;
end;

//-----------------------------------------------------------------------------
//  ���X�g�\��
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.DispCategory;
var
    i : integer;
    lst : TLayoutButtonList;
    sb : TUiScreenSelectButton;

begin
{log}SetOpeLog( 'OPE:TGroupCategoryForm.DispCategory' );

    lst := MainForm.CategoryList;

    for i:=0 to MainForm.MAX_CATEGORY-1 do begin

        if i < lst.Count then begin
            // �\��
            sb := TUiScreenSelectButton( lst.Data[i].Button );

            FCatePanel[i].Title     := sb.F_Text;
            FCatePanel[i].IndexNo   := sb.F_Order;
            FCatePanel[i].Visible   := True;
        end
        else begin
            // ��\��
            FCatePanel[i].Title     := '';
            FCatePanel[i].IndexNo   := '';
            FCatePanel[i].Visible   := False;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//  �\�����|�b�v�A�b�v���j��
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.N11Click(Sender: TObject);
var
    cate : TLayoutButton;
    n, cno : integer;

begin
{log}SetOpeLog( 'OPE:TGroupCategoryForm.N11Click' );

    // �ǂ��̃J�e�S���H
    cno := IndexPopupMenu.Tag;

    // �ύX���鏇�ԁi�P���΁j
    n   := TMenuItem( Sender ).Tag;

    // �\���ʒu�̏�������
    cate := MainForm.CategoryList.Data[ cno ];

    if cate = nil then Exit;

    // ���[�N�f�[�^�ύX
    TUiScreenSelectButton( cate.Button ).F_Left := Format( '.%d', [n-1] );

    // �\����������
    FCatePanel[ cno ].IndexNo   := IntToStr( n );

end;

//-----------------------------------------------------------------------------
//  �č\�z
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.RebuildButtonClick(Sender: TObject);
begin
    MainForm.RebuildProc;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.InputEditEnter(Sender: TObject);
begin
    ;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.InputEditExit(Sender: TObject);
begin
    InputEdit.Parent    := nil;
    InputEdit.Visible   := False;
end;

//-----------------------------------------------------------------------------
//  ���̓���
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    btn : TLayoutButton;

begin

	case Key of
    VK_RETURN:
        begin
        	//	ENTER�������ꂽ

            // �m��
            FCatePanel[ InputEdit.Tag ].Title   := InputEdit.Text;

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;

            // ���[�N�f�[�^�ɃZ�b�g
            btn := MainForm.CategoryList.Data[ InputEdit.Tag ];
            TuiScreenselectButton( btn.Button ).F_Text  := InputEdit.Text;

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

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	�J�X�^���p�l���֘A
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TCategoryPanel.SetTitle( ttl : string );
begin
	FTitle := ttl;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TCategoryPanel.SetIndex( inx : string );
begin
	FIndex := inx;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TCategoryPanel.SetID( id : string );
begin
	FID := id;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TCategoryPanel.Paint;
begin
    DiapCategory;
end;

//-----------------------------------------------------------------------------
//	�v���C���X�g�\��
//-----------------------------------------------------------------------------
procedure TCategoryPanel.DiapCategory;
//var
//	col : TColor;

begin
    if Caption <> '' then
		Caption  := '';

    // ���n
{
    // �O���f�[�V�����g�p
    if True = MainForm.ConfigData.GradColor then begin
		col := PerColor( Color, 50 );
    	GradientFillCanvas( Canvas,
				col,
        		Color,
            	RECT(0, 0, Width, Height), gdVertical );
    end;
}

    Canvas.Brush.Color	:= Color;
//	Canvas.FrameRect( Rect( 0, 0, Width, Height ) );
	Canvas.FillRect( Rect( 0, 0, Width, Height ) );

    // No.
    Canvas.Font.Name    := 'Arial Rounded MT Bold';
    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    if FID = '' then
        CenterTextRect( Canvas, Rect( 0, 0, 50, Height ), IntToStr( Tag+1 ) )
    else
        CenterTextRect( Canvas, Rect( 0, 0, 50, Height ), FID );

    // ����
    Canvas.Font.Name    := '���C���I';
    Canvas.Font.Size	:= 9;
    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    LeftTextRect( Canvas, Rect( 50+5, 0, 50+5+200, Height ), FTitle, True );

    // �\����
//    Canvas.Font.Name    := '���C���I';
//    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
//    Canvas.Font.Style	:= [];
//    Canvas.Font.Color	:= clBlack;

    CenterTextRect( Canvas, Rect( 250+5, 0, 250+5+80, Height ), FIndex, True );

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
// �R���X�g���N�^
//-----------------------------------------------------------------------------
constructor TCategoryPanelList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
// �f�X�g���N�^
//-----------------------------------------------------------------------------
destructor 	TCategoryPanelList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TCategoryPanelList.GetData( index : integer ) :  TCategoryPanel;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TCategoryPanel( Items[ index ] );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TCategoryPanelList.ClearAll;
var
    d : TCategoryPanel;

begin
    while True do begin
        d := Data[0];
        if d = nil then Break;

        Extract( d );
        d.Free;
    end;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TCategoryPanelList.SetSelect( index : integer );
var
    d : TCategoryPanel;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        d := Data[ i ];

        if i = index then begin
            d.Color := $000080ff;
        end
        else begin
            if (i mod 2) = 0  then  d.Color := EVEN_COLOR
            else                    d.Color := ODD_COLOR;
        end;
    end;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TCategoryPanelList.GetSelect : integer;
var
    d : TCategoryPanel;
    i : integer;

begin

    for i:=0 to Count-1 do begin
        d := Data[ i ];

        if d.Color = $000080ff then begin
            Result := i;
            Exit;
        end;
    end;

    Result := -1;
end;



{
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.DeleteButton( frid : integer );
var
    lst : TScreenList;
    i, j : integer;

begin

    lst := TScreenList.Create;

    // FRAME �폜
    MainForm.ScreenList.SearchSource( UiFrame_No, IntToStr( frid ), lst );
    for i:=0 to lst.Count-1 do begin

        DeleteButton( lst.Data[i].F_Id );

        MainForm.DeleteDataBase( lst.Data[i] );
    end;

    // �{�^���ނ̍폜
    for j:=UiScreenSelectButton_No to UiColorSrcKeyButton_No do begin

        lst.Empty;

        MainForm.ScreenList.SearchSource( j, IntToStr( frid ), lst );
        for i:=0 to lst.Count-1 do begin
            MainForm.DeleteDataBase( lst.Data[i] );
        end;

    end;

    lst.Free;
end;

//-----------------------------------------------------------------------------
//  �J�e�S�����̃t���[���A�{�^��������
//-----------------------------------------------------------------------------
procedure TGroupCategoryForm.Button1Click(Sender: TObject);
var
    cate : TLayoutButton;
    fr : TUiButton;

begin

    cate := MainForm.CategoryList.Data[ 0 ];

    fr := MainForm.ScreenList.SearchByName( UiFrame_No, TUiScreenSelectButton( cate.Button ).F_FrameName );

    if fr = nil then Exit;

    DeleteButton( fr.F_Id );

    MainForm.SaveDataBase2;

end;
}


end.
