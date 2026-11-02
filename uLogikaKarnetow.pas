unit uLogikaKarnetow;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB;

type
  TKarnetManager = class
  public
    class function SprawdzKarnet(KlientID: Integer; Connection: TFDConnection): Boolean;
    class procedure ZdejmijWejscie(KlientID: Integer; Connection: TFDConnection);
  end;

implementation

{ TKarnetManager }

class function TKarnetManager.SprawdzKarnet(KlientID: Integer; Connection: TFDConnection): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Connection;
    Qry.SQL.Text := 'SELECT Count(*) FROM Karnety WHERE KlientID = :id AND IloscWejsc > 0 AND DataWaznosci >= GETDATE()';
    Qry.ParamByName('id').AsInteger := KlientID;
    Qry.Open;

    if Qry.Fields[0].AsInteger > 0 then
      Result := True;
  finally
    Qry.Free;
  end;
end;

class procedure TKarnetManager.ZdejmijWejscie(KlientID: Integer; Connection: TFDConnection);
begin
  Connection.ExecSQL(
    'UPDATE TOP (1) Karnety SET IloscWejsc = IloscWejsc - 1 ' +
    'WHERE KlientID = :id AND IloscWejsc > 0 AND DataWaznosci >= GETDATE()',
    [KlientID]
  );
end;

end.
