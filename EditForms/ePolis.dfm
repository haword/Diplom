object PolisEdit: TPolisEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'PolisEdit'
  ClientHeight = 121
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 37
    Width = 56
    Height = 13
    Caption = #1058#1080#1087' '#1087#1086#1083#1080#1089#1072
  end
  object Label2: TLabel
    Left = 160
    Top = 40
    Width = 69
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1083#1080#1089#1072
  end
  object LookPolisType: TDBLookupComboBox
    Left = 8
    Top = 56
    Width = 145
    Height = 21
    KeyField = 'id'
    ListField = 'name'
    ListSource = DM.DSPolisType
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 159
    Top = 56
    Width = 178
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 256
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
  end
end
