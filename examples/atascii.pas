// Effectus auto-generated Mad Pascal source code listing
program atasciiPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Printing ATASCII characters

procedure MAINProc;
var
  key : byte;
  n : byte;
  a : byte;
  b : byte;
  arr : array[0..5] of byte;  // arr_byte_array
begin
  Write(Chr(125));
  Write('ASCII manipulation demonstration');
  Writeln;
  Writeln('');
  Write('Character Put test');
  Writeln;
  Write(Chr(65));
  Write(Chr(84));
  Write(Chr(97));
  Write(Chr(82));
  Write(Chr($49));
  Writeln('');
  Write('Some math');
  Writeln;
  a:=65;
  b:=66;
  Write('a=65,b=66,a+b=');

  n:=a+b;
  Write(n);  Writeln;
  Writeln('');
  Write('Array test');
  Writeln;
  arr[1]:=65;
  Write(arr[1]);
  arr[2]:=50;
  arr[3]:=67;
  arr[4]:=52;
 FOR n:=2 TO 4 do begin
  Write(Chr(44));
  Write(ARR[N]);
  end;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
