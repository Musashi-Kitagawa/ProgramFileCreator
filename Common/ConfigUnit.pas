unit ConfigUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
//
    ConfigDataUnit, Vcl.Samples.Spin;

type
    TOpenDir = class(TObject)
    public
        Dialog : TOpenDialog;

        procedure   HideControls(Sender: TObject);
    end;

type
  TConfigForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    OpenDialog: TOpenDialog;
    ColorDialog: TColorDialog;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    XPTRootEdit: TEdit;
    PanelRootEdit: TEdit;
    UndoSpinEdit: TSpinEdit;
    Label4: TLabel;
    XptCateHSpinEdit: TSpinEdit;
    Label5: TLabel;
    Label6: TLabel;
    XptGrpHSpinEdit: TSpinEdit;
    TabSheet3: TTabSheet;
    Shape1: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    XptDstHSpinEdit: TSpinEdit;
    Label10: TLabel;
    XptSrcHSpinEdit: TSpinEdit;
    Label11: TLabel;
    XptXSpaceSpinEdit: TSpinEdit;
    Label12: TLabel;
    XptYSpaceSpinEdit: TSpinEdit;
    Label13: TLabel;
    CatePrifixEdit: TEdit;
    Label14: TLabel;
    GrpPrifixEdit: TEdit;
    Label1: TLabel;
    DbPathEdit: TEdit;
    Label15: TLabel;
    MaxCateSpinEdit: TSpinEdit;
    Label16: TLabel;
    MaxGrpSpinEdit: TSpinEdit;
    Button1: TButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    PanelCateHSpinEdit: TSpinEdit;
    PanelGrpHSpinEdit: TSpinEdit;
    PanelDstHSpinEdit: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Label22: TLabel;
    Label23: TLabel;
    DstSetPortEdit: TEdit;
    DstNameEdit: TEdit;
    SrcSetPortEdit: TEdit;
    SrcNameEdit: TEdit;
    Label24: TLabel;
    DstGroupButtonSpinEdit: TSpinEdit;
    SrcGroupButtonSpinEdit: TSpinEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    TopMarginSpinEdit: TSpinEdit;
    LeftMarginSpinEdit: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private 宣言 }

    procedure   SetData( cfg : TConfigData );
    procedure   GetData( cfg : TConfigData );

  public
    { Public 宣言 }

    function    Start( cfg : TConfigData ) : Boolean;

  end;

var
  ConfigForm: TConfigForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
//  色変更
//-----------------------------------------------------------------------------
procedure TConfigForm.Shape1MouseDown(
	Sender: TObject;
  	Button: TMouseButton;
    Shift: TShiftState;
    X, Y: Integer);

begin
    // 現在値セット
    ColorDialog.Color := TShape( Sender ).Brush.Color;
	if False = ColorDialog.Execute then exit;

    // 色変更
    TShape( Sender ).Brush.Color := ColorDialog.Color;
end;

//-----------------------------------------------------------------------------
//  設定展開
//-----------------------------------------------------------------------------
procedure TConfigForm.SetData( cfg : TConfigData );
begin

//-- 一般 ---------------------------------------------------------------------

    UndoSpinEdit.Value          := cfg.MaxUndo;

    XptCateHSpinEdit.Value      := cfg.XptCateH;
    XptGrpHSpinEdit.Value       := cfg.XptGrpH;
    XptDstHSpinEdit.Value       := cfg.XptDstH;
    XptSrcHSpinEdit.Value       := cfg.XptSrcH;

    XptXSpaceSpinEdit.Value     := cfg.XptXSpace;
    XptYSpaceSpinEdit.Value     := cfg.XptYSpace;

    PanelCateHSpinEdit.Value    := cfg.PanelCateH;
    PanelGrpHSpinEdit.Value     := cfg.PanelGrpH;

    CatePrifixEdit.Text         := cfg.CatePrifix;
    GrpPrifixEdit.Text          := cfg.GroupPrifix;

    TopMarginSpinEdit.Value     := cfg.TopMargin;
    LeftMarginSpinEdit.Value    := cfg.LeftMargin;

//-- データベース -------------------------------------------------------------

    DbPathEdit.Text         := cfg.DbPath;

    XPTRootEdit.Text        := cfg.XPTRootFrame;
    PanelRootEdit.Text      := cfg.PanelRootFrame;

    MaxCateSpinEdit.Value   := cfg.MaxCategory;
    MaxGrpSpinEdit.Value    := cfg.MaxGroup;

    DstSetPortEdit.Text     := cfg.ListName[ 0, 0 ];
    SrcSetPortEdit.Text     := cfg.ListName[ 0, 1 ];
    DstNameEdit.Text        := cfg.ListName[ 1, 0 ];
    SrcNameEdit.Text        := cfg.ListName[ 1, 1 ];

    DstGroupButtonSpinEdit.Value    := cfg.DstGroupButton;
    SrcGroupButtonSpinEdit.Value    := cfg.SrcGroupButton;

//-- 色 -----------------------------------------------------------------------
    Shape1.Brush.Color      := cfg.MoveColor;

end;

//-----------------------------------------------------------------------------
//  設定取得
//-----------------------------------------------------------------------------
procedure TConfigForm.GetData( cfg : TConfigData );
begin

//-- 一般 ---------------------------------------------------------------------

    cfg.MaxUndo         := UndoSpinEdit.Value;

    cfg.XptCateH        := XptCateHSpinEdit.Value;
    cfg.XptGrpH         := XptGrpHSpinEdit.Value;
    cfg.XptDstH         := XptDstHSpinEdit.Value;
    cfg.XptSrcH         := XptSrcHSpinEdit.Value;

    cfg.XptXSpace       := XptXSpaceSpinEdit.Value;
    cfg.XptYSpace       := XptYSpaceSpinEdit.Value;

    cfg.PanelCateH      := PanelCateHSpinEdit.Value;
    cfg.PanelGrpH       := PanelGrpHSpinEdit.Value;

    cfg.CatePrifix      := CatePrifixEdit.Text;
    cfg.GroupPrifix     := GrpPrifixEdit.Text;

    cfg.TopMargin       := TopMarginSpinEdit.Value;
    cfg.LeftMargin      := LeftMarginSpinEdit.Value;

//-- データベース -------------------------------------------------------------
    cfg.DbPath          := DbPathEdit.Text;

    cfg.XPTRootFrame    := XPTRootEdit.Text;
    cfg.PanelRootFrame  := PanelRootEdit.Text;

    cfg.MaxCategory     := MaxCateSpinEdit.Value;
    cfg.MaxGroup        := MaxGrpSpinEdit.Value;

    cfg.ListName[0,0]   := DstSetPortEdit.Text;
    cfg.ListName[0,1]   := SrcSetPortEdit.Text;
    cfg.ListName[1,0]   := DstNameEdit.Text;
    cfg.ListName[1,1]   := SrcNameEdit.Text;

    cfg.DstGroupButton  := DstGroupButtonSpinEdit.Value;
    cfg.SrcGroupButton  := SrcGroupButtonSpinEdit.Value;

//-- 色 -----------------------------------------------------------------------
    cfg.MoveColor       := Shape1.Brush.Color;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TConfigForm.Start( cfg : TConfigData ) : Boolean;
begin
    Result := False;

    // 設定展開
    SetData( cfg );

    if mrOK <> ShowModal then Exit;

    // 設定取得
    GetData( cfg );

    Result := True;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function GimmeDir( var dir : string ) : Boolean;
var
    OpenDialog : TOpenDialog;
    OpenDir : TOpenDir;

begin

    //The standard dialog...
    OpenDialog:= TOpenDialog.Create(nil);

    //Objetc that holds the OnShow code to hide controls
    OpenDir:= TOpenDir.Create;

    try
        //Conect both components...
        OpenDir.Dialog          := OpenDialog;
        OpenDialog.OnShow       := OpenDir.HideControls;

        //Configure it so only folders are shown (and file without extension!)...
        OpenDialog.FileName     := '*.';
        OpenDialog.Filter       := '*.';
        OpenDialog.Title        := 'Chose a folder';

        //No need to check file existis!
        OpenDialog.Options      := OpenDialog.Options + [ofNoValidate];

        OpenDialog.OptionsEx    := [ofExNoPlacesBar];

        //Initial folder...
        OpenDialog.InitialDir   := dir;

        //Ask user...
        if OpenDialog.Execute then begin
            dir     := ExtractFilePath(OpenDialog.FileName);
            Result  := True;
        end
        else begin
            Result  := False;
        end;

    finally
        //Clean up...
        OpenDir.Free;
        OpenDialog.Free;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TOpenDir.HideControls(Sender: TObject);
const

    //CDM_HIDECONTROL and CDM_SETCONTROLTEXT values from:
    //  doc.ddart.net/msdn/header/include/commdlg.h.html
    //  CMD_HIDECONTROL = CMD_FIRST + 5 = (WM_USER + 100) + 5;
    //Usage of CDM_HIDECONTROL and CDM_SETCONTROLTEXT here:
    //  msdn.Microsoft.com/en-us/library/ms646853%28VS.85%29.aspx
    //  msdn.Microsoft.com/en-us/library/ms646855%28VS.85%29.aspx
    CDM_HIDECONTROL =    WM_USER + 100 + 5;
    CDM_SETCONTROLTEXT = WM_USER + 100 + 4;

    //Component IDs from:
    //  msdn.Microsoft.com/en-us/library/ms646960%28VS.85%29.aspx#_win32_Open_and_Save_As_Dialog_Box_Customization
    //Translation into exadecimal in dlgs.h:
    //  www.koders.com/c/fidCD2C946367FEE401460B8A91A3DB62F7D9CE3244.aspx
    //

    //File type filter...
    cmb1: integer  = $470; //Combo box with list of file type filters
    stc2: integer  = $441; //Label of the file type
    //File name const...
    cmb13: integer = $47c; //Combo box with name of the current file
    edt1: integer  = $480; //Edit with the name of the current file
    stc3: integer  = $442; //Label of the file name combo

var
    H: THandle;

begin
    H   := GetParent(Dialog.Handle);

    //Hide file types combo...
    SendMessage(H, CDM_HIDECONTROL, cmb1,  0);
    SendMessage(H, CDM_HIDECONTROL, stc2,  0);

    //Hide file name label, edit and combo...
    SendMessage(H, CDM_HIDECONTROL, cmb13, 0);
    SendMessage(H, CDM_HIDECONTROL, edt1,  0);
    SendMessage(H, CDM_HIDECONTROL, stc3,  0);

    //NOTE: How to change label text (the lentgh is not auto):
    //SendMessage(H, CDM_SETCONTROLTEXT, stc3, DWORD(pChar('Hello!')));

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TConfigForm.Button1Click(Sender: TObject);
var
    dir : string;

begin

    dir := DbPathEdit.Text;

    if True = GimmeDir( dir ) then

        DbPathEdit.Text := dir;

end;

(*
//{LOG}SetLog( 'OPE:TConfigForm.BuzzerSelectButtonMouseDown' );

    OpenDialog.Options      := OpenDialog.Options + [ofNoValidate];
    OpenDialog.OptionsEx    := [ofExNoPlacesbar];

	//	オープンダイアログを実行
    with OpenDialog do begin
        //	ファイル名をセット

		//	実行
	    if Execute then begin
        	//	読み込み

			//	表示
			DbPathEdit.Text	:= FileName;
        end;
    end;
end;

*)

end.
