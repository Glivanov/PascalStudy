program GraphCtg;
uses 
GraphABC;
const
PI = 3.141592;
function F(x: real): real;
begin
  result := 1/tan(x);
end;
var 
y_, x_, x0, y0, x1, y1, k: integer;
x, y: real;
begin
  SetWindowSize(640,480);
  x0:=320; y0:=240; k:=20;
  line(20,y0, 620,y0);
  line(x0,20, x0,460);
  setPenColor(clRed);

  x:=-PI/2;
  y_ := trunc(y0);
  x_ := trunc(x0);
  while x<=PI/2 do
  begin
    y:=F(x);
    x1:=trunc(x0+x*k);
    y1:=trunc(y0-y*k);
    line(x_,y_,x1,y1);
    x_ := x1;
    y_ := y1;
    x:=x+0.02
  end;
end.