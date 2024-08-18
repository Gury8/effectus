// Effectus auto-generated Mad Pascal source code listing
program bytevalPrg;

uses
  Crt, StringUtils;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Variable manipulation demo

procedure MAINProc;
var
  N1 : byte absolute 764;
  N2 : byte;
  N3 : byte = 12;
begin
  Write(Chr(125));
  N2:=14;
  Write('Value of 764 is ');

  Write(N1);  Writeln;
  Write('Value of N2 is ');

  Write(N2);  Writeln;
  Write('Predeclared value of N3 is ');

  Write(N3);  Writeln;
  N1:=255;
 WHILE N1=255 do begin
  end;
  N1:=255;
end;

begin
  MAINProc;
end.
