                                                        unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    qryLogowanie: TFDQuery;
    qryKlienci: TFDQuery;
    qryRezerwacjeView: TFDQuery;
    qryLkpKlienci: TFDQuery;
    dsLkpKlienci: TDataSource;
    qryLkpObiekty: TFDQuery;
    dsLkpObiekty: TDataSource;
    qryStatystyki: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation


{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
DM.qryLkpKlienci.Open;
DM.qryLkpObiekty.Open;
end;

end.
