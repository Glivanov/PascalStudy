program CoprimeNumbers;
(*
Проверка на взиамную простоту двух целых чисел
с использование алгоритма Евклида для определения НОД
*)
var 
a,b,nod: integer;
begin
  write('a=');
  readln(a);
  write('b=');
  readln(b);
  
  a:=abs(a);
  b:=abs(b);
  while (a <> 0) and (b <> 0) do
    if (a > b) then
      a:=a mod b
    else
      b:=b mod a;
  nod := a + b;
  if (nod = 1) then
    writeln('a and b vzaimno prostie')
  else
    writeln('a and b ne vzaimno prostie');
end.
    