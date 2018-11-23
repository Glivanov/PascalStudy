program GraphCtg;
uses 
GraphABC;
const
PI = 3.141592;
W = 800;
H = 600;
eps = 0.01;
INF = 1000000.0;
function F(x: real): real;
var 
res: real;
begin
  res := 1/tan(x);
  if res > INF then
    result := INF
  else if res < -INF then
    result := -INF
  else
    result := res;
end;

procedure drawArrow(x0,y0,l: integer; phi: real);
var
x2,x3,x4,y2,y3,y4: integer;
begin
  SetPenColor(clBlack);
  x2 := round(x0 + l * cos(phi));
  y2 := round(y0 - l * sin(phi));
  line(x0,y0,x2,y2);
  
  x3:=x2-round(10*cos(phi+pi/10));
  y3:=y2+round(10*sin(phi+pi/10));  
  line(x2,y2,x3,y3);
  
  x4:=x2-round(10*cos(phi-pi/10));
  y4:=y2+round(10*sin(phi-pi/10));
  line(x2,y2,x4,y4);
end;

procedure drawAxes(scale: integer);
begin
  drawArrow(0,H div 2,W,0);
  drawArrow(W div 2,H,H,PI/2);
  
  SetFontSize(12);
  SetFontColor(clGreen);
  SetBrushColor(clWhite);
  TextOut(W div 2 - 15, H div 2 + 5, '0');
  TextOut(W div 2 + scale, H div 2 + 5, '1');
  SetPenColor(clBlack);
  line(W div 2 + scale, H div 2 - 5,W div 2 + scale, H div 2 + 5);
  
  TextOut(W div 2 - 15, H div 2 - scale, '1');
  SetPenColor(clBlack);
  line(W div 2 - 5, H div 2 - scale,W div 2 + 5, H div 2 - scale);
  
  SetFontColor(clBlack);
  TextOut(W div 2 - 15, 5, 'Y');
  TextOut(W - 15, H div 2 - 25, 'X');
end;

var 
x0, y0, x1, y1, x2, y2, scale: integer;
x, y: real;
begin
  SetWindowSize(W,H);
  x0 := W div 2;
  y0 := H div 2;
  scale := 40;
  
  drawAxes(scale);

  setPenColor(clRed);
  x:=-PI/2;
  x2 := trunc(x0 + x*scale);
  y2 := trunc(y0 - F(x)*scale);
  repeat
    y := F(x);
    x1 := x2;
    y1 := y2;
    x2 := trunc(x0 + x*scale);
    y2 := trunc(y0 - y*scale);
    {пытаемся не попасть в разрывы второго порядка}
    if (abs(y1 - y2) < 10000) then
      line(x1,y1,x2,y2);
    x := x + eps;
  until x > PI/2;
end.