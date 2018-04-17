//
// Created by the DataSnap proxy generator.
// 16/04/2018 20:56:22
//

unit uProxy;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TsrvMetodosClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetLM_BKPDFECommand: TDSRestCommand;
    FGetLM_BKPDFECommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetLM_BKPDFE(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetLM_BKPDFE_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TsrvMetodos_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsrvMetodos_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsrvMetodos_GetLM_BKPDFE: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TsrvMetodos_GetLM_BKPDFE_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TsrvMetodosClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TsrvMetodos.EchoString';
    FEchoStringCommand.Prepare(TsrvMetodos_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TsrvMetodosClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TsrvMetodos.ReverseString';
    FReverseStringCommand.Prepare(TsrvMetodos_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TsrvMetodosClient.GetLM_BKPDFE(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetLM_BKPDFECommand = nil then
  begin
    FGetLM_BKPDFECommand := FConnection.CreateCommand;
    FGetLM_BKPDFECommand.RequestType := 'GET';
    FGetLM_BKPDFECommand.Text := 'TsrvMetodos.GetLM_BKPDFE';
    FGetLM_BKPDFECommand.Prepare(TsrvMetodos_GetLM_BKPDFE);
  end;
  FGetLM_BKPDFECommand.Execute(ARequestFilter);
  if not FGetLM_BKPDFECommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetLM_BKPDFECommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetLM_BKPDFECommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetLM_BKPDFECommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsrvMetodosClient.GetLM_BKPDFE_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetLM_BKPDFECommand_Cache = nil then
  begin
    FGetLM_BKPDFECommand_Cache := FConnection.CreateCommand;
    FGetLM_BKPDFECommand_Cache.RequestType := 'GET';
    FGetLM_BKPDFECommand_Cache.Text := 'TsrvMetodos.GetLM_BKPDFE';
    FGetLM_BKPDFECommand_Cache.Prepare(TsrvMetodos_GetLM_BKPDFE_Cache);
  end;
  FGetLM_BKPDFECommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetLM_BKPDFECommand_Cache.Parameters[0].Value.GetString);
end;

constructor TsrvMetodosClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsrvMetodosClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsrvMetodosClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetLM_BKPDFECommand.DisposeOf;
  FGetLM_BKPDFECommand_Cache.DisposeOf;
  inherited;
end;

end.

