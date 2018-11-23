program FallAnimation;
(*
Анимация движения тела под углом к горизонту
угол вводится пользователем 
скорость и интервал времени могут быть изменены в коде программы
*)
uses GraphABC;
const 
W = 800;
H = 600;
Pi = 3.141592;
g = 9.8;
var
phi,x0,y0,x,y,v : integer;
vx,vy,t,dt: real;

function gradToRadian(grad: integer): real;
begin
  result := grad * Pi / 180;
end;

procedure drawAxes;
begin
    SetPenColor(clRed);
    line(20,H - 20,W - 20,H - 20);
    line(20,H - 20,20,20);
end;

procedure drawArrow(x0,y0,l: integer; phi: real; lbl: string);
var
x2,x3,x4,y2,y3,y4: integer;
begin
  SetPenColor(clGreen);
  x2 := round(x0 + l * cos(phi));
  y2 := round(y0 - l * sin(phi));
  line(x0,y0,x2,y2);
  
  SetFontSize(12);
  SetFontColor(clGreen);
  SetBrushColor(clWhite);
  TextOut(x2 + 10, y2 - 10, lbl);
  
  x3:=x2-round(10*cos(phi+pi/10));
  y3:=y2+round(10*sin(phi+pi/10));  
  line(x2,y2,x3,y3);
  
  x4:=x2-round(10*cos(phi-pi/10));
  y4:=y2+round(10*sin(phi-pi/10));
  line(x2,y2,x4,y4);
end;

begin
  v := 80;{скорость}
  dt := 0.05;{интервал времени}

  write('введите угол (в градусах):');
  readln(phi);
  
  {проекции скорости}
  vx:=v * Cos(gradToRadian(phi));
  vy:=v * Sin(gradToRadian(phi));
  
  SetWindowSize(W,H);
  LockDrawing;
  x0 := 20;
  y0 := H - 20;
  x := x0;
  y := y0;
    
  repeat
    drawAxes;
    drawArrow(x0,y0,v,gradToRadian(phi),'V0');   
    
    SetPenColor(clBlack);
    SetBrushColor(clBlack);
    Circle (x, y, 10);
    Redraw;
    ClearWindow(clWhite);
    
    x := trunc(x0 + vx * t);
    y := trunc(y0 - vy * t + g * sqr(t) / 2);
    t := t + dt;
  until (y > y0);
end.