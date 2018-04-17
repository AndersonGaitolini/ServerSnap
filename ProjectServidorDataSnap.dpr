program ProjectServidorDataSnap;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uFrmPrincipalServer in 'ServidorDataSnap\uFrmPrincipalServer.pas' {frmPrincipalServer},
  uSrvMetodos in 'ServidorDataSnap\uSrvMetodos.pas' {srvMetodos: TDSServerModule},
  uWM in 'ServidorDataSnap\uWM.pas' {WM: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalServer, frmPrincipalServer);
  Application.Run;
end.
