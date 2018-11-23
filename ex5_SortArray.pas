program SortArray;
const 
N = 100;
MAX = 100;
var
A: array[1..N] of integer;
i,j,e: integer;
begin
  write('Random array: ');
  for i:=1 to N do
  begin
    A[i]:=Random(1,MAX);
    WriteFormat('{0} ',A[i]);
  end;
  
  (* Sort algorithm *)
  for j:=2 to N do
  begin
    e := A[j];
    i := j-1;
    while ( (i > 0) and (A[i] > e) ) do
    begin
      A[i+1] := A[i];
      i := i-1;
    end;
    A[i+1] := e;
  end;  
  
  writeln;
  write('Sorted array: ');
  for i:=1 to N do
    WriteFormat('{0} ',A[i]);
  readln;
end.