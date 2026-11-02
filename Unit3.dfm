object frmLogowanie: TfrmLogowanie
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Logowanie do Systemu'
  ClientHeight = 243
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object edtLogin: TEdit
    Left = 96
    Top = 56
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtHaslo: TEdit
    Left = 96
    Top = 112
    Width = 121
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnZaloguj: TButton
    Left = 120
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Zaloguj'
    TabOrder = 2
    OnClick = btnZalogujClick
  end
  object btnAnuluj: TButton
    Left = 256
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Wyjd'#378
    TabOrder = 3
  end
end
