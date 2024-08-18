// Effectus auto-generated Mad Pascal source code listing
program hi_atariagePrg;

uses
  Crt, StringUtils, SySutils, Graph, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Printing on device #6 allowing to
// display text in gr. mode 1 and 2
// 
// Hi, AtariAge by ascrnet
// http://www.atariage.com/forums/topic/112501-effectus-new-atari-cross-compiler-alpha-stage/page__st__25
// 
// Demo Effectus
var
  key : byte;

procedure MAINProc;
var
  i : integer;
begin
  InitGraph(2);
  GotoXY(5 + 1,  5 + 1);
  strBuffer:=Concat('hi atariage', #$9b);
  BPut(6, @strBuffer[1], Length(strBuffer));
 FOR i:=0 TO 2 do begin
  Write('hi,AtariAge........');
  Writeln;
  end;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
