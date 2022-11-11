program biblia;

uses
  Vcl.Forms,
  uBiblia in 'uBiblia.pas' {frmBiblia},
  ClientClassesUnitOLD in 'ClientClassesUnitOLD.pas',
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule1: TDataModule},
  ClientClassesUnit in 'ClientClassesUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TfrmBiblia, frmBiblia);
  Application.Run;
end.
