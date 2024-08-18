// Effectus auto-generated Mad Pascal source code listing
program bytesPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// BYTE ARRAY demo
var
  key : byte;
  i : byte;
  num : array[0..4] of byte;  // num_byte_array

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('ARRAYs demonstration');
  Writeln;
  Writeln('');
  num[0]:=35;
  num[1]:=10;
  num[2]:=155;
  num[3]:=246;
  num[4]:=170;
 FOR i:=0 TO 4 do begin
  Write('Element ');

  Write(i);
  Write('=');

  Write(num[i]);  Writeln;
  end;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
