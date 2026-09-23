program SyncDashboard;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  uConsultas in 'uConsultas.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.Title := 'SyncDashboard';
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
