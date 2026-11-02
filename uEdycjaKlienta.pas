unit uEdycjaKlienta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmEdycjaKlienta = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtImie: TEdit;
    edtNazwisko: TEdit;
    edtTelefon: TEdit;
    edtEmail: TEdit;
    btnZapisz: TButton;
    btnAnuluj: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdycjaKlienta: TfrmEdycjaKlienta;

implementation

{$R *.dfm}

uses uDM;


end.
