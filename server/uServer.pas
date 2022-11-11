unit uServer;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmServidor = class(TForm)
    Label1: TLabel;
    memLog: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServidor: TfrmServidor;

implementation

{$R *.dfm}

procedure TfrmServidor.FormCreate(Sender: TObject);
begin
  memLog.Lines.Clear;
end;

end.

