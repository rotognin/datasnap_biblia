unit ServerContainerUnit;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth;

type
  TServerContainer1 = class(TDataModule)
    DSServer: TDSServer;
    DSTCPServerTransport: TDSTCPServerTransport;
    DSServerClass: TDSServerClass;
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
  end;

var
  ServerContainer1: TServerContainer1;

implementation


{$R *.dfm}

uses
  ServerMethodsUnit;

procedure TServerContainer1.DSServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerMethods1;
end;

end.

