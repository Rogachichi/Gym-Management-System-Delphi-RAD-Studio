object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'System Si'#322'ownia - Panel G'#322#243'wny'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 248
    Top = 144
    object Klienci1: TMenuItem
      Caption = 'Klienci'
      object Klienci2: TMenuItem
        Caption = 'Lista klient'#243'w'
        OnClick = ListaKlientow1Click
      end
    end
    object Rezerwacje1: TMenuItem
      Caption = 'Rezerwacje'
      object GrafikKalendarz1: TMenuItem
        Caption = 'Grafik/Kalendarz'
        OnClick = GrafikKalendarz1Click
      end
    end
    object Raporty1: TMenuItem
      Caption = 'Raporty'
      object Wykrespopularnoci1: TMenuItem
        Caption = 'Wykres popularno'#347'ci'
        OnClick = Wykrespopularnoci1Click
      end
    end
    object Plik2: TMenuItem
      Caption = 'Pomoc'
      object Dokumentacja: TMenuItem
        Caption = 'Dokumentacja'
        OnClick = DokumentacjaClick
      end
    end
  end
end
