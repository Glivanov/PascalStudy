program FallAnimation;
uses GraphABC;
const 
W = 800,
H = 600;
Pi = 3.141592;
var
phi,x0,y0,x,y,t : integer;

function gradToRadian(grad: integer): real;
begin
  result := grad * Pi / 180;
end;

begin
  write('введите угол (в градусах):');
  readln(phi);
  SetWindowSize(W,H);
  LockDrawing;
  x0 := 100;
  y0 := H - 100;
  x := x0;
  y := y0;
  repeat
    SetBrushColor(clBlack);
    Circle (x, y, 10);
    Redraw;
    ClearWindow(clWhite);
    
    x := 
  until (y > y0);
end.