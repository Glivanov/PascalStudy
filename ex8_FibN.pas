program FibN;
(*
Выводит первых N чисел Фибоначчи
около 45-го числа возникает целочисленое переполнение, для исправления требуется 
использование других типов данных
*)
var
a_tmp,a_2,a_1,a,N: integer;
i:integer;
begin
  write('N = ');
  readln(N);
  a_2 := 0;
  a_1 := 1;
  a := 1;
  for i := 1 to N do
  begin
    WriteFormat('{0} ',a);
    a := a_2 + a_1;
    a_2 := a_1;
    a_1 := a;
  end;
end.
    
    