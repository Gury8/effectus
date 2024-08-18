// Effectus auto-generated Mad Pascal source code listing
program arraysetPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Using ARRAY predeclared values with
// BYTE ARRAY and CARD ARRAY
var
  key : byte;
  I : byte;
  BYTES : array[0..3] of byte = (10, 20, 30, 40);  // BYTES_byte_array
var
  CARDS : array[0..3] of word = (540, 1300, 26800, 65300);  // CARDS_byte_array

procedure MAINProc;
begin
  Write(Chr(125));
  Write('EFFECTUS EXAMPLE:');
  Writeln;
  Write('ARRAYS DEMONSTRATION');
  Writeln;
  Writeln('');
  Write('BYTE ARRAY VALUES:');
  Writeln;
 FOR I:=0 TO 3 do begin
  Write(BYTES[I]);
  if  I<3  then begin
  Write(',');

  end;  // if
  end;
  Writeln('');
  Writeln('');
  Write('CARD ARRAY VALUES:');
  Writeln;
 FOR I:=0 TO 3 do begin
  Write(CARDS[I]);
  if  I<3  then begin
  Write(',');

  end;  // if
  end;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
