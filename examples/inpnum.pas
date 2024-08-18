// Effectus auto-generated Mad Pascal source code listing
program inpnumPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Input numeric values
// using InputB, InputI and InputC

procedure MAINProc;
var
  key : byte;
  n1 : byte;
  n2 : integer;
  n3 : word;
begin
  Write(Chr(125));
  Writeln('');
  Write('Enter BYTE value: ');
  Writeln;
  Readln(n1);
  Write('Enter INT value: ');
  Writeln;
  Readln(n2);
  Write('Enter CARD value: ');
  Writeln;
  Readln(n3);
  Write('', eol, '', eol, 'And data entered is:', eol, '', eol, '');
  Write(n1);  Writeln;
  Write(n2);  Writeln;
  Write(n3);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
