//*****************************************************************************
//  �j���[�e���X�e�N�m������Гa���� �uPROGRAM FILE CREATOR�v
//  �O���[�v�ݒ���
//
//  Dec - 25 - '20
//  �����������
//*****************************************************************************
unit GroupUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Contnrs,
  System.Types,
  Vcl.Samples.Spin,
//
    MusFlatButton, ScreenDbUnit, CommonUnit;

type
//-----------------------------------------------------------------------------
//	�v���C���X�g�\���p
//-----------------------------------------------------------------------------
  TterminalPanel	= class( TPanel )
  private
	FTermNo		: integer;
	FIDName 	: string;
	FMaterial 	: string;
//    FGrpCheck   : array [0..MAX_GROUP-1] of TCheckBox;
    FGrpCheck   : array of TCheckBox;
    FPortEnable    : Boolean;

    procedure   DispGroup;
    procedure   SetTermNo( no : integer );
    procedure   SetIDName( nm : string );

    procedure   SetPortEnable( ena : Boolean );

  protected
  	procedure 	Paint; override;

  public

    constructor Create(AOwner: TComponent); override;

	property	TermNo   : integer	    read FTermNo		write SetTermNo;
	property	IDName 	: string        read FIDName 	    write SetIDName;

	property	PortEnable : Boolean                        write SetPortEnable;

  end;


type
  TGroupForm = class(TForm)
    GScrollBox: TScrollBox;
    NoPanel: TPanel;
    IDPanel: TPanel;
    MatPanel: TPanel;
    GPanel: TPanel;
    TerPanel: TPanel;
    GRPPanel: TPanel;
    InputEdit: TEdit;
    NextLabel: TLabel;
    TopLabel: TLabel;
    EndLabel: TLabel;
    BackLabel: TLabel;
    CheckBoxTemp: TCheckBox;
    PageSpinEdit: TSpinEdit;
    AllOffButton: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure GPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InputEditEnter(Sender: TObject);
    procedure InputEditExit(Sender: TObject);
    procedure InputEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TerPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure PageSpinEditChange(Sender: TObject);
    procedure TopLabelClick(Sender: TObject);
    procedure CheckBoxTempClick(Sender: TObject);
    procedure AllOffButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private �錾 }

    FGroupPanel     : array [0..9] of TPanel;
    FTermPanel      : array [0..MAX_PAGE_BUTTON-1] of TTerminalPanel;

    FWorkSelect     : array [ 0..MAX_PORT-1{�f�ސ�}, 0..9{�O���[�v��}, 0..1{DEST/SOURCE} ] of Boolean;

    FUpdateBusy     : Boolean;

    procedure   DataTypeChangeMessage( var Msg : TMessage );        message WM_DATATYPE_CHANGE_MESSAGE;

    procedure   MakeComponent;
    function    SearchButton( grp, port : integer ) : TLayoutButton;
    procedure   MakeLayoutButton;
    procedure   AllClear;

  public
    { Public �錾 }

    procedure   DispXPTGroup;   //( opt : integer );

  end;

var
  GroupForm: TGroupForm;

implementation

{$R *.dfm}

uses
    MainUnit, LogUtilUnit;

//-----------------------------------------------------------------------------
//  �f�[�^�^�C�v�iXPT�A�p�l���j
//-----------------------------------------------------------------------------
procedure TGroupForm.DataTypeChangeMessage( var Msg : TMessage );
begin
{log}SetOpeLog( 'OPE:TGroupForm.DataTypeChangeMessage', Msg.LParam );

    case Msg.LParam of
    0:  DispXPTGroup;   //( 0{�S�ď�������} );    // �f�[�^�^�C�v�ύX
    1:  DispXPTGroup;   //( 0{�S�ď�������} );    // �J�e�S���ύX
    3:  DispXPTGroup;   //( 0{�S�ď�������} );
    end;

end;

//-----------------------------------------------------------------------------
//  �R���|�[�l���g�쐬
//-----------------------------------------------------------------------------
procedure TGroupForm.MakeComponent;
var
    i, j : integer;
    ter : TTerminalPanel;
    chk : TCheckBox;

begin
{log}SetOpeLog( 'OPE:TGroupForm.MakeComponent' );

    // �O���[�v���p�l��
    for i:=0 to HIGH( FGroupPanel ) do begin
        FGroupPanel[i]  := TPanel.Create( Self );
        FGroupPanel[i].Parent   := Self;

        FGroupPanel[i].Width    := GPanel.Width;
        FGroupPanel[i].Height   := GPanel.Height;
        FGroupPanel[i].Top      := GPanel.Top;
        FGroupPanel[i].Left     := GPanel.Left + (GPanel.Width + 1) * i;
        FGroupPanel[i].Font     := GPanel.Font;
        FGroupPanel[i].Tag      := i;
        FGroupPanel[i].ParentBackGround := False;
        FGroupPanel[i].Color    := GPanel.Color;
        FGroupPanel[i].BevelKind    := GPanel.BevelKind;
        FGroupPanel[i].BevelOuter   := GPanel.BevelOuter;
        FGroupPanel[i].Color    := GPanel.Color;
        FGroupPanel[i].Caption  := '';

        FGroupPanel[i].OnMouseDown  := GPanelMouseDown;
    end;

    // �O���[�v�p�p�l��
    for i:=0 to HIGH( FTermPanel ) do begin
        ter         := TTerminalPanel.Create( GScrollBox );
        ter.Parent  := GScrollBox;

        ter.Width   := TerPanel.Width;
        ter.Height  := TerPanel.Height;
        ter.Left    := TerPanel.Left;
        ter.Top     := TerPanel.Top + (TerPanel.Height + 1) * i;
        ter.Tag     := i;
        ter.ParentBackGround := False;

        ter.OnMouseDown := TerPanelMouseDown;

        if ((i mod 2) = 0) then ter.Color := ODD_COLOR
        else ter.Color                    := EVEN_COLOR;

        ter.Caption := '';
        ter.TermNo  := i + 1;

        // �`�F�b�N�{�b�N�X�쐬
        SetLength( ter.FGrpCheck, MainForm.MAX_GROUP );

        for j:=0 to MainForm.MAX_GROUP-1 do begin

            chk         := TCheckBox.Create( ter );
            chk.Parent  := ter;
            chk.Left    := 18 + 280 + (90 + 1) * j;
            chk.Width   := 15;
            chk.Top     := CheckBoxTemp.Top;

            chk.Tag     := (i * 100) + j;
            chk.OnClick := CheckBoxTempClick;

            ter.FGrpCheck[j] := chk;
        end;

        FTermPanel[i] := ter;
    end;

end;

//-----------------------------------------------------------------------------
//  �`�F�b�N�{�b�N�X �N���b�N
//-----------------------------------------------------------------------------
procedure TGroupForm.CheckBoxTempClick(Sender: TObject);
begin
{log}SetOpeLog( 'OPE:TGroupForm.CheckBoxTempClick' );

    if False = FUpdateBusy then
        MakeLayoutButton;   //SaveProc;
end;

//-----------------------------------------------------------------------------
//  �\��
//-----------------------------------------------------------------------------
procedure TGroupForm.DispXPTGroup;
var
    pg, pgmin, pgmax, p, i, j, ds, po : integer;
    d : TUiDstButton;
    s : TUiSrcButton;
    pd : TUiPanelDstButton;
    ps : TUiPanelSrcButton;
    grp : TLayoutData;
    lay : TLayoutData;
    btn : TLayoutButton;
    ui : TUiButton;

begin
{log}SetOpeLog( 'OPE:TGroupForm.DispXPTGroup' );

    FUpdateBusy := True;

    pg      := PageSpinEdit.Value - 1;
    pgmin   := pg * MAX_PAGE_BUTTON + 1;
    pgmax   := pgmin + MAX_PAGE_BUTTON - 1;

    ds      := MainForm.DestSource;

    // �������i�I�[���I�t�j
    for i:=0 to HIGH( FTermPanel ) do begin

        if (i + (pg*MAX_PAGE_BUTTON)) > HIGH( FWorkSelect ) then begin

            // 0 �` 4095 �ȊO
            FTermPanel[i].TermNo := -1;
            for j:=0 to MainForm.MAX_GROUP-1 do begin
                FTermPanel[i].FGrpCheck[j].Visible  := False;
            end;

        end
        else begin

            FTermPanel[i].TermNo := (pg * MAX_PAGE_BUTTON + 1) + i;

            po := FTermPanel[i].TermNo;
            FTermPanel[i].PortEnable    := MainForm.CheckXptPortRange( po, ds );

            for j:=0 to MainForm.MAX_GROUP-1 do begin

                if FTermPanel[i].FGrpCheck[j].Visible <> True then
                    FTermPanel[i].FGrpCheck[j].Visible  := True;

                FTermPanel[i].FGrpCheck[j].Checked  := False;

                FWorkSelect[ i + (pg*MAX_PAGE_BUTTON), j, ds ] := False;
            end;
        end;
    end;

    // �O���[�v�� �N���A
    for i:=0 to HIGH( FGroupPanel ) do begin
        FGroupPanel[i].Caption  := '';
    end;

    // �O���[�v�̃��X�g
//    grp     := DATA_TYPE{MainForm.FLayoutData[ DATA_TYPE ]}.Group[ MainForm.CurrentCategory, ds ];       //List.Data[ FCurrentCategory ];
    grp     := MainForm.Group;

    if grp <> nil then begin

        for i:=0 to grp.List.Count-1 do begin

            btn := grp.List.Data[i];
            if btn = nil then break;

            // �O���[�v���̃Z�b�g
            FGroupPanel[i].Caption  := TUiScreenSelectButton( btn.Button ).F_Text;

            lay := btn.FChild[ ds ];
            if lay = nil then continue;

            for j:=0 to lay.list.count-1 do begin

                p := -1;

                ui := lay.List.Data[j].Button;
                if nil = ui then Continue;

                case mainForm.DestSourceType of
                0:  // XPT + DESTINATION
                    begin
                        d := TUiDstButton( ui );
                        if d.FDataType = UiDstButton_No then
                            p := StrToInt( d.F_DstPortNo );
                    end;

                1:  // XPT + SOURCE
                    begin
                        s := TUiSrcButton( ui );
                        if s.FDataType = UiSrcButton_No then
                            p := StrToInt( s.F_SrcPortNo );
                    end;

                2:  // PANEL + DESTINATION
                    begin
                        pd := TUiPanelDstButton( ui );
                        if pd.FDataType = UiPanelDstButton_No then
                            p := StrToInt( pd.F_DstPortNo );
                    end;

                3:  // PANEL + SOURCE
                    begin
                        ps := TUiPanelSrcButton( ui );
                        if ps.FDataType = UiPanelSrcButton_No then
                            p := StrToInt( ps.F_SrcPortNo );
                    end;

                end;

                if (pgmin <= p) and (p <= pgmax) then begin

                    FTermPanel[ p - ((pg * MAX_PAGE_BUTTON) + 1) ].FGrpCheck[i].Checked := True;

                    FWorkSelect[ p-1, i, ds ] := True;
                end;


            end;

        end;

    end;

    FUpdateBusy := False;

    // ID���́A�f�ޖ��̕\��

(*
    for i:=0 to 50-1 do begin

        case ds of
        0:
            begin
                lst := MainForm.ProgramList.DestinationList;
                dst := lst.Data[ (pg * 50) + i ];

                if dst = nil then break;

                FTermPanel[i].IDName    := dst.F_DefaultDescription;
            end;

        1:
            begin
                slst := MainForm.ProgramList.SourceList;
                src := slst.Data[ (pg * 50) + i ];

                if src = nil then break;

                FTermPanel[i].IDName    := src.F_DefaultDescription;
            end;

        end;

    end;
*)

end;

//-----------------------------------------------------------------------------
//  XPT�A�p�l�����C�X�ƃ{�^���쐬�A�폜
//-----------------------------------------------------------------------------
procedure TGroupForm.MakeLayoutButton;   //SaveProc;
var
    pg, j, i, ds : integer;
    btn : TLayoutButton;
    lst : TLayoutButtonList;
    glay : TLayoutData;
    sb : TUiButton;
    flg : Boolean;

begin
{log}SetOpeLog( 'OPE:TGroupForm.MakeLayoutButton' );

    pg  := PageSpinEdit.Value - 1;
    ds  := MainForm.DestSource;

    flg := False;

    // �������m�F
    for i:=0 to HIGH( FTermPanel ) do begin

        for j:=0 to HIGH( FWorkSelect[i] ) do begin

            // �ω��Ȃ�
            if FWorkSelect[ (i+(pg*MAX_PAGE_BUTTON)), j, ds ] = FTermPanel[i].FGrpCheck[j].Checked then continue;

            glay    := MainForm._GroupLayout[ j ];
            lst     := MainForm._GroupLayoutList[ j ];

            if True = FTermPanel[i].FGrpCheck[j].Checked then begin

                // �ǉ�
                sb := MainForm.MakeDestinationButton(
                            MainForm.GetMaxDestinationId( ds ),     // ID
                            glay.Frame.F_Id,                        // �eID
                            ((pg*MAX_PAGE_BUTTON)+i) + 1{�[�q�ԍ�}, // PORT
                            ds );                                   // DEST/SOURCE

                btn             := TLayoutButton.Create;
                btn.Button      := sb;

                // ���[�N���X�g�֒ǉ�
                lst.Add( btn );

                flg := True;
            end
            else begin

                // �Ώۂ�T��
                btn := SearchButton( j, ((pg*MAX_PAGE_BUTTON)+i) + 1{�[�q�ԍ�} );
                if btn = nil then continue;

                // �폜
                lst.Extract( btn );
                btn.Free;

                flg := True;
            end;

            // ���[�N�ɃZ�b�g
            FWorkSelect[ (i+(pg*MAX_PAGE_BUTTON)), j, ds ] := FTermPanel[i].FGrpCheck[j].Checked;
        end;

    end;

    // �ύX�L�̎��AUNDO�ɒǉ�
    if True = flg then
        MainForm.MakeUndo;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupForm.AllOffButtonClick(Sender: TObject);
begin
    // �S�f�[�^�폜
    AllClear;

    DispXPTGroup;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function SetXptCoodinate( var btn : TUiButton; index : integer ) : TUiButton;
var
    l, t : string;

begin
    index := (index mod 50);

    l := Format( '.%d', [index mod 10] );
    t := Format( '.%d', [index div 10] );

    case btn.FDataType of
    UiDstButton_No:
        begin
            TUiDstButton( btn ).F_Left  := l;
            TUiDstButton( btn ).E_Left  := True;
            TUiDstButton( btn ).F_Top   := t;
            TUiDstButton( btn ).E_Top   := True;
        end;

    UiSrcButton_No:
        begin
            TUiSrcButton( btn ).F_Left  := l;
            TUiSrcButton( btn ).E_Left  := True;
            TUiSrcButton( btn ).F_Top   := t;
            TUiSrcButton( btn ).E_Top   := True;
        end;

    UiPanelDstButton_No:
        begin
            TUiPanelDstButton( btn ).F_Left  := l;
            TUiPanelDstButton( btn ).E_Left  := True;
            TUiPanelDstButton( btn ).F_Top   := t;
            TUiPanelDstButton( btn ).E_Left  := True;
        end;

    UiPanelSrcButton_No:
        begin
            TUiPanelSrcButton( btn ).F_Left  := l;
            TUiPanelSrcButton( btn ).E_Left  := True;
            TUiPanelSrcButton( btn ).F_Top   := t;
            TUiPanelSrcButton( btn ).E_Left  := True;
        end;
    end;

    Result := btn;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupForm.Button1Click(Sender: TObject);
var
//    pg,
    k, j, i, ds, pindex, index : integer;
    btn : TLayoutButton;
    lst : TLayoutButtonList;
    glay : TLayoutData;
    sb : TUiButton;

begin


    for ds:=0 to 2-1 do begin

        pindex  := 1;
        index   := 1;

        for k:=0 to 2-1 do begin


            for j:=0 to MainForm.MAX_GROUP-1 do begin

                glay    := MainForm.FLayoutData[ 0 ].GroupLayout[ k, j, ds ];
                lst     := glay.List;

                // �ǉ�
                for i:=0 to 50-1 do begin

                    {pindex := }MainForm.CheckXptPortRange( pindex, ds );
                    sb := MainForm.MakeDestinationButton(
//                          MainForm.GetMaxDestinationId( ds ),       // ID
                            index,
                            glay.Frame.F_Id,                            // �eID
                            pindex,                                     // {�[�q�ԍ�}, // PORT
                            ds );                                       // DEST/SOURCE

                    SetXptCoodinate( sb, (index-1) );

                    btn             := TLayoutButton.Create;
                    btn.Button      := sb;

                    // ���[�N���X�g�֒ǉ�
                    lst.Add( btn );

                    Inc( pindex );
                    Inc( index );
                end;

            end;

        end;

    end;


(*




    ds := 1;

    pindex := 1;
    index   := 1;

    for j:=0 to MainForm.MAX_GROUP-1 do begin

        glay    := MainForm.FLayoutData[ 0 ].GroupLayout[ 0, j, ds ];
        lst     := glay.List;

        // �ǉ�
        for i:=0 to 50-1 do begin

            pindex := MainForm.CheckXptPortRange( pindex, ds );
            sb := MainForm.MakeDestinationButton(
//                    MainForm.GetMaxDestinationId( ds ),       // ID
                    index,
                    glay.Frame.F_Id,                            // �eID
                    pindex,                                     // {�[�q�ԍ�}, // PORT
                    ds );                                       // DEST/SOURCE

            SetXptCoodinate( sb, (index-1) );

            btn             := TLayoutButton.Create;
            btn.Button      := sb;

            // ���[�N���X�g�֒ǉ�
            lst.Add( btn );

            Inc( pindex );
            Inc( index );
        end;

    end;
*)

end;

//-----------------------------------------------------------------------------
//  �I�𒆂̃J�e�S�����̃{�^����S��OFF
//-----------------------------------------------------------------------------
procedure TGroupForm.AllClear;
var
    j, i, n : integer;
    cate, g : TLayoutButton;
    gl : TLayoutButtonList;

begin
{log}SetOpeLog( 'OPE:AllClear' );

    n := 0;

    cate := MainForm.Category;

    for j:=0 to HIGH( cate.FChild ) do begin

        gl := cate.FChild[j].List;

        for i:=0 to gl.Count-1 do begin

            g := gl.Data[i];

            // �S�f�[�^�폜
            if nil <> g.Child[0] then
                n := n + g.Child[0].List.ClearAll;

            if nil <> g.Child[1] then
                n := n + g.Child[1].List.ClearAll;
        end;
    end;

    // �ύX�L�̎��AUNDO�ɒǉ�
    if n <> 0 then
        MainForm.MakeUndo;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TGroupForm.SearchButton( grp, port : integer ) : TLayoutButton;
var
    {ds,} i : integer;
    dst : TUiDstButton;
    src : TUiSrcButton;
    pdst : TUiPanelDstButton;
    psrc : TUiPanelSrcButton;
    portStr : string;
    bl : TLayoutData;

begin
//{log}SetOpeLog( 'OPE:TGroupForm.SearchButton' );

    bl  := MainForm._GroupLayout[ grp ];

    portStr := IntToStr( port );

    for i:=0 to bl.List.Count-1 do begin

        case mainForm.DestSourceType of //GetDataSelection( ds ) of
        0:  // XPT + DESTINATION
            begin
                dst := TUiDstButton( bl.List.Data[i].Button );

                if dst.F_DstPortNo = portStr then begin
                    Result := bl.List.Data[i];
                    Exit;
                end;
            end;

        1:  // XPT + SOURCE
            begin
                src := TUiSrcButton( bl.List.Data[i].Button );

                if src.F_SrcPortNo = portStr then begin
                    Result := bl.List.Data[i];
                    Exit;
                end;
            end;

        2:  // PANEL + DESTINATION
            begin
                pdst := TUiPanelDstButton( bl.List.Data[i].Button );

                if pdst.F_DstPortNo = portStr then begin
                    Result := bl.List.Data[i];
                    Exit;
                end;

            end;

        3:  // PANEL + SOURCE
            begin
                psrc := TUiPanelSrcButton( bl.List.Data[i].Button );

                if psrc.F_SrcPortNo = portStr then begin
                    Result := bl.List.Data[i];
                    Exit;
                end;

            end;
        end;

    end;

    Result := nil;
end;

//-----------------------------------------------------------------------------
//  �E�B���h�E�쐬
//-----------------------------------------------------------------------------
procedure TGroupForm.FormCreate(Sender: TObject);
begin

    InputEdit.Visible   := False;

    NoPanel.Color       := TOP_COLOR;
    IDPanel.Color       := TOP_COLOR;
    MatPanel.Color      := TOP_COLOR;
    GRPPanel.Color      := TOP_COLOR;

    MakeComponent;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupForm.TerPanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

    ;

end;

//-----------------------------------------------------------------------------
//  �y�[�W�ړ��i <> �{�^�������j
//-----------------------------------------------------------------------------
procedure TGroupForm.TopLabelClick(Sender: TObject);
begin
    case TLabel( Sender ).Tag of
    0:  PageSpinEdit.Value  := 1;   // TOP
    1:  PageSpinEdit.Value  := PageSpinEdit.Value - 1;  // BACK
    2:  PageSpinEdit.Value  := PageSpinEdit.Value + 1;  // NEXT
    3:  PageSpinEdit.Value  := 99;
    end;

{log}SetOpeLog( 'OPE:TGroupForm.TopLabelClick', PageSpinEdit.Value );

end;

//-----------------------------------------------------------------------------
//  �y�[�W�ԍ��ύX
//-----------------------------------------------------------------------------
procedure TGroupForm.PageSpinEditChange(Sender: TObject);
begin
    DispXPTGroup;   //( 1{���X�g����} );
end;

//-----------------------------------------------------------------------------
//  �O���[�v�� �}�E�X�_�E��
//-----------------------------------------------------------------------------
procedure TGroupForm.GPanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   grp : integer;

begin
{log}SetOpeLog( 'OPE:TGroupForm.GPanelMouseDown' );

    grp := TPanel( Sender ).Tag;

    if mbLeft = Button then begin

        // ���̓��̓{�b�N�X�\��
        InputEdit.Parent    := Self;
        InputEdit.Top       := FGroupPanel[grp].Top;
        InputEdit.Left      := FGroupPanel[grp].Left;
        InputEdit.Text      := FGroupPanel[grp].Caption;
        InputEdit.Tag       := grp;
        InputEdit.Visible   := True;
        InputEdit.BringToFront;
        InputEdit.SetFocus;
    end;
end;

//-----------------------------------------------------------------------------
//  �}�E�X�z�C�[��
//-----------------------------------------------------------------------------
procedure TGroupForm.GScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
const
	WheelScrollSize		= 62;

var
    mv : integer;

begin
	// �ړ���
	if WheelDelta > 0 then mv := -WheelScrollSize
    else                   mv := WheelScrollSize;

    GScrollBox.VertScrollBar.Position := GScrollBox.VertScrollBar.Position + mv;
    Handled := True;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupForm.InputEditEnter(Sender: TObject);
begin
    ;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TGroupForm.InputEditExit(Sender: TObject);
begin
    InputEdit.Parent    := nil;
    InputEdit.Visible   := False;
end;

//-----------------------------------------------------------------------------
//  �O���[�v���̓���
//-----------------------------------------------------------------------------
procedure TGroupForm.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    grp : TLayoutButton;

begin

	case Key of
    VK_RETURN:
        begin
        	//	ENTER�������ꂽ

            // �m��
            FGroupPanel[ InputEdit.Tag ].Caption    := InputEdit.Text;

            InputEdit.Parent    := nil;
            InputEdit.Visible   := False;

            // ���[�N�f�[�^�ɃZ�b�g
            grp := MainForm.Group.List.Data[ InputEdit.Tag ];
            TuiScreenselectButton( grp.Button ).F_Text  := InputEdit.Text;

{log}SetOpeLog( 'OPE:TGroupForm.InputEditKeyDown', InputEdit.Text );
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
constructor TterminalPanel.Create(AOwner: TComponent);
begin
    inherited;

    FPortEnable := True;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TterminalPanel.SetTermNo( no : integer );
begin
	FTermNo := no;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TterminalPanel.SetIDName( nm : string );
begin
	FIDName := nm;
    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TterminalPanel.SetPortEnable( ena : Boolean );
begin
    FPortEnable    := ena;

    if ena = True then begin
        if (Tag mod 2) = 0 then Color  := EVEN_COLOR
        else                    Color  := ODD_COLOR;
    end
    else begin
        Color := clSilver;
    end;

    Invalidate;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TterminalPanel.Paint;
begin
    DispGroup;
end;

//-----------------------------------------------------------------------------
//	�v���C���X�g�\��
//-----------------------------------------------------------------------------
procedure TterminalPanel.DispGroup;
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

    // �[�q�ԍ�
    Canvas.Font.Name    := 'Arial Rounded MT Bold';
    Canvas.Font.Size	:= 9;
//    Canvas.Font.Style	:= [fsBold];
    Canvas.Font.Style	:= [];
    Canvas.Font.Color	:= clBlack;

    if FTermNo > 0 then
        CenterTextRect( Canvas, Rect( 0, 0, 60, Height ), IntToStr( FTermNo ) );

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



end.



