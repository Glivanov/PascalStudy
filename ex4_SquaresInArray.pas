program FindSqaures;
(*
поиск квадратов в случайно сгенерированном массиве из N элементов от 1 до MAX
*)
const 
N = 100;
MAX = 10000;  
eps = 0.001;
var
i: integer;
A: array[1..N] of integer;
begin
  for i:=1 to N do
    A[i]:=Random(1,MAX);

  write('Kvadrati: ');  
  for i:=1 to N do
    if (abs(sqr(trunc(sqrt(A[i]))) - A[i]) < eps) then
      WriteFormat('{0} ',A[i]);
  readln;
end.