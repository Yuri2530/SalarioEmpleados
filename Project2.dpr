program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fSalario};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfSalario, fSalario);
  Application.Run;
end.
