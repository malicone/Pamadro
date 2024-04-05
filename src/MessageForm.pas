unit MessageForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Globals;

type
  TfrmMessage = class(TForm)
    btnClose: TButton;
    lblMessage: TLabel;
    timerCounter: TTimer;
    timerClose: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure timerCounterTimer(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private const
    _CLOSE_INTERVAL_SEC = 11;
    _COUNTER_INTERVAL_SEC = 1;
    _BTN_CLOSE_FORMATTER = 'Close (%1.1d)';
    _TAKE_BREAK = 'Take a break';
    _START_WORK = 'Start work';
    procedure SetDefaultValues;
  private
    { Private declarations }
    _CounterSec: Integer;
  public
    { Public declarations }
    procedure SetMessage(AIntervalType: TIntervalTypeEnum);
  end;

procedure ShowPamadroMessage(AIntervalType: TIntervalTypeEnum);

implementation

{$R *.dfm}

procedure ShowPamadroMessage(AIntervalType: TIntervalTypeEnum);
var
  frmMessage: TfrmMessage;
begin
  frmMessage := TfrmMessage.Create(nil);
  frmMessage.SetMessage(AIntervalType);
  frmMessage.Show;
end;

procedure TfrmMessage.FormCreate(Sender: TObject);
begin
  SetDefaultValues;
  timerClose.Enabled := True;
  timerCounter.Enabled := True;
end;

procedure TfrmMessage.SetDefaultValues;
begin
  timerClose.Interval := _CLOSE_INTERVAL_SEC * MSecsPerSec;
  timerCounter.Interval := _COUNTER_INTERVAL_SEC * MSecsPerSec;
  _CounterSec := _CLOSE_INTERVAL_SEC;
end;

procedure TfrmMessage.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMessage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfrmMessage.timerCloseTimer(Sender: TObject);
begin
  Close;
end;

procedure TfrmMessage.timerCounterTimer(Sender: TObject);
begin
  Dec(_CounterSec);
  btnClose.Caption := Format(_BTN_CLOSE_FORMATTER, [_CounterSec]);
end;

procedure TfrmMessage.SetMessage(AIntervalType: TIntervalTypeEnum);
begin
  case AIntervalType of
    itWork: lblMessage.Caption := _TAKE_BREAK;
    itRest: lblMessage.Caption := _START_WORK;
  end;
end;

end.
