object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculating the time when a stone falls'
  ClientHeight = 188
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  DesignSize = (
    430
    188)
  PixelsPerInch = 96
  TextHeight = 13
  object HeightLabel: TLabel
    Left = 132
    Top = 26
    Width = 35
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Height:'
  end
  object TimeLabel: TLabel
    Left = 141
    Top = 66
    Width = 26
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Time:'
  end
  object Label1: TLabel
    Left = 279
    Top = 26
    Width = 28
    Height = 13
    Caption = 'metre'
  end
  object Label2: TLabel
    Left = 279
    Top = 66
    Width = 34
    Height = 13
    Caption = 'second'
  end
  object Calculate: TButton
    Left = 132
    Top = 109
    Width = 181
    Height = 55
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Calculate'
    TabOrder = 0
    OnClick = CalculateClick
  end
  object Time: TMemo
    Left = 173
    Top = 63
    Width = 100
    Height = 21
    Anchors = [akLeft, akBottom]
    Lines.Strings = (
      'Time')
    TabOrder = 1
  end
  object height: TMemo
    Left = 173
    Top = 23
    Width = 100
    Height = 21
    Anchors = [akLeft, akBottom]
    CharCase = ecLowerCase
    Lines.Strings = (
      '10')
    TabOrder = 2
    WantReturns = False
    WordWrap = False
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 48
    object N1: TMenuItem
      Caption = 'File'
      object Save2: TMenuItem
        Caption = 'Save'
        OnClick = Save2Click
      end
      object SaveReport2: TMenuItem
        Caption = 'SaveReport'
        OnClick = SaveReport2Click
      end
      object Open2: TMenuItem
        Caption = 'Open'
        OnClick = Open2Click
      end
    end
    object Close1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
    object Guide1: TMenuItem
      Caption = 'Guide'
      OnClick = Guide1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 96
  end
  object SaveDialog1: TSaveDialog
    Left = 16
    Top = 136
  end
end