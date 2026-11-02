object frmRezerwacje: TfrmRezerwacje
  Left = 0
  Top = 0
  Caption = 'Harmonogram Rezerwacji'
  ClientHeight = 441
  ClientWidth = 782
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
    Top = 40
    Width = 1097
    Height = 401
    Align = alCustom
    DataSource = dsRezerwacje
    PopupMenu = popRezerwacje
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RezerwacjaID'
        Title.Caption = 'ID'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Klient'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefon'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Obiekt'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataRezerwacji'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GodzinaOd'
        Title.Caption = 'Od'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GodzinaDo'
        Title.Caption = 'Do'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 0
      Top = 9
      Width = 105
      Height = 25
      Caption = 'Nowa rezerwacja'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 272
      Top = 9
      Width = 105
      Height = 25
      Hint = 'Zapisuje raport do pliku .txt'
      Caption = 'Eksportuj do PDF'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button2Click
    end
    object btnAnulujRezerwacje: TButton
      Left = 120
      Top = 9
      Width = 137
      Height = 25
      Caption = 'Odwo'#322'aj (Zmie'#324' status)'
      TabOrder = 2
      OnClick = btnAnulujRezerwacjeClick
    end
  end
  object dsRezerwacje: TDataSource
    DataSet = DM.qryRezerwacjeView
    Left = 376
    Top = 264
  end
  object popRezerwacje: TPopupMenu
    Left = 568
    Top = 256
    object Usurezerwacj1: TMenuItem
      Caption = 'Usu'#324' rezerwacj'#281
      ShortCut = 46
      OnClick = Usurezerwacj1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Plik tekstowy (*.txt)|*.txt'
    Left = 232
    Top = 264
  end
end
