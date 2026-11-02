unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Winapi.ShellAPI,
  uStatystyki;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Klienci1: TMenuItem;
    Klienci2: TMenuItem;
    Plik2: TMenuItem;
    Rezerwacje1: TMenuItem;
    GrafikKalendarz1: TMenuItem;
    Raporty1: TMenuItem;
    Wykrespopularnoci1: TMenuItem;
    Dokumentacja: TMenuItem;
    procedure ListaKlientow1Click(Sender: TObject);
    procedure GrafikKalendarz1Click(Sender: TObject);
    procedure Wykrespopularnoci1Click(Sender: TObject);
    procedure DokumentacjaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uKlienci, uDM, uRezerwacje;

procedure TfrmMain.DokumentacjaClick(Sender: TObject);
var
  SciezkaDoPliku: string;
begin
  SciezkaDoPliku := ExtractFilePath(ParamStr(0)) + 'Dokumentacja.docx';

  if not FileExists(SciezkaDoPliku) then
  begin
    ShowMessage('B³¹d: Nie znaleziono pliku dokumentacji!' + #13#10 +
                'Upewnij siê, ¿e plik "Dokumentacja.docx" jest w folderze z programem.');
    Exit;
  end;

  ShellExecute(0, 'open', PChar(SciezkaDoPliku), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.GrafikKalendarz1Click(Sender: TObject);
begin
  DM.qryRezerwacjeView.Close;
  DM.qryRezerwacjeView.Open;

  if frmRezerwacje = nil then
    frmRezerwacje := TfrmRezerwacje.Create(Application);

  frmRezerwacje.Show;
end;

procedure TfrmMain.ListaKlientow1Click(Sender: TObject);
begin
  DM.qryKlienci.Close;
  DM.qryKlienci.Open;

  if frmKlienci = nil then
    frmKlienci := TfrmKlienci.Create(Application);

  frmKlienci.Show;
end;

procedure TfrmMain.Wykrespopularnoci1Click(Sender: TObject);
begin
  if frmStatystyki = nil then
    frmStatystyki := TfrmStatystyki.Create(Application);

  frmStatystyki.ShowModal;
end;

end.
