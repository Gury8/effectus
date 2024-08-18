// Effectus auto-generated Mad Pascal source code listing
program randPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Random number generator demo
// using Rand function
var
  i : byte;
  key : byte;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('Random number generator demonstration');
  Writeln;
  Write('using Rand function');
  Writeln;
  Writeln('');
  Write('Press any key to see random numbers!');
  Writeln;
  key:=Get(7);
  ReadKey;
  Writeln('');
  Write('Selected number between 0 and 100');
  Writeln;
  i:=Random(100);
  Write(i);  Writeln;
  Writeln('');
  Write('Selected number between 0 and 255');
  Writeln;
  i:=Random(255);
  Write(i);  Writeln;
  Writeln('');
  Write('Selected number between 0 and 3');
  Writeln;
  i:=Random(3);
  Write(i);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
