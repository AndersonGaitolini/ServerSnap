program ProjectClientDataSnap;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmPrincipalClient in 'Mobile\uFrmPrincipalClient.pas' {frmPrincipalClient},
  uProxy in 'Mobile\uProxy.pas',
  uCM in 'Mobile\uCM.pas' {CM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCM, CM);
  Application.CreateForm(TfrmPrincipalClient, frmPrincipalClient);
  Application.Run;
end.
