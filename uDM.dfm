object DM: TDM
  OnCreate = DataModuleCreate
  Height = 600
  Width = 800
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=DESKTOP-FL05APT'
      'ODBCAdvanced=TrustServerCertificate=yes'
      'OSAuthent=Yes'
      'Database=GymSystemDB'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 340
    Top = 280
  end
  object qryLogowanie: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        '          SELECT * FROM Uzytkownicy WHERE Login = :login AND Has' +
        'lo = :haslo')
    Left = 190
    Top = 140
    ParamData = <
      item
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        Name = 'HASLO'
        ParamType = ptInput
      end>
  end
  object qryKlienci: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '   SELECT * FROM Klienci')
    Left = 190
    Top = 80
  end
  object qryRezerwacjeView: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM v_RezerwacjeSzczegoly'
      'ORDER BY DataRezerwacji DESC, GodzinaOd ASC')
    Left = 190
    Top = 220
  end
  object qryLkpKlienci: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        '         SELECT KlientID, Imie + '#39' '#39' + Nazwisko AS Nazwa FROM Kl' +
        'ienci ORDER BY Nazwisko')
    Left = 190
    Top = 300
  end
  object dsLkpKlienci: TDataSource
    DataSet = qryLkpKlienci
    Left = 340
    Top = 210
  end
  object qryLkpObiekty: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '    SELECT ObiektID, Nazwa FROM Obiekty ORDER BY Nazwa')
    Left = 190
    Top = 380
  end
  object dsLkpObiekty: TDataSource
    DataSet = qryLkpObiekty
    Left = 340
    Top = 150
  end
  object qryStatystyki: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '     SELECT '
      '    o.Nazwa, '
      '    COUNT(r.RezerwacjaID) AS LiczbaRezerwacji'
      'FROM Obiekty o'
      'LEFT JOIN Rezerwacje r ON o.ObiektID = r.ObiektID'
      'GROUP BY o.Nazwa')
    Left = 190
    Top = 470
  end
end
