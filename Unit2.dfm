object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 498
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnOpen: TButton
    Left = 120
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Open'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnOpenClick
  end
  object btnSave: TButton
    Left = 488
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object OutputFilePathEdit: TEdit
    Left = 432
    Top = 80
    Width = 217
    Height = 23
    TabOrder = 2
  end
  object btnEncrypt: TButton
    Left = 312
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Encrypt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnEncryptClick
  end
  object EncryptionKeyEdit: TEdit
    Left = 240
    Top = 376
    Width = 225
    Height = 23
    TabOrder = 4
  end
  object InputFilePathEdit: TEdit
    Left = 64
    Top = 80
    Width = 233
    Height = 23
    TabOrder = 5
  end
  object Button1: TButton
    Left = 312
    Top = 465
    Width = 75
    Height = 25
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.txt'
    Title = 'Open File'
    Left = 24
    Top = 448
  end
  object SaveDialog1: TSaveDialog
    Left = 648
    Top = 440
  end
end
