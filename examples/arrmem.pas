// Effectus auto-generated Mad Pascal source code listing
program arrmemPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Using BYTE ARRAY as direct memory
// assignment
var
  key : byte;
  mem : byte;
  arrD : array[0..255] of byte absolute 28000;  // arrD_byte_array
  arrH : array[0..255] of byte absolute $0600;  // arrH_byte_array
  COL : array[0..255] of byte absolute 708;  // COL_byte_array

procedure MAINProc;
begin
  Write(Chr(125));
  COL[0]:=154;
  COL[1]:=40;
  COL[2]:=78;
  COL[3]:=132;
  COL[4]:=228;
  arrD[0]:=10;
  arrD[1]:=20+arrD[0];
  arrD[2]:=60;
  arrH[0]:=20;
  arrH[1]:=40;
  arrH[2]:=80;
// PrintF("%EarrD array elements:%E")
// PrintB(arrD(0))
// Print(",")
// PrintB(arrD(1))
// Print(",")
// PrintB(arrD(2))
  Write('', eol, 'arrD array elements:', eol, '', arrD[0], ',', arrD[1], ',', arrD[2], '');
  Write('', eol, '', eol, 'arrH array elements:', eol, '');
  Write(arrH[0]);
  Write(',');

  Write(arrH[1]);
  Write(',');

  Write(arrH[2]);  Writeln;
  Write('', eol, 'Peeked values:', eol, '');
  mem:=Peek(28000);
  Write(mem);  Writeln;
  mem:=Peek($0600);
  Write(mem);  Writeln;
  mem:=Peek(28001);
  Write(mem);  Writeln;
  mem:=Peek($0601);
  Write(mem);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
