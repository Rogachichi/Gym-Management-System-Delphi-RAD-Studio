object frmKlienci: TfrmKlienci
  Left = 0
  Top = 0
  Caption = 'Lista Klient'#243'w'
  ClientHeight = 548
  ClientWidth = 977
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 56
    Width = 969
    Height = 492
    Align = alCustom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Dodaj klienta'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnSprzedajKarnet: TButton
    Left = 200
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Dodaj karnet'
    TabOrder = 2
    OnClick = btnSprzedajKarnetClick
  end
  object Button2: TButton
    Left = 312
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Usu'#324' klienta'
    TabOrder = 3
    OnClick = Button2Click
  end
  object DataSource1: TDataSource
    DataSet = DM.qryKlienci
    Left = 8
    Top = 8
  end
end
