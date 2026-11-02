unit uStatystyki;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart;

type
  TfrmStatystyki = class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStatystyki: TfrmStatystyki;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmStatystyki.FormShow(Sender: TObject);
begin
  DM.qryStatystyki.Close;
  DM.qryStatystyki.Open;

  Series1.Clear;

  while not DM.qryStatystyki.Eof do
  begin
    Series1.Add(
      DM.qryStatystyki.FieldByName('LiczbaRezerwacji').AsInteger,
      DM.qryStatystyki.FieldByName('Nazwa').AsString
    );

    DM.qryStatystyki.Next;
  end;
end;

end.
