// Effectus auto-generated Mad Pascal source code listing
program recsPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Record ARRAY demonstration
type
  rec = record
  NUM1 : byte;
  NUM2 : word;
  NUM3 : word;
  end;  // type
var
  DATA : array[0..15] of byte;  // DATA_byte_array
  ENTRY : ^rec;
  KEY : byte;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('Record ARRAY demonstration');
  Writeln;
  Writeln('');
  ENTRY:=pointer(word(@DATA));
  Inc(ENTRY, 0);
// ENTRY=DATA+(0*5)
  ENTRY^.NUM1:=10;
  ENTRY^.NUM2:=1000;
  ENTRY^.NUM3:=10000;
  ENTRY:=pointer(word(@DATA));
  Inc(ENTRY, (1*5));
  ENTRY^.NUM1:=20;
  ENTRY^.NUM2:=2000;
  ENTRY^.NUM3:=20000;
  ENTRY:=pointer(word(@DATA));
  Inc(ENTRY, (2*5));
  ENTRY^.NUM1:=30;
  ENTRY^.NUM2:=3000;
  ENTRY^.NUM3:=30000;
  Write('Some data retrieved from the records');
  Writeln;
  Writeln('');
  ENTRY:=pointer(word(@DATA));
  Inc(ENTRY, 0);
  Write('entry.num1=');

  Write(ENTRY.NUM1);  Writeln;
  ENTRY:=pointer(word(@DATA));
  Inc(ENTRY, 5);
  Write('entry.num2=');

  Write(ENTRY.NUM2);  Writeln;
  ENTRY:=pointer(word(@DATA));
  Inc(ENTRY, 10);
  Write('entry.num3=');

  Write(ENTRY.NUM3);  Writeln;
  Write('', eol, '---------------------');
  KEY:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
