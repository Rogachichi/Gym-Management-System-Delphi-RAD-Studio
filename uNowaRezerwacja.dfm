object frmNowaRezerwacja: TfrmNowaRezerwacja
  Left = 0
  Top = 0
  Caption = 'Dodaj Rezerwacj'#281
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 80
    Top = 56
    Width = 33
    Height = 15
    Caption = 'Klient:'
  end
  object Label2: TLabel
    Left = 80
    Top = 96
    Width = 38
    Height = 15
    Caption = 'Obiekt:'
  end
  object Label3: TLabel
    Left = 80
    Top = 136
    Width = 27
    Height = 15
    Caption = 'Data:'
  end
  object Label4: TLabel
    Left = 80
    Top = 176
    Width = 118
    Height = 15
    Caption = 'Od godziny (HH:MM):'
  end
  object Label5: TLabel
    Left = 80
    Top = 216
    Width = 117
    Height = 15
    Caption = 'Do godziny (HH:MM):'
  end
  object cbKlient: TDBLookupComboBox
    Left = 136
    Top = 53
    Width = 145
    Height = 23
    KeyField = 'KlientID'
    ListField = 'Nazwa'
    ListSource = DM.dsLkpKlienci
    TabOrder = 0
  end
  object cbObiekt: TDBLookupComboBox
    Left = 136
    Top = 93
    Width = 145
    Height = 23
    KeyField = 'ObiektID'
    ListField = 'Nazwa'
    ListSource = DM.dsLkpObiekty
    TabOrder = 1
  end
  object dtpData: TDateTimePicker
    Left = 136
    Top = 128
    Width = 186
    Height = 23
    Date = 46057.000000000000000000
    Time = 0.723850324073282500
    TabOrder = 2
  end
  object edtOd: TEdit
    Left = 224
    Top = 173
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '10:00'
  end
  object edtDo: TEdit
    Left = 224
    Top = 213
    Width = 121
    Height = 23
    TabOrder = 4
    Text = '11:00'
  end
  object btnZapisz: TButton
    Left = 168
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Zapisz'
    ModalResult = 1
    TabOrder = 5
  end
end
