unit uCM;

interface

uses
  System.SysUtils, System.Classes, uProxy, IPPeerClient,
  Datasnap.DSClientRest, FireDAC.Stan.StorageBin;

type
  TCM = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FsrvMetodosClient: TsrvMetodosClient;
    function GetsrvMetodosClient: TsrvMetodosClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property srvMetodosClient: TsrvMetodosClient read GetsrvMetodosClient write FsrvMetodosClient;

end;

var
  CM: TCM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TCM.Destroy;
begin
  FsrvMetodosClient.Free;
  inherited;
end;

function TCM.GetsrvMetodosClient: TsrvMetodosClient;
begin
  if FsrvMetodosClient = nil then
    FsrvMetodosClient:= TsrvMetodosClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsrvMetodosClient;
end;

end.
