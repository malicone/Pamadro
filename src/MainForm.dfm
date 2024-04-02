object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pamadro'
  ClientHeight = 289
  ClientWidth = 204
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
    Left = 40
    Top = 48
    Width = 121
    Height = 23
    EditLabel.Width = 84
    EditLabel.Height = 15
    EditLabel.Caption = 'Work Time, min'
    TabOrder = 0
    Text = '50'
  end
  object edtTaskName: TLabeledEdit
    Left = 40
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
    Left = 40
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
    Left = 64
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 3
    OnClick = btnStartStopClick
  end
  object btnPauseResume: TButton
    Left = 64
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Pause'
    Enabled = False
    TabOrder = 4
    OnClick = btnPauseResumeClick
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
