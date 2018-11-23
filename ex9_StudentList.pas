program StudentList;
(*
читает записи из файла, в котором каждому студенту соответствует строка в формате
Фамилия Имя пол(M,F) возраст(целое число) средний_балл стипендия
все поля записываются через пробелы
считается, что все данные внесены корректно
возможность работы с file of Tstudent не используется, т.к. его сложно редактировать вручную при тестировании
*)
const
filename = 'students.txt';
const N = 10000;
type
   TStudent = Record
      lastName: String;
      firstName: String;
      gender: String;
      age: integer;
      avgScores: real;
      scholarshipAmount: real;
   end;
var
fileString:string;
student: TStudent;
maleStudents,femaleStudents: array[1..N] of TStudent;
f: TextFile;
mCnt,fCnt,i:integer;

  procedure writeStudent(const student: TStudent);
  begin
    writeln(student.firstName,' ',student.lastName);
    writeln('Age: ',student.age);
    writeln('Scores: ',student.avgScores);
    writeln('Scolarship: ',student.scholarshipAmount);
    writeln;
  end;
  procedure readWordFromString(var src,dest: string);
  var
  i,l:integer;
  begin
    src := trim(src);
    l:=Length(src);
    i:=1;
    while ( (i < l) and (src[i] <> ' ') and (src[i] <> chr(9)) ) do
    begin
      i := i+1;
    end;
    dest := trim(copy(src,1,i));
    Delete(src,1,i);
  end;
  function readStudentFromString(str:string): TStudent;
  var 
  student: TStudent;
  ageStr,scoresStr,moneyStr: string;
  age:integer;
  scores,money:real;
  begin
    readWordFromString(str,student.lastName);
    readWordFromString(str,student.firstName);
    readWordFromString(str,student.gender);
    readWordFromString(str,ageStr);
    student.age := StrToInt(ageStr);
    readWordFromString(str,scoresStr);
    student.avgScores := StrToReal(scoresStr);
    readWordFromString(str,moneyStr);
    student.scholarshipAmount := StrToReal(moneyStr);
    result := student;
  end;
begin
  mCnt := 0;
  fCnt := 0;
  assign(f, filename);
  reset(f); 
  while not eof(f) do
  begin
    readln(f,fileString);
    student := readStudentFromString(fileString);
    if (student.gender = 'M') then
      begin
        mCnt := mCnt + 1;
        maleStudents[mCnt] := student;
      end
    else
      begin
        fCnt := fCnt + 1;
        femaleStudents[fCnt] := student;
      end;
  end;
  close(f);
  writeln('MALE:');
  for i := 1 to mCnt do
    writeStudent(maleStudents[i]);
  writeln('FEMALE:');
  for i := 1 to fCnt do
    writeStudent(femaleStudents[i]);
  readln;
end.