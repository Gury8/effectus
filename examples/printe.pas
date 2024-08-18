// Effectus auto-generated Mad Pascal source code listing
program printePrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// PrintE demo

procedure MAINProc;
var
  key : byte;
begin
  eff_string:='';
  Write('HELLO WORLD');
  Writeln;
  eff_string:='';
  Write('NEW LINE');
  Writeln;
  Writeln;
  eff_string:='';
  Write('ANOTHER NEW LINE');
  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
