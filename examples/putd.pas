// Effectus auto-generated Mad Pascal source code listing
program putdPrg;

uses
  Crt, StringUtils, SySutils, Graph, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// PutD and PutDE demo
// Print character codes to the screen

procedure PUTD_TESTProc;
var
  CH : byte absolute 764;
begin
  InitGraph(1+16);
  Put(6,  65);
  Put(6,  66);
  Put(6,  67);
  Put(6, $9b);
  Put(6,  68);
  Put(6,  69);
  Put(6,  70);
// PRESS ANY KEY TO EXIT
  CH:=255;
  repeat
 UNTIL CH<>255;
  CH:=255;
end;

begin
  PUTD_TESTProc;
end.
