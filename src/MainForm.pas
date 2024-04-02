unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    edtWorkTime: TLabeledEdit;
    edtTaskName: TLabeledEdit;
    edtRestTime: TLabeledEdit;
    btnStartStop: TButton;
    timerTask: TTimer;
    timerCounter: TTimer;
    btnPauseResume: TButton;
    procedure btnStartStopClick(Sender: TObject);
    procedure timerTaskTimer(Sender: TObject);
    procedure timerCounterTimer(Sender: TObject);
    procedure btnPauseResumeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private const
    _WORKING_TIME = 0;
    _REST_TIME = 1;
    _DEFAULT_WORKING_TIME_MIN = 50;
    _DEFAULT_REST_TIME_MIN = 10;
    _FORM_TITLE_W_OR_R_FORMATER = '%2.2d:%2.2d [%s] Pamadro';
    _FORM_TITLE_DEFAULT = 'Pamadro';
    _FORM_TITLE_PAUSED_PREFIX = 'Paused ';
    _WORKING_LABEL = 'w';
    _REST_LABEL = 'r';
    _START_LEBEL = 'Start';
    _STOP_LABEL = 'Stop';
    _PAUSE_LABEL = 'Pause';
    _RESUME_LABEL = 'Resume';
    procedure ResumeWorkOrRest;
    procedure PauseWorkOrRest;
    procedure StopWorkOrRest;
  private
    _TimeCounterSec: Integer;

    procedure StartWork;
    procedure StartRest;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  btnStartStop.Caption := _START_LEBEL;
  btnPauseResume.Caption := _PAUSE_LABEL;
  btnPauseResume.Enabled := False;
  timerCounter.Interval := MSecsPerSec;
end;

procedure TfrmMain.btnStartStopClick(Sender: TObject);
begin
  if btnStartStop.Caption = _START_LEBEL then
  begin
    btnStartStop.Caption := _STOP_LABEL;
    btnPauseResume.Enabled := True;
    edtWorkTime.Enabled := False;
    edtRestTime.Enabled := False;
    edtTaskName.Enabled := False;
    StartWork;
  end
  else
  begin
    btnStartStop.Caption := _START_LEBEL;
    btnPauseResume.Enabled := False;
    edtWorkTime.Enabled := True;
    edtRestTime.Enabled := True;
    edtTaskName.Enabled := True;
    StopWorkOrRest;
  end;
end;

procedure TfrmMain.btnPauseResumeClick(Sender: TObject);
begin
  if btnPauseResume.Caption = _PAUSE_LABEL then
  begin
    btnPauseResume.Caption := _RESUME_LABEL;
    PauseWorkOrRest;
  end
  else
  begin
    btnPauseResume.Caption := _PAUSE_LABEL;
    ResumeWorkOrRest;
  end;
end;

procedure TfrmMain.StartWork;
var
  WorkTimeMin: Integer;
begin
  WorkTimeMin := StrToIntDef(Trim(edtWorkTime.Text), _DEFAULT_WORKING_TIME_MIN);
  timerTask.Interval := WorkTimeMin * SecsPerMin * MSecsPerSec;
  timerTask.Tag := _WORKING_TIME;
  timerTask.Enabled := True;
  _TimeCounterSec := WorkTimeMin * SecsPerMin;
  timerCounter.Interval := MSecsPerSec;
  timerCounter.Enabled := True;
end;

procedure TfrmMain.StopWorkOrRest;
begin
  timerTask.Enabled := False;
  timerCounter.Enabled := False;
  Caption := _FORM_TITLE_DEFAULT;
  _TimeCounterSec := 0;
end;

procedure TfrmMain.StartRest;
var
  RestTimeMin: Integer;
begin
  timerTask.Enabled := False;
  RestTimeMin := StrToIntDef(Trim(edtRestTime.Text), _DEFAULT_REST_TIME_MIN);
  timerTask.Interval := RestTimeMin * SecsPerMin * MSecsPerSec;
  timerCounter.Enabled := False;
  timerTask.Tag := _REST_TIME;
  timerTask.Enabled := True;
  _TimeCounterSec := RestTimeMin * SecsPerMin;
  timerCounter.Enabled := True;
end;

procedure TfrmMain.PauseWorkOrRest;
begin
  timerTask.Enabled := False;
  timerCounter.Enabled := False;
  Caption := _FORM_TITLE_PAUSED_PREFIX + Caption;
end;

procedure TfrmMain.ResumeWorkOrRest;
var
  WorkTimeMin: Integer;
  RestTimeMin: Integer;
  RemainTimeSec: Integer;
begin
  WorkTimeMin := StrToIntDef(Trim(edtWorkTime.Text), _DEFAULT_WORKING_TIME_MIN);
  RestTimeMin := StrToIntDef(Trim(edtRestTime.Text), _DEFAULT_REST_TIME_MIN);
  if timerTask.Tag = _WORKING_TIME then
    RemainTimeSec := WorkTimeMin * SecsPerMin - _TimeCounterSec
  else
    RemainTimeSec := RestTimeMin * SecsPerMin - _TimeCounterSec;
  timerTask.Interval := RemainTimeSec * MSecsPerSec;
  timerTask.Enabled := True;
  timerCounter.Enabled := True;
end;

procedure TfrmMain.timerTaskTimer(Sender: TObject);
begin
  if timerTask.Tag = _WORKING_TIME then
  begin
    Beep;
    StartRest;
  end
  else// _REST_TIME
  begin
    Beep;
    Sleep(1000);
    Beep;
    StartWork;
  end;
end;

procedure TfrmMain.timerCounterTimer(Sender: TObject);
var
  Minuts, Seconds: Integer;
  TypeLabel: string;
begin
  Dec(_TimeCounterSec);
  Minuts := _TimeCounterSec div SecsPerMin;
  Seconds := _TimeCounterSec mod SecsPerMin;
  TypeLabel := _REST_LABEL;
  if timerTask.Tag = _WORKING_TIME then
    TypeLabel := _WORKING_LABEL;
  Caption := Format(_FORM_TITLE_W_OR_R_FORMATER, [Minuts, Seconds, TypeLabel]);
end;

end.
