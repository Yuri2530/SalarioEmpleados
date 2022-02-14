unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TfSalario = class(TForm)
    pPrincipal: TPanel;
    lPrincipal: TLabel;
    bCalcular: TButton;
    lNombre: TLabel;
    lHoras: TLabel;
    eNombre: TEdit;
    eHoras: TEdit;

    

    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bCalcularClick(Sender: TObject);
    procedure eHorasKeyPress(Sender: TObject; var Key: Char);
    procedure eNombreKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSalario: TfSalario;

const
    valorHora = 15000;
    valorExtra = 19000;
    horasNormales = 35;

implementation

{$R *.DFM}

procedure TfSalario.FormShow(Sender: TObject);
begin
     lPrincipal.Caption:= 'Digite los datos requeridos y oprima el botón Calcular Salario...';
end;

procedure TfSalario.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin

     Resize:= False;

end;

procedure TfSalario.FormCreate(Sender: TObject);
begin
     width := 442;
     Height:= 206;
     Position:=poScreenCenter;
end;

procedure TfSalario.bCalcularClick(Sender: TObject);
var
horasLaboradas, totalSalario: Double;
nombreEmpleado, textoValor: String;
begin
 horasLaboradas := strtoFloat(eHoras.Text);
 nombreEmpleado := eNombre.Text;
 if horasLaboradas <= 35 then
 begin
 totalSalario := horasLaboradas*valorHora;
 textoValor := formatfloat('#,##0',totalSalario);
 ShowMessage ('El empleado ' + nombreEmpleado + ' se le debe pagar la suma de ' + textoValor + ' pesos' );
 eHoras.Clear;
 eNombre.Clear;
 end
 else
 begin
 totalSalario := (horasNormales*valorHora) + ((horasLaboradas - horasNormales)* valorExtra) ;
 textoValor := formatfloat('#,##0',totalSalario);
 ShowMessage ('El empleado ' + nombreEmpleado + ' se le debe pagar la suma de ' + textoValor + ' pesos' );
 eHoras.Clear;
 eNombre.Clear;
 end;


end;

procedure TfSalario.eHorasKeyPress(Sender: TObject; var Key: Char);
begin
if ( StrScan('0123456789.'+chr(7)+chr(8), Key) = nil ) then  Key := #0;
end;

procedure TfSalario.eNombreKeyPress(Sender: TObject; var Key: Char);
begin
if ( StrScan('abcdefghijklmnñopqrstuvwxyz ABCDEFGHIJKLMNÑOPQRSTUVWXYZ'+chr(7)+chr(8), Key) = nil ) then  Key := #0;
end;

end.
