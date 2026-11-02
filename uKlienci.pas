unit uKlienci;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmKlienci = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    btnSprzedajKarnet: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnSprzedajKarnetClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKlienci: TfrmKlienci;

implementation

{$R *.dfm}

uses uDM, uEdycjaKlienta;

procedure TfrmKlienci.btnSprzedajKarnetClick(Sender: TObject);
var
  WybranyKlientID: Integer;
  DataWaznosci: TDate;
begin
  if DM.qryKlienci.IsEmpty then
  begin
    ShowMessage('Wybierz najpierw klienta z listy!');
    Exit;
  end;

  if MessageDlg('Czy na pewno chcesz sprzedaæ karnet wybranemu klientowi?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    WybranyKlientID := DM.qryKlienci.FieldByName('KlientID').AsInteger;

    DataWaznosci := IncMonth(Now, 1);

    DM.FDConnection1.ExecSQL(
      'INSERT INTO Karnety (KlientID, IloscWejsc, DataWaznosci) VALUES (:id, :wejscia, :data)',
      [WybranyKlientID, 10, FormatDateTime('yyyy-mm-dd', DataWaznosci)]
    );

    ShowMessage('Karnet na 10 wejœæ zosta³ pomyœlnie przypisany do klienta!');
  end;
end;

procedure TfrmKlienci.Button1Click(Sender: TObject);
var
  FormaDodawania: TfrmEdycjaKlienta;
begin
  FormaDodawania := TfrmEdycjaKlienta.Create(Application);
  try
    if FormaDodawania.ShowModal = mrOk then
    begin
      if (FormaDodawania.edtImie.Text = '') or (FormaDodawania.edtNazwisko.Text = '') then
      begin
        ShowMessage('Imiê i nazwisko s¹ wymagane!');
        Exit;
      end;


      DM.qryKlienci.Close;
      DM.qryKlienci.SQL.Text :=
        'INSERT INTO Klienci (Imie, Nazwisko, Telefon, Email) ' +
        'VALUES (:pImie, :pNazwisko, :pTelefon, :pEmail)';

      DM.qryKlienci.ParamByName('pImie').AsString := FormaDodawania.edtImie.Text;
      DM.qryKlienci.ParamByName('pNazwisko').AsString := FormaDodawania.edtNazwisko.Text;
      DM.qryKlienci.ParamByName('pTelefon').AsString := FormaDodawania.edtTelefon.Text;
      DM.qryKlienci.ParamByName('pEmail').AsString := FormaDodawania.edtEmail.Text;

      DM.qryKlienci.ExecSQL;

      ShowMessage('Klient dodany pomyœlnie!');

      DM.qryKlienci.SQL.Text := 'SELECT * FROM Klienci';
      DM.qryKlienci.Open;
    end;
  finally
    FormaDodawania.Free;
  end;
end;

procedure TfrmKlienci.Button2Click(Sender: TObject);
var
  IdKlienta: Integer;
begin
  if DM.qryKlienci.IsEmpty then
    Exit;

  if MessageDlg('Czy na pewno chcesz usun¹æ tego klienta? Znikn¹ równie¿ wszystkie jego karnety i rezerwacje!', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    IdKlienta := DM.qryKlienci.FieldByName('KlientID').AsInteger;

    DM.FDConnection1.ExecSQL('DELETE FROM Rezerwacje WHERE KlientID = :id', [IdKlienta]);
    DM.FDConnection1.ExecSQL('DELETE FROM Karnety WHERE KlientID = :id', [IdKlienta]);

    DM.FDConnection1.ExecSQL('DELETE FROM Klienci WHERE KlientID = :id', [IdKlienta]);

    ShowMessage('Klient oraz jego historia zostali trwale usuniêci z bazy.');

    DM.qryKlienci.Close;
    DM.qryKlienci.Open;
  end;
end;

end.
