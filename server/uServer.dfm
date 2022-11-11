object frmServidor: TfrmServidor
  Left = 0
  Top = 0
  Caption = 'Servidor'
  ClientHeight = 353
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 219
    Height = 19
    Caption = 'Servidor rodando na porta 211'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object memLog: TMemo
    Left = 8
    Top = 80
    Width = 703
    Height = 265
    TabOrder = 0
  end
end
