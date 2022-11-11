program bibliaServer;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uServer in 'uServer.pas' {frmServidor},
  ServerMethodsUnit in 'ServerMethodsUnit.pas',
  ServerContainerUnit in 'ServerContainerUnit.pas' {ServerContainer1: TDataModule},
  uDm in 'uDm.pas' {fDm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServidor, frmServidor);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.CreateForm(TfDm, fDm);
  Application.Run;
end.

