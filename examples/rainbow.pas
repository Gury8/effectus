// Effectus auto-generated Mad Pascal source code listing
program rainbowPrg;

uses
  Crt, StringUtils, Graph;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Rainbow graphics demo
// **********************************************************************
// *                                                                    *
// * PhoeniX SoftCrew  ACTION! Programme                                *
// **********************************************************************
// Programmname    :Rainbow
// Filename        :RAINBOW.ACT
// von             :Carsten Strotmann
// letzte Aenderung:12.10.91
// Bemerkung       :fuer M.Heinzig

procedure RAINBOWProc;
var
  vcount : byte absolute $D40B;
  wsync : byte absolute $D40A;
  rtclok : byte absolute $14;
  getcolor : byte absolute $D018;
  u : byte absolute $7;
  ch : byte absolute 764;
begin
  ch:=$FF;
  repeat
  wsync:=u;
  getcolor:=vcount+rtclok;
 UNTIL ch<>$FF;
end;

begin
  RAINBOWProc;
end.
