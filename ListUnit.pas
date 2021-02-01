//*****************************************************************************
//  �j���[�e���X�e�N�m������Гa���� �uPROGRAM FILE CREATOR�v
//  ���X�g�ݒ���
//
//  Jan - 2 - '21
//  �����������
//*****************************************************************************
unit ListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Contnrs, AnsiStrings, System.Types,
//
    ScreenDbUnit, CommonUnit, MusFlatButton;

const
    LAYOUT_IMAGE_SIZE   = 1280;

type
//-----------------------------------------------------------------------------
//  ���C�A�E�g(�C���[�W)�\���p
//-----------------------------------------------------------------------------
  TListLayoutPanel	= class( TPanel )
  private

	FTitle		: string;
	FIDName 	: string;

    procedure   DispList;
    procedure   SetTitle( ttl : string );
    procedure   SetIDName( id : string );

  protected
  	procedure 	Paint; override;

  public

	property	Title   : string        read FTitle     write SetTitle;
	property	IDName  : string        read FIDName    write SetIDName;
  end;

//-----------------------------------------------------------------------------
//  ���́A�\�����ݒ�p
//-----------------------------------------------------------------------------
  TColumnStyle	= class( TPanel )
  private

    FCheck      : TCheckBox;
    FEdit       : TEdit;
    FLabel      : TLabel;
    FRadio      : array [0..8] of TRadioButton;
    FCell       : array [0..3] of TMusFlatButton;

    FSelect     : Boolean;

    procedure   SetSelect( sw : Boolean );
    function    GetRadio( n : integer ) : TRadioButton;
    procedure   SetRadio( n : integer; ra : TRadioButton );

    function    GetCellButton( index : integer ) : TMusFlatButton;
    procedure   SetCellButton( index : integer; btn : TMusFlatButton );
    function    GetCellCount : integer;

  public

    property	Check   : TCheckBox     read FCheck     write FCheck;
    property	Edit    : TEdit         read FEdit      write FEdit;
    property	CkLabel : TLabel        read FLabel     write FLabel;
//    property	Combo   : TComboBox     read FCombo     write FCombo;
    property	Radio[n:integer] : TRadioButton  read GetRadio   write SetRadio;
//    property	CellButton : TMusFlatButton     read FCell  write FCell;
    property	CellButton[index:integer] : TMusFlatButton     read GetCellButton   write SetCellButton;
    property	CellCount : integer     read GetCellCount;
    property	Select  : Boolean       read FSelect    write SetSelect;

  end;

type
  TListForm = class(TForm)
    NamePanel: TPanel;
    SelectComboBox: TComboBox;
    ComboBox1: TComboBox;
    KugiriCheckBox: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    IDCheckBox: TCheckBox;
    NameCheckBox: TCheckBox;
    XptCheckBox: TCheckBox;
    XptKugiriCheckBox: TCheckBox;
    ListPanel: TPanel;
    PanelTmp: TPanel;
    Label3: TLabel;
    CSScrollBox: TScrollBox;
    Panel1: TPanel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    UpLabel: TLabel;
    DownLabel: TLabel;
    AllCheckBox: TCheckBox;
    ComboBox2: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    RadioButton1: TRadioButton;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PanelTmpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure CSScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure UpLabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private �錾 }

    FLayoutPanel    : array [0..19] of TListLayoutPanel;
    FColumnStyle	: array [0..19] of TColumnStyle;

    procedure   DataTypeChangeMessage( var Msg : TMessage );    message WM_DATATYPE_CHANGE_MESSAGE;
    procedure   MakeComponent;
    function    GetSelectIndex : integer;

  public
    { Public �錾 }

    procedure   DispLists;

  end;

var
  ListForm: TListForm;

implementation

{$R *.dfm}

uses
    MainUnit, UiListColumnUnit, LogUtilUnit;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListForm.FormCreate(Sender: TObject);
begin

    MakeComponent;

end;

//------------------------------------------------------------------------------
//  DESTINATION/SOURCE �ύX
//------------------------------------------------------------------------------
procedure TListForm.DataTypeChangeMessage( var Msg : TMessage );
begin
    // �ĕ\��
    DispLists;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListForm.DispLists;
var
    cl : TColumnList;
    co : TColumnData;
    ra, i, l, w, fit : integer;
    cd : TColumnData;
    key : string;

begin
{log}SetOpeLog( 'OPE:TListForm.DispLists', MainForm.CurrentListType );

    // MAINTE LIST ����
    cl := MainForm.ColumnList;

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

    // ���C�A�E�g�p�l����\������
    l := 0;
    for i:=0 to cl.Count-1 do begin

        co := cl.Data[i];

        FLayoutPanel[i].Title   := co.Column.F_Text;
        FLayoutPanel[i].IDName  := co.Column.F_Width;
        FLayoutPanel[i].Left    := l;
        FLayoutPanel[i].Width   := XSize( co.Column.F_Width, LAYOUT_IMAGE_SIZE );
        FLayoutPanel[i].Visible := (co.Column.F_IsVisible = 'true');
        if True = FLayoutPanel[i].Visible then
            l := l + FLayoutPanel[i].Width;

        // FIT�����邽��
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
//        FLayoutPanel[ fit ].Width   := ListPanel.Width -  w;
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
    ListPanel.Width := l + 1;

    // ���C�A�E�g���X�g�\��
    for i:=0 to HIGH( FColumnStyle ) do begin

        cd := cl.Data[ i ] ;
        FColumnStyle[i].Visible := (cd <> nil);

        if cd <> nil then begin

            // �J��������
            if '' <> cd.Column.F_ColName then   key := cd.Column.F_ColName
            else                                key := cd.Column.F_ColAlias;
            FColumnStyle[i].CkLabel.Caption := Format( '%s (%s)', [key, cd.Column.F_Order] );

            // �I��p�`�F�b�N�{�b�N�X
            FColumnStyle[i].Check.OnClick       := nil;
            FColumnStyle[i].Check.Checked       := (cd.Column.F_IsVisible = 'true');
            FColumnStyle[i].Check.OnClick       := CheckBox1Click;

            // �J�����^�C�g��
            FColumnStyle[i].Edit.Text           := cd.Column.F_Text;

            // Alias�p���W�I�{�^��
            ra := cd.Alias;
            FColumnStyle[i].Radio[ ra ].OnClick := nil;
            FColumnStyle[i].Radio[ ra ].Checked := True;
            FColumnStyle[i].Radio[ ra ].OnClick := RadioButton1Click;
        end;

    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListForm.Edit1KeyPress(Sender: TObject; var Key: Char);
var
    cl, cl2 : TColumnList;
    co, co2 : TColumnData;
    ds, i, j, sel : integer;
    lst : TListLayoutList;

begin

    // MAINTE LIST ����
    cl := MainForm.ColumnList;
    co := cl.Data[ TEdit( Sender ).Tag ];

	case Integer( Key ) of
    VK_RETURN:
        begin
        	//	ENTER�������ꂽ
            // �m��

            co.Column.F_Text    := TEdit( Sender ).Text;

            // �ĕ\��
            DispLists;

{log}SetOpeLog( 'OPE:TListForm.Edit1KeyPress', TEdit( Sender ).Text );

            key := #0;

            if True <> AllCheckBox.Checked then Exit;

//-- ���̃O���[�v�����f������ -------------------------------------------------

            sel := MainForm.CurrentListGroup;
            ds  := MainForm.DestSource;
            lst := MainForm.ListLayoutList;

            for i:=0 to lst.Count-1 do begin
                if i = sel then continue;

                cl2 := lst.Data[i].ColumnList[ ds ];

                for j:=0 to cl2.Count-1 do begin
                    co2 := cl2.Data[ j ];
                    if ('' = co2.Column.F_ColName) or (co2.Column.F_ColName <> co.Column.F_ColName) then begin
                        if ('' = co2.Column.F_ColAlias) or (co2.Column.F_ColAlias <> co.Column.F_ColAlias) then begin
                            continue;
                        end;
                    end;

                    co2.Column.F_Text := co.Column.F_Text;
                    break;
                end;
            end;

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
//-----------------------------------------------------------------------------
procedure TListForm.MakeComponent;
var
    i, j : integer;
    ra : TRadioButton;
    pnl : TListLayoutPanel;
    ed : TEdit;
    ck : TCheckBox;
    lb : TLabel;

begin
{log}SetOpeLog( 'OPE:TListForm.MakeComponent' );

    ListPanel.Color     := TOP_COLOR;

    // ���C�A�E�g�{�^��
    for i:=0 to HIGH( FLayoutPanel ) do begin
        pnl             := TListLayoutPanel.Create( ListPanel );
        pnl.Parent      := ListPanel;
        pnl.Width       := PanelTmp.Width;
        pnl.Height      := PanelTmp.Height;
        pnl.Top         := PanelTmp.Top;
        pnl.Left        := 0 + (PanelTmp.Width + 2) * i;
        pnl.BevelKind   := PanelTmp.BevelKind;
        pnl.BevelOuter  := PanelTmp.BevelOuter;
        pnl.ParentBackGround    := False;
        pnl.Caption     := '';
        pnl.Color       := PanelTmp.Color;
        pnl.Tag         := i;
        pnl.Visible     := False;
        pnl.DoubleBuffered      := True;
        pnl.OnMouseDown := PanelTmpMouseDown;

        FLayoutPanel[i]  := pnl;
    end;

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

        // �I���I���I�t�p�`�F�b�N�{�b�N�X
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

        // ColType
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

        // Alias �I��p���W�I�{�^��
        for j:=0 to 9-1 do begin

            ra := TRadioButton.Create( FColumnStyle[i] );
            ra.Parent   := FColumnStyle[i];
            ra.Left     := ComboBox2.Left + (j * (70+1)) + 30;
            ra.Top      := 5;
            ra.Font     := ComboBox2.Font;
            ra.Tag      := (i * 100) + j;
            ra.Caption  := '';
            ra.OnClick  := RadioButton1Click;

            FColumnStyle[i].Radio[j]     := ra;
        end;

        FColumnStyle[i].Tag     := i;
    end;

end;

//-----------------------------------------------------------------------------
//  �I��p�`�F�b�N�{�b�N�X �N���b�N
//-----------------------------------------------------------------------------
procedure TListForm.CheckBox1Click(Sender: TObject);
var
    cl, cl2 : TColumnList;
    co, co2 : TColumnData;
    ds, i, j, sel, cinx : integer;
    lst : TListLayoutList;

begin

    cinx := TCheckBox( Sender ).Tag;

    // MAINTE LIST ����
    cl := MainForm.ColumnList;
    co := cl.Data[ cinx ];

    co.Column.F_IsVisible := BoolString( TCheckBox( Sender ).Checked );

    // �ĕ\��
    DispLists;

    if True <> AllCheckBox.Checked then Exit;

//-- ���̃O���[�v�����f������ -------------------------------------------------

    sel := MainForm.CurrentListGroup;
    ds  := MainForm.DestSource;
    lst := MainForm.ListLayoutList;

    for i:=0 to lst.Count-1 do begin
        if i = sel then continue;

        cl2 := lst.Data[i].ColumnList[ ds ];

        for j:=0 to cl2.Count-1 do begin

            co2 := cl2.Data[ j ];

            if ('' = co2.Column.F_ColName) or (co2.Column.F_ColName <> co.Column.F_ColName) then begin
                if ('' = co2.Column.F_ColAlias) or (co2.Column.F_ColAlias <> co.Column.F_ColAlias) then begin
                    continue;
                end;
            end;

            co2.Column.F_IsVisible := co.Column.F_IsVisible;
            break;
        end;

    end;

end;

//-----------------------------------------------------------------------------
//  Aliace�I��p���W�I�{�^�� �N���b�N
//-----------------------------------------------------------------------------
procedure TListForm.RadioButton1Click(Sender: TObject);
var
    cl, cl2 : TColumnList;
    co, co2 : TColumnData;
    ds, i, j, sel, cinx, ainx : integer;
    lst : TListLayoutList;

begin

    cinx := TCheckBox( Sender ).Tag div 100;
    ainx := TCheckBox( Sender ).Tag mod 100;

    // MAINTE LIST ����
    cl := MainForm.ColumnList;
    co := cl.Data[ cinx ];

    // ALIAS �Z�b�g
    co.Alias := ainx;

    if True <> AllCheckBox.Checked then Exit;

//-- ���̃O���[�v�����f������ -------------------------------------------------

    sel := MainForm.CurrentListGroup;
    ds  := MainForm.DestSource;
    lst := MainForm.ListLayoutList;

    for i:=0 to lst.Count-1 do begin
        if i = sel then continue;

        cl2 := lst.Data[i].ColumnList[ ds ];

        for j:=0 to cl2.Count-1 do begin

            co2 := cl2.Data[ j ];

            if ('' = co2.Column.F_ColName) or (co2.Column.F_ColName <> co.Column.F_ColName) then begin
                if ('' = co2.Column.F_ColAlias) or (co2.Column.F_ColAlias <> co.Column.F_ColAlias) then begin
                    continue;
                end;
            end;

            co2.Alias := ainx;
            break;
        end;

    end;

end;

//-----------------------------------------------------------------------------
//  �p�l���I���I���I�t
//-----------------------------------------------------------------------------
procedure TListForm.Panel1Click(Sender: TObject);
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
//  �p�l���I���C���f�b�N�X�擾
//-----------------------------------------------------------------------------
function TListForm.GetSelectIndex : integer;
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
//  �}�E�X�z�C�[��
//-----------------------------------------------------------------------------
procedure TListForm.CSScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
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
//  �����C���[�W�\�� �}�E�X�_�E��
//-----------------------------------------------------------------------------
procedure TListForm.PanelTmpMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    cl : TColumnList;
    co : TColumnData;

begin
{log}SetOpeLog( 'OPE:TListForm.PanelTmpMouseDown' );

    // MAINTE LIST ����
    cl := MainForm.ColumnList;

    co := cl.Data[ Tpanel( Sender ).Tag ];
    if nil = co then Exit;

    UiListColumnForm.Start( co.Column, cl.List );
end;

//-----------------------------------------------------------------------------
//  �㉺�ړ��{�^������
//-----------------------------------------------------------------------------
procedure TListForm.UpLabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    cl, cl2, tmp : TColumnList;
    co, co2 : TColumnData;
    inx, ds, i, j, k, sel : integer;
    lst : TListLayoutList;

begin

    inx     := GetSelectIndex;

    // �I���Ȃ�
    if inx = -1 then Exit;

    // MAINTE LIST ����
    cl := MainForm.ColumnList;

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

    // �J�����X�^�C���\��
    for i:=0 to HIGH( FColumnStyle ) do begin
        co := cl.Data[ i ] ;
        FColumnStyle[i].Visible := (co <> nil);

        if co <> nil then begin

            co.Column.F_Order   := IntToStr( i + 1 );

            if '' <> co.Column.F_ColName then
                FColumnStyle[i].CkLabel.Caption := Format( '%s (%s)', [co.Column.F_ColName, co.Column.F_Order] )
            else
                FColumnStyle[i].CkLabel.Caption := Format( '%s (%s)', [co.Column.F_ColAlias, co.Column.F_Order] );

            FColumnStyle[i].Check.OnClick       := nil;
            FColumnStyle[i].Check.Checked       := (co.Column.F_IsVisible = 'true');
            FColumnStyle[i].Check.OnClick       := CheckBox1Click;

            FColumnStyle[i].Edit.Text           := co.Column.F_Text;

        end;

        FColumnStyle[ i ].Select  := (i = inx);
    end;

    CSScrollBox.ScrollInView( FColumnStyle[ inx ] );

    DispLists;

    if True <> AllCheckBox.Checked then Exit;

//-- ���̃O���[�v�����f������ -------------------------------------------------

    sel     := MainForm.CurrentListGroup;
    ds      := MainForm.DestSource;
    lst    := MainForm.ListLayoutList;

    tmp := TColumnList.Create;

    for j:=0 to lst.Count-1 do begin

        if j = sel then continue;

        tmp.Empty;

        cl2 := lst.Data[j].ColumnList[ ds ];

        for i:=0 to cl.Count-1 do begin

            co := cl.Data[ i ];


            for k:=0 to cl2.Count-1 do begin

                co2 := cl2.Data[ k ];

                if ('' = co2.Column.F_ColName) or (co2.Column.F_ColName <> co.Column.F_ColName) then begin
                    if ('' = co2.Column.F_ColAlias) or (co2.Column.F_ColAlias <> co.Column.F_ColAlias) then begin
                        continue;
                    end;
                end;

                cl2.Extract( co2 );

                co2.Column.F_Order   := co.Column.F_Order;
                tmp.Add( co2 );
                break;
            end;

        end;


        while True do begin

            co2 := tmp.Data[0];
            if co2 = nil then break;

            tmp.Extract( co2 );

            cl2.Add( co2 );
        end;

    end;

    tmp.Free;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	�J�X�^���p�l���֘A
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListLayoutPanel.SetTitle( ttl : string );
begin
	FTitle  := ttl;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListLayoutPanel.SetIDName( id : string );
begin
	FIDName  := id;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListLayoutPanel.Paint;
begin
    DispList;
end;

//-----------------------------------------------------------------------------
//	�v���C���X�g�\��
//-----------------------------------------------------------------------------
procedure TListLayoutPanel.DispList;
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
	Canvas.FrameRect( Rect( 0, 0, Width, Height ) );

    // ALIAS
    Canvas.Font.Name    := '���C���I';
    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;
    CenterTextRect( Canvas, Rect( 0, 0, Width, (Height div 2) ), FTitle );

    // ID����
    Canvas.Font.Name    := '���C���I';
    Canvas.Font.Size	:= 9;
    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;
    CenterTextRect( Canvas, Rect( 0, (Height div 2), Width, Height ), FIDName );


end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColumnStyle.SetSelect( sw : Boolean );
begin
    FSelect := sw;

    if True = sw then begin
        Color   := $000080ff
    end
    else begin
        if 0 = (tag mod 2) then Color := EVEN_COLOR
        else                    Color := ODD_COLOR;

    end;

//    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TColumnStyle.GetRadio( n : integer ) : TRadioButton;
begin
    Result := FRadio[ n ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColumnStyle.SetRadio( n : integer; ra : TRadioButton );
begin
    FRadio[ n ] := ra;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TColumnStyle.GetCellButton( index : integer ) : TMusFlatButton;
begin
    Result := FCell[ index ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColumnStyle.SetCellButton( index : integer; btn : TMusFlatButton );
begin
    FCell[ index ] := btn;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TColumnStyle.GetCellCount : integer;
begin
    Result := Length( FCell );
end;


end.











//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	�J�X�^���p�l���֘A
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

(*
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListPanel.SetTitle( ttl : string );
begin
	FTitle  := ttl;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListPanel.Paint;
begin
    DispList;
end;

//-----------------------------------------------------------------------------
//	�v���C���X�g�\��
//-----------------------------------------------------------------------------
procedure TListPanel.DispList;
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
	Canvas.FrameRect( Rect( 0, 0, Width, Height ) );

    // ALIAS
    Canvas.Font.Name    := 'Arial Rounded MT Bold';
    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;
    CenterTextRect( Canvas, Rect( 0, 0, 100, Height ), FTitle );

    // ID����
    Canvas.Font.Name    := '���C���I';
    Canvas.Font.Size	:= 9;
    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    LeftTextRect( Canvas, Rect( 60, 0, 60+100, Height ), FIDName );

    // �f�ޖ���
    LeftTextRect( Canvas, Rect( 160, 0, 160+100, Height ), FMaterial );


    // �\����
//    Canvas.Font.Name    := '���C���I';
//    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
//    Canvas.Font.Style	:= [];
//    Canvas.Font.Color	:= clBlack;

//    CenterTextRect( Canvas, Rect( 250, 0, 250+80, Height ), IntToStr( FIndex ), True );

end;

*)

{
//-----------------------------------------------------------------------------
//  �ݒ�p
//-----------------------------------------------------------------------------
  TListPanel	= class( TPanel )
  private
	FTitle		: string;
	FIDName 	: string;
	FMaterial 	: string;

    FCheck      : array [0..7] of TCheckBox;
    FRadio      : array [0..7] of TRadioButton;

    procedure   DispList;
    procedure   SetTitle( ttl : string );

  protected
  	procedure 	Paint; override;

  public

	property	Title   : string        read FTitle     write SetTitle;

  end;
}


(*
//-----------------------------------------------------------------------------
//  �O���[�v�� �}�E�X�_�E��
//-----------------------------------------------------------------------------
procedure TListForm.NamePanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    col : integer;
    cl : TColumnList;
    co : TColumnData;

begin
{log}SetOpeLog( 'OPE:TGroupForm.NamePanelMouseDown' );

    col := TPanel( Sender ).Tag;

    if mbLeft = Button then begin

        // ���̓��̓{�b�N�X�\��
        InputEdit.Parent    := Self;
        InputEdit.Top       := FColmnNamePanel[col].Top;
        InputEdit.Left      := FColmnNamePanel[col].Left;
        InputEdit.Text      := FColmnNamePanel[col].Caption;
        InputEdit.Tag       := col;
        InputEdit.Visible   := True;
        InputEdit.BringToFront;
        InputEdit.SetFocus;

    end
    else begin

//        FColmnNamePanel[col].Enabled := not FColmnNamePanel[col].Enabled;

        // MAINTE LIST ����
        cl := MainForm.ColumnList;

        case MainForm.DestSource of
        TMainForm.typDst:
            begin
                case col of
{
                1:  // ID����
                    begin
                        co := cl.Data[7];
                        co.Column.F_IsVisible := 'true';
                    end;

                2:  // �f�ޖ���
                    begin
                        co := cl.Data[8];
                        FListPanel[8].FCheck[1].Checked := (co.Column.F_IsVisible = 'true');
                    end;
}
                5:  // �\�����[�h
                    begin
                        co := cl.Data[6];
//                        if True = FColmnNamePanel[col].Enabled then
                        if co.Column.F_IsVisible = 'true' then
                            co.Column.F_IsVisible := 'false'
                        else
                            co.Column.F_IsVisible := 'true';
                    end;

                end;
            end;

        TMainForm.typSrc:
            begin
                case col of

                5:  // �\�����[�h
                    begin
                        co := cl.Data[7];
//                        if True = FColmnNamePanel[col].Enabled then
                        if co.Column.F_IsVisible = 'true' then
                            co.Column.F_IsVisible := 'false'
                        else
                            co.Column.F_IsVisible := 'true';
                    end;

                end;
            end;



        end;

        // �ĕ\��
        DispLists;


    end;


end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListForm.InputEditEnter(Sender: TObject);
begin
    ;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListForm.InputEditExit(Sender: TObject);
begin
    InputEdit.Parent    := nil;
    InputEdit.Visible   := False;
end;

//-----------------------------------------------------------------------------
//  �^�C�g������
//-----------------------------------------------------------------------------
procedure TListForm.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

	case Key of
    VK_RETURN:
        begin
        	//	ENTER�������ꂽ

            // �m��
//k2            FColmnNamePanel[ InputEdit.Tag ].Caption    := InputEdit.Text;

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;

            // ���[�N�f�[�^�ɃZ�b�g
//            grp := MainForm.Group.List.Data[ InputEdit.Tag ];
//            TuiScreenselectButton( grp.Button ).F_Text  := InputEdit.Text;

{log}SetOpeLog( 'OPE:TListForm.InputEditKeyDown', InputEdit.Text );
        end;

    VK_ESCAPE:
        begin
        	// ESCAPE�������ꂽ

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;
        end;
    end;

end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListForm.CheckBoxTempClick(Sender: TObject);
var
    cl : TColumnList;
    co : TColumnData;
    chk : Boolean;

begin
{log}SetOpeLog( 'OPE:TListForm.CheckBoxTempClick' );

    cl  := MainForm.ColumnList;
    chk := TCheckBox( Sender ).Checked;

    case MainForm.DestSource of
    TMainForm.typDst:
        begin
            case TCheckBox( Sender ).Tag of
            0:  co := cl.Data[7];  // ID����LINK
            1:  co := cl.Data[8];  // �f�ޖ���LINK
            else Exit;
            end;
        end;

    TMainForm.typSrc:
        begin
            case TCheckBox( Sender ).Tag of
            0:  co := cl.Data[9];  // ID����LINK
            1:  co := cl.Data[10];  // �f�ޖ���LINK
            2:  co := cl.Data[8];  // �n��LINK
            else Exit;
            end;
        end;

    else
        Exit;
    end;

    if True = chk then  co.Column.F_IsVisible   := 'true'
    else                co.Column.F_IsVisible   := 'false';

    DispLists;
end;
*)

(*
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListForm.KugiriCheckBoxClick(Sender: TObject);
var
    cl : TColumnList;
    co : TColumnData;
    chk : Boolean;

begin
{log}SetOpeLog( 'OPE:TListForm.KugiriCheckBoxClick' );

    cl  := MainForm.ColumnList;
    chk := TCheckBox( Sender ).Checked;

    case MainForm.DestSource of
    TMainForm.typDst:
        begin
            case TCheckBox( Sender ).Tag of
            0:  co := cl.Data[10];  // ��؂蕶��
            1:  co := cl.Data[9];   // ID���̕�����
            2:  co := cl.Data[11];  // NAME���M
            3:  co := cl.Data[12];  // XPT���M�Ώ�
            4:  co := cl.Data[13];  // XPT��؂�
            else Exit;
            end;
        end;

    TMainForm.typSrc:
        begin
            case TCheckBox( Sender ).Tag of
            0:  co := cl.Data[12];  // ��؂蕶��
            1:  co := cl.Data[11];  // ID���̕�����
            2:  co := cl.Data[13];  // NAME���M
//            3:  co := cl.Data[12];  // XPT���M�Ώ�
//            4:  co := cl.Data[13];  // XPT��؂�
            else Exit;
            end;
        end;

    else Exit;
    end;

    if True = chk then  co.Column.F_IsVisible   := 'true'
    else                co.Column.F_IsVisible   := 'false';

    DispLists;
end;
*)

(*
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TListForm.GetAlias( key : string; ds : integer ) : integer;
var
    slst : TSbSrcNameBusList;
    dlst : TSbDstNameBusList;
    s : TSbSrcNameBus;
    d : TSbDstNameBus;
    ret, i : integer;

begin
    ret := -1;

    case ds of
    TMainForm.TypDst:
        begin
            dlst := MainForm.SBusDb.SbDstNameBusList;
            for i:=0 to dlst.Count-1 do begin

                d := dlst.Data[i];

                if (key <> '') and (('F_' + d.F_Name) = key) then begin
                    ret := StrToIntDef( d.F_AliasNo, -1 );
                    break;
                end;
            end;
        end;

    TMainForm.TypSrc:
        begin
            slst := MainForm.SBusDb.SbSrcNameBusList;
            for i:=0 to slst.Count-1 do begin

                s := slst.Data[i];

                if (key <> '') and (('F_' + s.F_Name) = key) then begin
                    ret := StrToIntDef( s.F_AliasNo, -1 );
                    break;
                end;
            end;
        end;

    end;

    if ret < 0 then begin
        Result := 8;
    end
    else begin
        Result := ret;
    end;

end;
*)
