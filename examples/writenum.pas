// Effectus auto-generated Mad Pascal source code listing
program writenumPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Device I/O demo using PrintBD routine
// Sample file: H1:TESTNUM.TXT

procedure MAINProc;
var
  I : byte;
  key : byte;
begin
  Write(Chr(125));
  Write('PrintBD example', eol, '', eol, '');
  Cls(1);
  Opn(1, 8, 0, 'H1:TESTNUM.TXT');
  Write('Write numbers to disk...');
  Writeln;
 FOR I:=1 TO 12 do begin
  strBuffer:=IntToStr(I);
  BPut(1, @strBuffer[1], Length(strBuffer));
  end;
  Cls(1);
  Write('Done!(file H1:TESTNUM.TXT)');
  Writeln;
  Write('', eol, '', eol, 'Press any key to continue!');
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
