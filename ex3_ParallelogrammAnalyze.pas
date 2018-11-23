program AnalyzeParallelogramm;
(*
Изменено относительно задачи 2 В9:
анализируется 4-х угольник по двум сторонам и диагонали
*)
var
a,b,d: real;
isTriangle,hasSquareRoot,hasEqualSides: boolean;
const
eps = 0.01;
begin
  write('side a=');
  readln(a);
  write('side b=');
  readln(b);
  write('diagonal d=');
  readln(d);
  
  isTriangle:= (a+b>d) and (b+d>a) and (a+d>b);
  hasSquareRoot:= abs(sqr(a)+sqr(b)-sqr(d)) < eps;
  hasEqualSides:=abs(a-b)<eps;
  
  if isTriangle and hasEqualSides and hasSquareRoot then
    writeln('kvadrat')
  else if isTriangle and hasSquareRoot then
    writeln('pryamougolnik')
  else if isTriangle and hasEqualSides then
    writeln('romb')
  else if isTriangle then
    writeln('parallelogramm')
  else
    writeln('ne chetirehugolnik');
  readln;
end.
  
  
  
