program Project1;

uses
  System.SysUtils,
  Vcl.Forms,
  Vcl.Controls,
  uDM in 'uDM.pas' {DM: TDataModule},
  Unit3 in 'Unit3.pas' {frmLogowanie},
  uMain in 'uMain.pas' {frmMain},
  uKlienci in 'uKlienci.pas' {frmKlienci},
  uEdycjaKlienta in 'uEdycjaKlienta.pas' {frmEdycjaKlienta},
  uRezerwacje in 'uRezerwacje.pas' {frmRezerwacje},
  uNowaRezerwacja in 'uNowaRezerwacja.pas' {frmNowaRezerwacja},
  uLogikaKarnetow in 'uLogikaKarnetow.pas',
  uStatystyki in 'uStatystyki.pas' {frmStatystyki},
  uSplash in 'uSplash.pas' {frmSplash};


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  frmSplash := TfrmSplash.Create(nil);
  try
    frmSplash.Show;
    frmSplash.Update;

    Sleep(2000);
  finally
    frmSplash.Free;
  end;


  Application.CreateForm(TDM, DM);
  frmLogowanie := TfrmLogowanie.Create(nil);
  try
    if frmLogowanie.ShowModal = mrOK then
    begin
      Application.CreateForm(TfrmMain, frmMain);
      Application.Run;
    end
    else
    begin
      Application.Terminate;
    end;
  finally
    frmLogowanie.Free;
  end;
end.
