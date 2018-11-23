program FindEvenWords;
(*
Выводит все четные слова из строки
словом считается любая непрерывная последовательность из символов, неравных пробелу и табуляци
*)
var 
str: string;
isEven: boolean;
wordLength,textLength,i: integer;
begin
  write('Input text:');
  readln(str);
  
  isEven := false;
  repeat
  begin
    str := trim(str);
    textLength := Length(str);
    
    i:=1;
    while ( (i < textLength) and (str[i] <> ' ') and (str[i] <> chr(9)) ) do
    begin
      i := i+1;
    end;
    if isEven then
      writeln( trim(copy(str,1,i)) );
    delete(str,1,i);
    isEven := not(isEven);
  end
  until (textLength = 0);
  readln;
end.