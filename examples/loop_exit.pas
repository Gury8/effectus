// Effectus auto-generated Mad Pascal source code listing
program loop_exitPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Using EXIT command in loop statements

procedure MAINProc;
var
  key : byte;
  n : byte;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('Using EXIT command in loop statements FOR,WHILE and UNTIL');
  Writeln;
  Writeln('');
  Write('Counting from 1 to 10...');
  Writeln;
  Writeln('');
 FOR n:=1 to 10 do begin
  Write(n);
  Write(Chr(44));
  if  n=7  then begin
  break;
  end;  // if
  end;
  Writeln('');
  Write('Escaped from FOR loop!');
  Writeln;
  Writeln('');
  Write('Counting from 1 to 20...');
  Writeln;
  Writeln('');
  n:=1;
  n:=n+1;
 WHILE n<21 do begin
  Write(n);
  Write(Chr(44));
  if  n=14  then begin
  break;
  end;  // if
  n:=n+1;
  end;
  Writeln('');
  Write('Escaped from WHILE loop!');
  Writeln;
  Writeln('');
  Write('Counting from 1 to 6...');
  Writeln;
  Writeln('');
  n:=0;
  repeat
  Inc(n);
  Write(n);
  Write(Chr(44));
  break;
 UNTIL n=6;
  Writeln('');
  Write('Escaped from UNTIL loop!');
  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
