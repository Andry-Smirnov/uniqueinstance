program testinstance;

{$mode objfpc}{$H+}

uses
{$IFDEF UNIX}
  {$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}
{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  fMain;

{$R *.res}

begin
  Application.Title:='UniqueInstanceTest';
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
