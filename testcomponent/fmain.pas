unit fMain;


{$mode objfpc}{$H+}


interface


uses
{$IFDEF unix}
  BaseUnix,
{$ENDIF}
{$IFDEF windows}
  Windows,
{$ENDIF}
  Classes, SysUtils, simpleipc, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls,
  UniqueInstance
  ;

type

  { TMainForm }

  TMainForm = class(TForm)
    CrashAppButton: TButton;
    ShowDialogButton: TButton;
    Label1: TLabel;
    ListBox1: TListBox;
    SimpleIPCServer1: TSimpleIPCServer;
    UniqueInstance1: TUniqueInstance;
    procedure CrashAppButtonClick(Sender: TObject);
    procedure ShowDialogButtonClick(Sender: TObject);
    procedure UniqueInstance1OtherInstance(Sender: TObject; Count: Integer;
      Parameters: array of String);
  private
  public
  end; 


var
  MainForm: TMainForm;


implementation


{$R *.lfm}


{ TMainForm }

procedure TMainForm.UniqueInstance1OtherInstance(Sender: TObject; Count: Integer;
  Parameters: array of String);
var
  i: Integer;
begin
  Label1.Caption := Format('A new instance was created at %s with %d parameter(s):', [TimeToStr(Time), Count]);
  ListBox1.Clear;
  for i := 0 to Count - 1 do
    ListBox1.Items.Add(Parameters[i]);
  BringToFront;
  //hack to force app bring to front
  FormStyle := fsSystemStayOnTop;
  FormStyle := fsNormal;
end;


procedure TMainForm.CrashAppButtonClick(Sender: TObject);
begin
{$IFDEF unix}
  FpKill(FpGetpid, 9);
{$ENDIF}
{$IFDEF windows}
  TerminateProcess(GetCurrentProcess, 0);
{$ENDIF}
end;


procedure TMainForm.ShowDialogButtonClick(Sender: TObject);
begin
  Application.MessageBox('Hi! I am a modal Window!', 'Modal Window Check', MB_ICONINFORMATION);
end;


end.

