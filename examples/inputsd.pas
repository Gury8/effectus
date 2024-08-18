// Effectus auto-generated Mad Pascal source code listing
program inputsdPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
  eff_array_buffer : array[0..255] of byte;
// Effectus example
// 
// Device I/O demo using InputSD and
// InputMD procedures to read text file
// 
// Sample file on H1: device: TEST.TXT
var
  key : byte;
  str_buffer1 : array[0..254] of byte;  // str_buffer1_byte_array

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Device I/O demo');
  Writeln;
  Write('using InputSD and InputMD procedures');
  Writeln;
  Write('to read text file');
  Writeln;
  Writeln('');
  Write('Sample file: TEST.TXT');
  Writeln;
  Cls(1);
  Opn(1, 4, 0, 'H1:TEST.TXT');
  Write('', eol, 'InputSD example:', eol, '');
   str_buffer1[0]:=255;
  BGet(1,  str_buffer1, SizeOf( str_buffer1));
for eff_var:=0 to 253 do
    eff_array_buffer[eff_var + 1]:= str_buffer1[eff_var];
for eff_var:=1 to 254 do
     str_buffer1[eff_var]:=eff_array_buffer[eff_var];
  eff_string:='';
  for eff_var:=1 to str_buffer1[0] do
    StrAdd(eff_string, chr(str_buffer1[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Cls(1);
  Opn(1, 4, 0, 'H1:TEST.TXT');
  Write('', eol, 'InputMD example:', eol, '');
   str_buffer1[0]:=255;
  BGet(1,  str_buffer1,  255);
for eff_var:=0 to 253 do
    eff_array_buffer[eff_var + 1]:= str_buffer1[eff_var];
for eff_var:=1 to 254 do
     str_buffer1[eff_var]:=eff_array_buffer[eff_var];
  eff_string:='';
  for eff_var:=1 to str_buffer1[0] do
    StrAdd(eff_string, chr(str_buffer1[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Cls(1);
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
