program Pamadro;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  MessageForm in 'MessageForm.pas' {frmMessage},
  Globals in 'Globals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
