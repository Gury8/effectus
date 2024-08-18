// Effectus auto-generated Mad Pascal source code listing
program pointerPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Using pointer
var
  key : byte;
  ptr : ^word;
  i : integer;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('POINT=ER variable demonstration');
  Writeln;
  Writeln('');
  i:=70;
  Write('Current value of variable i: ');
  Writeln;
  Write(I);  Writeln;
  ptr:=@I;
  Write('Memory address of variable i: ');
  Writeln;
  Write(word(ptr));  Writeln;
  Write('New value of variable ptr and i: ');
  Writeln;
  ptr^:=251;
  Write(ptr^);
  Write('=');

  Write(i);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
