// Effectus auto-generated Mad Pascal source code listing
program diskgetPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Device I/O demo using GetD routine
// Sample file: H1:TESTNUM.TXT
var
  n : byte;
  i : byte;
  KEY : byte;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('GetD example', eol, '', eol, '');
  Cls(1);
  Opn(1, 4, 0, 'H1:TESTNUM.TXT');
 FOR i:=1 to 15 do begin
  n:=Get(1);
  Write(Chr(n));
  end;
  Cls(1);
  Write('', eol, 'All numbers read!', eol, '', eol, '');
// DO
// n=GetD(1) Put(n)
// UNTIL EOF(1)
// OD
  KEY:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
