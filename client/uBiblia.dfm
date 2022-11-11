object frmBiblia: TfrmBiblia
  Left = 0
  Top = 0
  Caption = 'B'#237'blia'
  ClientHeight = 640
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 190
    Height = 16
    Caption = 'Vers'#245'es da b'#237'blia dispon'#237'veis:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 127
    Width = 114
    Height = 16
    Caption = 'Selecione o Livro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 311
    Width = 64
    Height = 16
    Caption = 'Cap'#237'tulos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 95
    Top = 311
    Width = 71
    Height = 16
    Caption = 'Vers'#237'culos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lstVersoes: TListBox
    Left = 8
    Top = 30
    Width = 569
    Height = 91
    TabOrder = 0
    OnClick = lstVersoesClick
  end
  object lstLivros: TListBox
    Left = 8
    Top = 149
    Width = 569
    Height = 148
    ScrollWidth = 15
    TabOrder = 1
    OnClick = lstLivrosClick
  end
  object lstCapitulos: TListBox
    Left = 8
    Top = 333
    Width = 81
    Height = 299
    TabOrder = 2
    OnClick = lstCapitulosClick
  end
  object memVersiculos: TMemo
    Left = 95
    Top = 333
    Width = 848
    Height = 299
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
