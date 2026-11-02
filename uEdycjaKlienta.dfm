object frmEdycjaKlienta: TfrmEdycjaKlienta
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Dane Klienta'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 56
    Top = 35
    Width = 26
    Height = 15
    Caption = 'Imi'#281':'
  end
  object Label2: TLabel
    Left = 56
    Top = 83
    Width = 53
    Height = 15
    Caption = 'Nazwisko:'
  end
  object Label3: TLabel
    Left = 56
    Top = 131
    Width = 87
    Height = 15
    Caption = 'Numer telefonu:'
  end
  object Label4: TLabel
    Left = 56
    Top = 179
    Width = 37
    Height = 15
    Caption = 'E-mail:'
  end
  object edtImie: TEdit
    Left = 176
    Top = 32
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtNazwisko: TEdit
    Left = 176
    Top = 80
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object edtTelefon: TEdit
    Left = 176
    Top = 128
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object edtEmail: TEdit
    Left = 176
    Top = 176
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object btnZapisz: TButton
    Left = 184
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Zapisz'
    ModalResult = 1
    TabOrder = 4
  end
  object btnAnuluj: TButton
    Left = 80
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Anuluj'
    ModalResult = 2
    TabOrder = 5
  end
end
