object PacientEdit: TPacientEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1082' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
  ClientHeight = 551
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    459
    551)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 191
    Width = 459
    Height = 114
    Align = alTop
    Caption = #1040#1076#1088#1077#1089
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 61
      Width = 31
      Height = 13
      Caption = #1043#1086#1088#1086#1076
    end
    object Label4: TLabel
      Left = 208
      Top = 61
      Width = 59
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1084#1072
    end
    object Label3: TLabel
      Left = 8
      Top = 13
      Width = 43
      Height = 13
      Caption = #1054#1073#1083#1072#1089#1090#1100
    end
    object Label5: TLabel
      Left = 208
      Top = 15
      Width = 31
      Height = 13
      Caption = #1059#1083#1080#1094#1072
    end
    object LookLoc: TDBLookupComboBox
      Left = 8
      Top = 80
      Width = 193
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSLoc
      TabOrder = 0
    end
    object LookHouse: TDBLookupComboBox
      Left = 208
      Top = 80
      Width = 201
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSHoume
      TabOrder = 1
    end
    object LookArea: TDBLookupComboBox
      Left = 8
      Top = 32
      Width = 193
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSArea
      TabOrder = 2
    end
    object LookStreet: TDBLookupComboBox
      Left = 208
      Top = 34
      Width = 201
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSStreet
      TabOrder = 3
    end
  end
  object Button2: TButton
    Left = 368
    Top = 518
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1082
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 459
    Height = 191
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 216
      Top = 13
      Width = 80
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object Label8: TLabel
      Left = 216
      Top = 56
      Width = 76
      Height = 13
      Caption = #1055#1088#1080#1082#1088#1077#1087#1083#1077#1085#1080#1077' '
    end
    object Label9: TLabel
      Left = 216
      Top = 96
      Width = 75
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1091#1095#1072#1089#1090#1082#1072
    end
    object Label11: TLabel
      Left = 17
      Top = 138
      Width = 56
      Height = 13
      Caption = #1058#1080#1087' '#1087#1086#1083#1080#1089#1072
    end
    object Label12: TLabel
      Left = 216
      Top = 139
      Width = 69
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1086#1083#1080#1089#1072
    end
    object Label13: TLabel
      Left = 352
      Top = 13
      Width = 19
      Height = 13
      Caption = #1055#1086#1083
    end
    object LabeledEdit1: TLabeledEdit
      Left = 16
      Top = 32
      Width = 178
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
      TabOrder = 0
    end
    object LabeledEdit2: TLabeledEdit
      Left = 16
      Top = 72
      Width = 178
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1084#1103
      TabOrder = 1
    end
    object LabeledEdit3: TLabeledEdit
      Left = 16
      Top = 112
      Width = 178
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      TabOrder = 2
    end
    object DateTimePicker1: TDateTimePicker
      Left = 216
      Top = 32
      Width = 113
      Height = 21
      Date = 42294.127070486110000000
      Time = 42294.127070486110000000
      TabOrder = 3
    end
    object LookPolikl: TDBLookupComboBox
      Left = 216
      Top = 72
      Width = 217
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSPolikl
      TabOrder = 4
    end
    object LookSector: TDBLookupComboBox
      Left = 216
      Top = 112
      Width = 113
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSSector
      TabOrder = 5
    end
    object LookPolisType: TDBLookupComboBox
      Left = 17
      Top = 157
      Width = 177
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSPolisType
      TabOrder = 6
    end
    object Edit1: TEdit
      Left = 216
      Top = 158
      Width = 217
      Height = 21
      TabOrder = 7
    end
    object ComboBox1: TComboBox
      Left = 352
      Top = 32
      Width = 81
      Height = 21
      Style = csDropDownList
      TabOrder = 8
      Items.Strings = (
        #1052
        #1046)
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 305
    Width = 459
    Height = 200
    Align = alTop
    TabOrder = 3
    object Label6: TLabel
      Left = 18
      Top = 84
      Width = 100
      Height = 13
      Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1081' '#1089#1090#1072#1090#1091#1089
    end
    object Label7: TLabel
      Left = 17
      Top = 26
      Width = 111
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080
    end
    object Label10: TLabel
      Left = 19
      Top = 142
      Width = 72
      Height = 13
      Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
    end
    object LookSoc: TDBLookupComboBox
      Left = 17
      Top = 103
      Width = 186
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSSocStatus
      TabOrder = 0
    end
    object LookGroup: TDBLookupComboBox
      Left = 17
      Top = 45
      Width = 178
      Height = 21
      Enabled = False
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSGrInval
      TabOrder = 1
    end
    object LookWork: TDBLookupComboBox
      Left = 18
      Top = 160
      Width = 393
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = DM.DSWork
      TabOrder = 2
    end
    object CheckBox1: TCheckBox
      Left = 17
      Top = 3
      Width = 97
      Height = 17
      Caption = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
      TabOrder = 3
      OnClick = CheckBox1Click
    end
  end
end
