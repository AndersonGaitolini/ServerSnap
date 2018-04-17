unit uSrvMetodos;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageJSON, FireDAC.Phys.IBBase,
  FireDAC.Stan.StorageBin, Data.FireDACJSONReflect;

type
  TsrvMetodos = class(TDSServerModule)
    fdcConexao: TFDConnection;
    fdqQuery: TFDQuery;
    fdqQueryID: TIntegerField;
    fdqQueryCHAVE: TStringField;
    fdqQueryIDF_DOCUMENTO: TIntegerField;
    fdqQueryDATAEMISSAO: TDateField;
    fdqQueryDATARECTO: TDateField;
    fdqQueryMOTIVO: TStringField;
    fdqQueryPROTOCOLOCANC: TStringField;
    fdqQueryPROTOCOLORECTO: TStringField;
    fdqQueryDATAALTERACAO: TDateField;
    fdqQueryTIPO: TStringField;
    fdqQueryEMAILSNOTIFICADOS: TStringField;
    fdqQueryTIPOAMBIENTE: TStringField;
    fdqQueryXMLENVIO: TBlobField;
    fdqQueryXMLEXTEND: TBlobField;
    fdqQueryMOTIVOCANC: TStringField;
    fdqQueryXMLENVIOCANC: TBlobField;
    fdqQueryXMLEXTENDCANC: TBlobField;
    fdqQueryPROTOCOLOAUT: TStringField;
    fdDriverLinkFB: TFDPhysFBDriverLink;
    fdstnstrgjsnlnk1: TFDStanStorageJSONLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetLM_BKPDFE: TFDJSONDataSets;

  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TsrvMetodos.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TsrvMetodos.GetLM_BKPDFE: TFDJSONDataSets;
begin
  fdqQuery.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdqQuery);
end;

function TsrvMetodos.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

