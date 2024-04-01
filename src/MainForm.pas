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
    btnStart: TButton;
    timerTask: TTimer;
    timerCounter: TTimer;
    btnStop: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure timerTaskTimer(Sender: TObject);
    procedure timerCounterTimer(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private const
    _WORKING_TIME = 0;
    _REST_TIME = 1;
    _DEFAULT_WORKING_TIME_MIN = 50;
    _DEFAULT_REST_TIME_MIN = 10;
    _FORM_TITLE_FORMATER = '%2.2d:%2.2d [%s] Pamadro';
    _FORM_TITLE_DEFAULT = 'Pamadro';
    _WORKING_LABEL = 'w';
    _REST_LABEL = 'r';
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

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  StartWork;
end;

procedure TfrmMain.timerTaskTimer(Sender: TObject);
begin
  if timerTask.Tag = _WORKING_TIME then
  begin
    Beep;
    StartRest;
  end
  else
  begin
    Beep;
    Sleep(1000);
    Beep;
    StartWork;
  end;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  timerTask.Enabled := False;
  timerCounter.Enabled := False;
  Caption := _FORM_TITLE_DEFAULT;
  _TimeCounterSec := 0;
  btnStart.Enabled := True;
  btnStop.Enabled := False;
end;

procedure TfrmMain.StartWork;
var
  WorkTimeMin: Integer;
begin
  btnStart.Enabled := False;
  btnStop.Enabled := True;
  WorkTimeMin := StrToIntDef(Trim(edtWorkTime.Text), _DEFAULT_WORKING_TIME_MIN);
  timerTask.Interval := WorkTimeMin * SecsPerMin * MSecsPerSec;
  timerTask.Tag := _WORKING_TIME;
  timerTask.Enabled := True;
  _TimeCounterSec := WorkTimeMin * SecsPerMin;
  timerCounter.Interval := MSecsPerSec;
  timerCounter.Enabled := True;
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
  Caption := Format(_FORM_TITLE_FORMATER, [Minuts, Seconds, TypeLabel]);
end;

end.
