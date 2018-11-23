program TriangleArea;
(*
Расчет площади треугольника по формуле Герона
подразумевается, что ввод корректен
не проверяется, составляют ли стороны треугольник
*)
var
S,a,b,c,p: real;
begin
  write('a=');
  readln(a);
  write('b=');
  readln(b);
  write('c=');
  readln(c);
  
  p:=(a+b+c)/2;
  S:=sqrt(p*(p-a)*(p-b)*(p-c));
  WritelnFormat('S={0:f2}',S);
  readln;
end.