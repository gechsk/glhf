object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculating the time when a stone falls'
  ClientHeight = 189
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  DesignSize = (
    440
    189)
  PixelsPerInch = 96
  TextHeight = 13
  object HeightLabel: TLabel
    Left = 76
    Top = 27
    Width = 35
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Height:'
    ExplicitTop = 26
  end
  object TimeLabel: TLabel
    Left = 85
    Top = 67
    Width = 26
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Time:'
    ExplicitTop = 66
  end
  object Label1: TLabel
    Left = 223
    Top = 26
    Width = 28
    Height = 13
    Caption = 'metre'
  end
  object Label2: TLabel
    Left = 223
    Top = 66
    Width = 34
    Height = 13
    Caption = 'second'
  end
  object Label3: TLabel
    Left = 285
    Top = 92
    Width = 137
    Height = 13
    Caption = 'Enter the calculation number'
  end
  object Calculate: TButton
    Left = 76
    Top = 110
    Width = 191
    Height = 55
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Calculate'
    TabOrder = 0
    OnClick = CalculateClick
    ExplicitTop = 109
    ExplicitWidth = 181
  end
  object Time: TMemo
    Left = 117
    Top = 64
    Width = 100
    Height = 21
    Anchors = [akLeft, akBottom]
    Lines.Strings = (
      'Time')
    TabOrder = 1
    ExplicitTop = 63
  end
  object height: TMemo
    Left = 117
    Top = 24
    Width = 100
    Height = 21
    Anchors = [akLeft, akBottom]
    CharCase = ecLowerCase
    Lines.Strings = (
      '10')
    TabOrder = 2
    WantReturns = False
    WordWrap = False
    ExplicitTop = 23
  end
  object Edit1: TEdit
    Left = 285
    Top = 108
    Width = 137
    Height = 21
    TabOrder = 3
    Text = '2'
  end
  object Button1: TButton
    Left = 285
    Top = 135
    Width = 137
    Height = 30
    Caption = 'Enter'
    TabOrder = 4
    OnClick = Button1Click
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
