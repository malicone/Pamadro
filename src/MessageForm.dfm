object frmMessage: TfrmMessage
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Pamadro Message'
  ClientHeight = 124
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  StyleElements = [seFont, seClient]
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object btnClose: TButton
    Left = 123
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object pnlTaskName: TRelativePanel
    Left = 0
    Top = 0
    Width = 320
    Height = 41
    ControlCollection = <>
    Align = alTop
    Caption = 'Task Name'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = -8
  end
  object pnlMessage: TRelativePanel
    Left = 0
    Top = 41
    Width = 320
    Height = 41
    ControlCollection = <>
    Align = alTop
    Caption = 'Message'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 0
  end
  object timerCounter: TTimer
    OnTimer = timerCounterTimer
    Left = 256
    Top = 64
  end
  object timerClose: TTimer
    OnTimer = timerCloseTimer
    Left = 256
    Top = 16
  end
end
