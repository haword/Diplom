object SectorEdit: TSectorEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1091#1095#1072#1089#1090#1082#1072
  ClientHeight = 181
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 61
    Width = 67
    Height = 13
    Caption = #1055#1086#1083#1080#1082#1083#1080#1085#1080#1082#1072
  end
  object LabeledEdit1: TLabeledEdit
    Left = 16
    Top = 24
    Width = 97
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088
    TabOrder = 0
  end
  object LookPolikl: TDBLookupComboBox
    Left = 16
    Top = 80
    Width = 209
    Height = 21
    KeyField = 'id'
    ListField = 'name'
    ListSource = DM.DSPolikl
    TabOrder = 1
  end
  object Button1: TButton
    Left = 150
    Top = 148
    Width = 75
    Height = 25
    Caption = #1054#1082
    TabOrder = 2
    OnClick = Button1Click
  end
end
