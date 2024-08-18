// Effectus auto-generated Mad Pascal source code listing
program bitwisePrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Logical (bitwise) manipulation demo
var
  key : byte;
  n : byte;
  a : byte;
  b : byte;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Logical(bitwise) operators demo');
  Writeln;
  Writeln('');
  Write('n=');

  n:=2;
  n:=n+2;
  Write(n);  Writeln;
  Writeln('');
  Write('n==&2 Result: ');

  n:=n AND 2;
  Write(n);  Writeln;
  Writeln('');
  Write('n=n&40 Result: ');

  n:=n AND 40;
  Write(n);  Writeln;
  Writeln('');
  Write('n=');

  n:=2;
  Write(n);  Writeln;
  Writeln('');
  Write('n==!2 Result: ');

  n:=n XOR 2;
  Write(n);  Writeln;
  Writeln('');
  Write('n==XOR 2 Result: ');

  n:=n XOR 2;
  Write(n);  Writeln;
  Writeln('');
  Write('n==!n Result: ');

  n:=n XOR n;
  Write(n);  Writeln;
  Writeln('');
  Write('a=40');
  Writeln;
  Write('b=a LSH 1 Result: ');

  a:=40;
  b:=a SHL 1;
  Write(b);  Writeln;
  Writeln('');
  Write('b=a RSH 1 Result: ');

  b:=a SHR 1;
  Write(b);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
