unit MessageUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TMessageForm = class(TForm)
    Panel1: TPanel;
    MessLabel: TLabel;
    Label1: TLabel;
//    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private 宣言 }

    procedure   SetSubMessage( mes : string );

  public
    { Public 宣言 }

    procedure   Start( mess : string; pa : TForm=nil );


    property    SubMessage : string     write SetSubMessage;
  end;

var
  MessageForm: TMessageForm;

implementation

{$R *.dfm}

//uses
//    Filer, CommonUnit;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TMessageForm.SetSubMessage( mes : string );
begin
    Label1.Caption := mes;

    Label1.Update;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TMessageForm.Start( mess : string; pa : TForm );
begin
    MessLabel.Caption   	:= mess;
    Label1.Caption   	    := '';

    Show;

    if pa <> nil then begin
        Left    := pa.Left + (pa.Width - Width) div 2;
        Top     := pa.Top + (pa.Height - Height) div 2;
    end
    else begin
        Left    := (Screen.Width - Width) div 2;
        Top     := (Screen.Height - Height) div 2;
    end;

    Update;
end;

//------------------------------------------------------------------------------
//	ウィンドウ閉じ
//------------------------------------------------------------------------------
procedure TMessageForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ;
end;

end.
