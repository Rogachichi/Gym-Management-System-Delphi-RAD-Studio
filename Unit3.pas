unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmLogowanie = class(TForm)
    edtLogin: TEdit;
    edtHaslo: TEdit;
    btnZaloguj: TButton;
    btnAnuluj: TButton;

    procedure btnZalogujClick(Sender: TObject);
    procedure btnAnulujClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogowanie: TfrmLogowanie;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmLogowanie.btnZalogujClick(Sender: TObject);
begin
  if (edtLogin.Text = '') or (edtHaslo.Text = '') then
  begin
    ShowMessage('Podaj login i has³o!');
    Exit;
  end;

  DM.qryLogowanie.Close;
  DM.qryLogowanie.ParamByName('login').AsString := edtLogin.Text;
  DM.qryLogowanie.ParamByName('haslo').AsString := edtHaslo.Text;
  DM.qryLogowanie.Open;

  if DM.qryLogowanie.RecordCount > 0 then
  begin
    ShowMessage('Zalogowano pomyœlnie! Witaj ' + DM.qryLogowanie.FieldByName('Imie').AsString);
    ModalResult := mrOK;
  end
  else
  begin
    ShowMessage('B³êdny login lub has³o.');
    edtHaslo.Clear;
    edtHaslo.SetFocus;
  end;
end;

procedure TfrmLogowanie.btnAnulujClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
