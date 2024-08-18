// Effectus auto-generated Mad Pascal source code listing
program arrmemcPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Using CARD ARRAY as direct memory
// assignment

procedure MAINProc;
var
  key : byte;
  i : byte;
  mem : word;
  arr : array[0..255] of word absolute $8000;  // arr_byte_array
begin
  Write(Chr(125));
  arr[0]:=14;
  arr[1]:=230;
  arr[2]:=5100;
  arr[3]:=63000;
  Write('', eol, 'Array values:', eol, '');
 FOR i:=0 to 3 do begin
  Write(arr[i]);  Writeln;
  end;
  Write('', eol, 'Array values in descending order:', eol, '');
  mem:=DPeek($8006);
  Write(mem);  Writeln;
  mem:=DPeek($8004);
  Write(mem);  Writeln;
  mem:=DPeek($8002);
  Write(mem);  Writeln;
  mem:=DPeek($8000);
  Write(mem);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
