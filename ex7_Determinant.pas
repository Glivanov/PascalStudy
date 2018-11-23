program Determinant;
(*
Расчет определителя матрицы
т.к. работает со сравнительно небольшими целочисленными матрицам, 
чтобы избежать потерь на округление пользуемся разложением по первой строке по Лапласу
*)
const
N = 4;
fileName = 'matrix.txt';
type
TMatrix = array[1..N,1..N] of integer;
var
matrix: TMatrix;
i,j: integer;
  (* считать матрицу из файла *)
  procedure ReadMatrix(fileName: string;const matrix: TMatrix;N: integer);
  var 
  i,j: integer;
  F: TextFile;
  begin
    Assignfile(F, fileName);
    Reset(F);
    for j:=1 to N do
      for i:=1 to N do
        Read(F, matrix[i, j]);
    Closefile(F);
  end;
  (* вывести матрицу *)
  procedure WriteMatrix(const matrix: TMatrix; N:integer);
  var
  i,j: integer;
  begin
    for j := 1 to N do
      begin
        for i := 1 to N do
          WriteFormat('{0} ',matrix[i,j]);
        writeln;
      end;
  end;
  (* получить подматрицу с вычеркнутой I-й строкой и J-м столбцом *)
  function getSubMatrix(const matrix: TMatrix; N,excludeI,excludeJ: integer): TMatrix;
  var
  subMatrix: TMatrix;
  i,j,idx1,idx2:integer;
  begin
    for i:=1 to N - 1 do
      for j:=1 to N - 1 do
      begin
        idx1 := i + ord(i >= excludeI);
        idx2 := j + ord(j >= excludeJ);
        if (idx1 > 0) and (idx2 > 0) then
          subMatrix[i,j] := matrix[idx1,idx2];
      end;
    result := subMatrix;
  end;
  (* подсчет определителя по Лапласу *)
  function det(const matrix: TMatrix; N: integer): integer;
  var 
  subMatrix: TMatrix;
  res: integer;
  j,p: integer;
  begin
    res := 0;
    if (N = 1) then
      res := matrix[1][1]
    else
      for j:= 1 to N do
      begin
        if matrix[1][j] <> 0 then
        begin
          if Odd(1+j) then
            p := -1
          else 
            p := 1;
          subMatrix := getSubMatrix(matrix,N,1,j);
          res := res + p * matrix[1][j] * det(subMatrix,N-1);
        end;
      end;
    result := res;
  end;
BEGIN
  ReadMatrix(fileName,matrix,N);
  WriteMatrix(matrix,N);
  WriteFormat('Det(M) = {0}',det(matrix,N));
END.      
    