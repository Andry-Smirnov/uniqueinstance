unit Unit1; 


{$mode objfpc}{$H+}


interface


uses
{$IFDEF unix}
  BaseUnix,
{$ENDIF}
{$IFDEF windows}
  Windows,
{$ENDIF}
  Classes,
  SysUtils,
  LResources,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls;


type

  { TForm1 }

  TForm1 = class(TForm)
    ButCrashApp: TButton;
    procedure ButCrashAppClick(Sender: TObject);
  private
  public
  end; 


var
  Form1: TForm1; 


implementation


{$R *.lfm}


{ TForm1 }

procedure TForm1.ButCrashAppClick(Sender: TObject);
begin
{$IFDEF unix}
  FpKill(FpGetpid, 9);
{$ENDIF}
{$IFDEF windows}
  TerminateProcess(GetCurrentProcess, 0);
{$ENDIF}
end;


initialization


end.

