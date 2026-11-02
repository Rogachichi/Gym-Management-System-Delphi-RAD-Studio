unit uRezerwacje;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Printers,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus,
  uLogikaKarnetow;

type
  TfrmRezerwacje = class(TForm)
    dsRezerwacje: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    popRezerwacje: TPopupMenu;
    Usurezerwacj1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    btnAnulujRezerwacje: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Usurezerwacj1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnAnulujRezerwacjeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRezerwacje: TfrmRezerwacje;

implementation

{$R *.dfm}

uses uDM, uNowaRezerwacja;

procedure TfrmRezerwacje.btnAnulujRezerwacjeClick(Sender: TObject);
var
  IdRezerwacji: Integer;
  AktualnyStatus: string;
begin
  if DM.qryRezerwacjeView.IsEmpty then
    Exit;

  IdRezerwacji := DM.qryRezerwacjeView.FieldByName('RezerwacjaID').AsInteger;
  AktualnyStatus := DM.qryRezerwacjeView.FieldByName('Status').AsString;

  if UpperCase(AktualnyStatus) = 'ANULOWANO' then
  begin
    ShowMessage('Ta rezerwacja ma ju¿ status ANULOWANO!');
    Exit;
  end;

  if MessageDlg('Czy na pewno chcesz odwo³aæ tê rezerwacjê (zmieniæ status na ANULOWANO)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM.FDConnection1.ExecSQL(
      'UPDATE Rezerwacje SET Status = ''ANULOWANO'' WHERE RezerwacjaID = :id',
      [IdRezerwacji]
    );

    ShowMessage('Rezerwacja zosta³a odwo³ana.');

    DM.qryRezerwacjeView.Close;
    DM.qryRezerwacjeView.Open;
  end;
end;

procedure TfrmRezerwacje.Button1Click(Sender: TObject);
var
  Forma: TfrmNowaRezerwacja;
begin
  Forma := TfrmNowaRezerwacja.Create(Application);
  try
    DM.qryLkpKlienci.Refresh;
    DM.qryLkpObiekty.Refresh;

    if Forma.ShowModal = mrOk then
    begin
      if (Forma.cbKlient.KeyValue = Null) or (Forma.cbObiekt.KeyValue = Null) then
      begin
        ShowMessage('Musisz wybraæ klienta i obiekt!');
        Exit;
      end;

      if NOT TKarnetManager.SprawdzKarnet(Forma.cbKlient.KeyValue, DM.FDConnection1) then
      begin
        ShowMessage('B£¥D: Ten klient nie ma aktywnego karnetu lub skoñczy³y siê wejœcia!');
        Exit;
      end;

      DM.qryRezerwacjeView.Close;
      DM.FDConnection1.ExecSQL(
        'INSERT INTO Rezerwacje (KlientID, ObiektID, DataRezerwacji, GodzinaOd, GodzinaDo) ' +
        'VALUES (:k, :o, :d, :god, :gdo)',
        [
          Forma.cbKlient.KeyValue,
          Forma.cbObiekt.KeyValue,
          FormatDateTime('yyyy-mm-dd', Forma.dtpData.Date),
          Forma.edtOd.Text,
          Forma.edtDo.Text
        ]
      );

      TKarnetManager.ZdejmijWejscie(Forma.cbKlient.KeyValue, DM.FDConnection1);

      ShowMessage('Rezerwacja dodana! Pobrano 1 wejœcie z karnetu.');
      DM.qryRezerwacjeView.Open;
    end;
  finally
    Forma.Free;
  end;
end;

procedure TfrmRezerwacje.Button2Click(Sender: TObject);
var
  Y: Integer;
  Linia: string;
  WysokoscLinii: Integer;
begin
  Printer.PrinterIndex := Printer.Printers.IndexOf('Microsoft Print to PDF');

  if Printer.PrinterIndex = -1 then
  begin
    ShowMessage('B³¹d: W systemie brakuje wirtualnej drukarki PDF!');
    Exit;
  end;

  Printer.Title := 'Raport_Rezerwacji';
  Printer.BeginDoc;
  try
    Printer.Canvas.Font.Name := 'Arial';
    Printer.Canvas.Font.Size := 12;

    WysokoscLinii := Printer.Canvas.TextHeight('W') + 40;

    Y := 150;

    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.TextOut(150, Y, '--- RAPORT REZERWACJI ---');
    Y := Y + (WysokoscLinii * 2);

    Printer.Canvas.Font.Style := [];
    Printer.Canvas.TextOut(150, Y, 'Wygenerowano: ' + DateTimeToStr(Now));
    Y := Y + (WysokoscLinii * 2);

    DM.qryRezerwacjeView.First;
    while not DM.qryRezerwacjeView.Eof do
    begin
      Linia := DM.qryRezerwacjeView.FieldByName('DataRezerwacji').AsString + ' | ' +
               DM.qryRezerwacjeView.FieldByName('GodzinaOd').AsString + ' | ' +
               DM.qryRezerwacjeView.FieldByName('Klient').AsString + ' | ' +
               DM.qryRezerwacjeView.FieldByName('Obiekt').AsString;

      Printer.Canvas.TextOut(150, Y, Linia);

      Y := Y + WysokoscLinii;

      if Y > Printer.PageHeight - 200 then
      begin
        Printer.NewPage;
        Y := 150;
      end;

      DM.qryRezerwacjeView.Next;
    end;

  finally
    Printer.EndDoc;
    ShowMessage('Raport PDF zosta³ pomyœlnie wygenerowany!');
  end;
end;

procedure TfrmRezerwacje.UsuRezerwacj1Click(Sender: TObject);
var
  IdDoUsuniecia: Integer;
begin
  if DM.qryRezerwacjeView.IsEmpty then
    Exit;

  if MessageDlg('Czy na pewno chcesz usun¹æ tê rezerwacjê?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    IdDoUsuniecia := DM.qryRezerwacjeView.FieldByName('RezerwacjaID').AsInteger;

    DM.FDConnection1.ExecSQL('DELETE FROM Rezerwacje WHERE RezerwacjaID = :id', [IdDoUsuniecia]);

    DM.qryRezerwacjeView.Close;
    DM.qryRezerwacjeView.Open;

    ShowMessage('Rezerwacja zosta³a usuniêta.');
  end;
end;

end.
