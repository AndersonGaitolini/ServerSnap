unit uFrmPrincipalClient;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, Data.FireDACJSONReflect, System.Rtti,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.DB, Data.Bind.Components,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Layouts, FMX.Grid,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Grid,
  Data.Bind.DBScope;

type
  TfrmPrincipalClient = class(TForm)
    lb1: TLabel;
    lbResult: TLabel;
    edtNome: TEdit;
    swtch1: TSwitch;
    lbEchoString: TLabel;
    lbReverseString: TLabel;
    sgGrid: TStringGrid;
    fdmtTabela: TFDMemTable;
    BindingsList1: TBindingsList;
    fdmtTabelaID: TIntegerField;
    fdmtTabelaCHAVE: TStringField;
    fdmtTabelaIDF_DOCUMENTO: TIntegerField;
    fdmtTabelaDATAEMISSAO: TDateField;
    fdmtTabelaDATARECTO: TDateField;
    fdmtTabelaMOTIVO: TStringField;
    fdmtTabelaPROTOCOLOCANC: TStringField;
    fdmtTabelaPROTOCOLORECTO: TStringField;
    fdmtTabelaDATAALTERACAO: TDateField;
    fdmtTabelaTIPO: TStringField;
    fdmtTabelaEMAILSNOTIFICADOS: TStringField;
    fdmtTabelaTIPOAMBIENTE: TStringField;
    fdmtTabelaXMLENVIO: TBlobField;
    fdmtTabelaXMLEXTEND: TBlobField;
    fdmtTabelaMOTIVOCANC: TStringField;
    fdmtTabelaXMLENVIOCANC: TBlobField;
    fdmtTabelaXMLEXTENDCANC: TBlobField;
    fdmtTabelaPROTOCOLOAUT: TStringField;
    bndsrcdb1: TBindSourceDB;
    btnBaixarDados: TSpeedButton;
    edt1: TEdit;
    lnkgrdtdtsrcbndsrcdb: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    procedure swtch1Switch(Sender: TObject);
    procedure btnBaixarDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalClient: TfrmPrincipalClient;

implementation

uses
  uCM;

{$R *.fmx}

procedure TfrmPrincipalClient.btnBaixarDadosClick(Sender: TObject);
var DsTabela : TFDJSONDataSets;
begin
  DsTabela := CM.srvMetodosClient.GetLM_BKPDFE();
  Assert(TFDJSONDataSetsReader.GetListCount(DsTabela) = 1);
  fdmtTabela.Active := False;
  fdmtTabela.AppendData(TFDJSONDataSetsReader.GetListValue(DsTabela,0));
  fdmtTabela.Active := True;
end;

procedure TfrmPrincipalClient.swtch1Switch(Sender: TObject);
begin
  if Trim(edtNome.Text) ='' then
    Exit;

  if swtch1.IsChecked then
    lbResult.Text := CM.srvMetodosClient.EchoString(Trim(edtNome.Text))
  else
    lbResult.Text := CM.srvMetodosClient.ReverseString(edtNome.Text);
end;

end.
