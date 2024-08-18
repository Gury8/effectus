// Effectus auto-generated Mad Pascal source code listing
program printdePrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Device Input/Output demonstration

procedure MAINProc;
var
  TEXT_BUF : array[0..10] of byte;  // TEXT_BUF_byte_array
  KEY : byte;
  num : word;
begin
  Cls(1);
  Opn(1, 8, 0, 'S:');
  Write('PRINTING STRING VALUES TO CHANNEL 1');
  Writeln;
  Write('ON S: DEVICE');
  Writeln;
  Writeln('');
  strBuffer:=Concat('TEST1', #$9b);
  BPut(1, @strBuffer[1], Length(strBuffer));
  for eff_var:=0 to 10 do
    TEXT_BUF[eff_var]:=32;
  eff_string:='TEST2';
TEXT_BUF[0]:=5;
  for eff_var:=1 to 5 do 
    TEXT_BUF[eff_var]:=Ord(eff_string[eff_var]);
  strBuffer:=Concat(eff_string, #$9b);
  BPut(1, @strBuffer[1], Length(strBuffer));
  strBuffer:= 'TEST3';
  BPut(1, @strBuffer[1], Length(strBuffer));
  strBuffer:=IntToStr(10);
  BPut(1, @strBuffer[1], Length(strBuffer));
  Writeln('');
  strBuffer:=Concat(IntToStr(20), #$9b);
  BPut(1, @strBuffer[1], Length(strBuffer));
  strBuffer:=IntToStr(2000);
  BPut(1, @strBuffer[1], Length(strBuffer));
  Writeln('');
  strBuffer:=Concat(IntToStr(10000), #$9b);
  BPut(1, @strBuffer[1], Length(strBuffer));
  strBuffer:=IntToStr(6230);
  BPut(1, @strBuffer[1], Length(strBuffer));
  Writeln('');
  num:=65334;
  strBuffer:=Concat(IntToStr(num), #$9b);
  BPut(1, @strBuffer[1], Length(strBuffer));
  Writeln('');
  Cls(1);
  KEY:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
