object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Pamadro'
  ClientHeight = 353
  ClientWidth = 194
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
    Left = 37
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
    Left = 37
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
    Left = 37
    Top = 104
    Width = 121
    Height = 23
    EditLabel.Width = 78
    EditLabel.Height = 15
    EditLabel.Caption = 'Rest Time, min'
    TabOrder = 1
    Text = '10'
  end
  object btnStartStop: TButton
    Left = 59
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Start'
    Default = True
    TabOrder = 5
    OnClick = btnStartStopClick
  end
  object btnPauseResume: TButton
    Left = 59
    Top = 303
    Width = 75
    Height = 25
    Caption = 'Pause'
    Enabled = False
    TabOrder = 6
    OnClick = btnPauseResumeClick
  end
  object chkPlaySound: TCheckBox
    Left = 37
    Top = 200
    Width = 97
    Height = 17
    Caption = 'Play Sound'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object chkShowDialog: TCheckBox
    Left = 37
    Top = 232
    Width = 97
    Height = 17
    Caption = 'Show Dialog'
    Checked = True
    State = cbChecked
    TabOrder = 4
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
end
