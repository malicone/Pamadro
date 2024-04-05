object frmMessage: TfrmMessage
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Pamadro Message'
  ClientHeight = 118
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
  object lblMessage: TLabel
    Left = 118
    Top = 32
    Width = 89
    Height = 21
    Alignment = taCenter
    Caption = 'Take a break'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnClose: TButton
    Left = 124
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnCloseClick
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
