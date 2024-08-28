object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Pamadro'
  ClientHeight = 374
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object edtWorkTime: TLabeledEdit
    Left = 32
    Top = 48
    Width = 121
    Height = 23
    EditLabel.Width = 84
    EditLabel.Height = 15
    EditLabel.Caption = 'Work Time, min'
    NumbersOnly = True
    TabOrder = 0
    Text = '50'
  end
  object edtTaskName: TLabeledEdit
    Left = 32
    Top = 160
    Width = 121
    Height = 23
    EditLabel.Width = 57
    EditLabel.Height = 15
    EditLabel.Caption = 'Task Name'
    TabOrder = 2
    Text = 'Hello World'
  end
  object edtRestTime: TLabeledEdit
    Left = 32
    Top = 104
    Width = 121
    Height = 23
    EditLabel.Width = 85
    EditLabel.Height = 15
    EditLabel.Caption = 'Break Time, min'
    NumbersOnly = True
    TabOrder = 1
    Text = '10'
  end
  object btnStartStop: TButton
    Left = 54
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Start'
    Default = True
    TabOrder = 5
    OnClick = btnStartStopClick
  end
  object btnPauseResume: TButton
    Left = 54
    Top = 303
    Width = 75
    Height = 25
    Caption = 'Pause'
    Enabled = False
    TabOrder = 6
    OnClick = btnPauseResumeClick
  end
  object chkPlaySound: TCheckBox
    Left = 32
    Top = 200
    Width = 97
    Height = 17
    Caption = 'Play Sound'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object chkShowDialog: TCheckBox
    Left = 32
    Top = 232
    Width = 144
    Height = 17
    Caption = 'Show Notification'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object pnlTotal: TPanel
    Left = 0
    Top = 344
    Width = 184
    Height = 30
    Align = alBottom
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 7
  end
  object timerTask: TTimer
    Enabled = False
    OnTimer = timerTaskTimer
    Left = 144
    Top = 16
  end
  object timerCounter: TTimer
    Enabled = False
    OnTimer = timerCounterTimer
    Left = 136
    Top = 72
  end
  object tbarMain: TTaskbar
    TaskBarButtons = <>
    ProgressState = Normal
    TabProperties = []
    Left = 72
    Top = 208
  end
end
