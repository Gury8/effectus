// Effectus auto-generated Mad Pascal source code listing
program str2numPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// String to number conversion demo
// using ValB, ValC and ValI functions

procedure MAINProc;
var
  key : byte;
  b : byte;
  i : integer;
  c : word;
begin
  B:=StrToInt('120');
  I:=StrToInt('-3400');
  C:=StrToInt('65000');
  Write('BYTE VALUE=');

  Write(B);  Writeln;
  Write('INTEGER VALUE=');

  Write(I);  Writeln;
  Write('WORD/CARD VALUE=');

  Write(C);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
