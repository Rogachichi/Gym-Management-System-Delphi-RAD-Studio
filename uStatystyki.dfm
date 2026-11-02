object frmStatystyki: TfrmStatystyki
  Left = 0
  Top = 0
  Caption = 'Statystyki Rezerwacji'
  ClientHeight = 457
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 668
    Height = 457
    Title.Text.Strings = (
      'TChart')
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 666
    ExplicitHeight = 449
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      Marks.OnTop = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
end
