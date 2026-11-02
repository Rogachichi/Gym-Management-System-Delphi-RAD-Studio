unit uNowaRezerwacja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TfrmNowaRezerwacja = class(TForm)
    Label1: TLabel;
    cbKlient: TDBLookupComboBox;
    Label2: TLabel;
    cbObiekt: TDBLookupComboBox;
    Label3: TLabel;
    dtpData: TDateTimePicker;
    Label4: TLabel;
    edtOd: TEdit;
    Label5: TLabel;
    edtDo: TEdit;
    btnZapisz: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNowaRezerwacja: TfrmNowaRezerwacja;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmNowaRezerwacja.FormShow(Sender: TObject);
begin
  dtpData.Date := Now;
end;

end.
