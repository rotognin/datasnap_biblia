//
// Created by the DataSnap proxy generator.
// 11/11/2022 16:23:36
//

unit ClientClassesUnit;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FbuscarVersoesCommand: TDBXCommand;
    FbuscarLivrosCommand: TDBXCommand;
    FbuscarCapitulosCommand: TDBXCommand;
    FbuscarVersiculosCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function buscarVersoes: string;
    function buscarLivros: string;
    function buscarCapitulos(id_livro: Integer): Integer;
    function buscarVersiculos(id_versao: Integer; id_livro: Integer; id_capitulo: Integer): string;
  end;

implementation

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.buscarVersoes: string;
begin
  if FbuscarVersoesCommand = nil then
  begin
    FbuscarVersoesCommand := FDBXConnection.CreateCommand;
    FbuscarVersoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FbuscarVersoesCommand.Text := 'TServerMethods1.buscarVersoes';
    FbuscarVersoesCommand.Prepare;
  end;
  FbuscarVersoesCommand.ExecuteUpdate;
  Result := FbuscarVersoesCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.buscarLivros: string;
begin
  if FbuscarLivrosCommand = nil then
  begin
    FbuscarLivrosCommand := FDBXConnection.CreateCommand;
    FbuscarLivrosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FbuscarLivrosCommand.Text := 'TServerMethods1.buscarLivros';
    FbuscarLivrosCommand.Prepare;
  end;
  FbuscarLivrosCommand.ExecuteUpdate;
  Result := FbuscarLivrosCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.buscarCapitulos(id_livro: Integer): Integer;
begin
  if FbuscarCapitulosCommand = nil then
  begin
    FbuscarCapitulosCommand := FDBXConnection.CreateCommand;
    FbuscarCapitulosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FbuscarCapitulosCommand.Text := 'TServerMethods1.buscarCapitulos';
    FbuscarCapitulosCommand.Prepare;
  end;
  FbuscarCapitulosCommand.Parameters[0].Value.SetInt32(id_livro);
  FbuscarCapitulosCommand.ExecuteUpdate;
  Result := FbuscarCapitulosCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.buscarVersiculos(id_versao: Integer; id_livro: Integer; id_capitulo: Integer): string;
begin
  if FbuscarVersiculosCommand = nil then
  begin
    FbuscarVersiculosCommand := FDBXConnection.CreateCommand;
    FbuscarVersiculosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FbuscarVersiculosCommand.Text := 'TServerMethods1.buscarVersiculos';
    FbuscarVersiculosCommand.Prepare;
  end;
  FbuscarVersiculosCommand.Parameters[0].Value.SetInt32(id_versao);
  FbuscarVersiculosCommand.Parameters[1].Value.SetInt32(id_livro);
  FbuscarVersiculosCommand.Parameters[2].Value.SetInt32(id_capitulo);
  FbuscarVersiculosCommand.ExecuteUpdate;
  Result := FbuscarVersiculosCommand.Parameters[3].Value.GetWideString;
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FbuscarVersoesCommand.DisposeOf;
  FbuscarLivrosCommand.DisposeOf;
  FbuscarCapitulosCommand.DisposeOf;
  FbuscarVersiculosCommand.DisposeOf;
  inherited;
end;

end.

