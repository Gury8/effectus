// Effectus auto-generated Mad Pascal source code listing
program shipPrg;

uses
  Crt, StringUtils, Graph;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Graphics demo (Moving ship)
// by pedgarcia (AtariAge forum user)
// 
// Modified by Bostjan Gorisek
// (comment on line 43, because there
// are issues with nested branches)
var
  WAIT_SYNC : byte absolute $D40A;
  VCOUNT : byte absolute $D40B;

procedure plotShipProc(x : byte; y : byte; c : byte);
begin
  SetColor(c);
  PutPixel(x+1, y);
  MoveTo(x+1, y);
  PutPixel(x+1, y+1);
  MoveTo(x+1, y+1);
  PutPixel(x+2, y);
  MoveTo(x+2, y);
  PutPixel(x+1, y-1);
  MoveTo(x+1, y-1);
  PutPixel(x, y-2);
  MoveTo(x, y-2);
  PutPixel(x, y+2);
  MoveTo(x, y+2);
end;

procedure eraseShipProc(x : byte; y : byte; c : byte);
begin
  SetColor(c);
  PutPixel(x-1, y-2);
  MoveTo(x-1, y-2);
  PutPixel(x, y-1);
  MoveTo(x, y-1);
  PutPixel(x-1, y+2);
  MoveTo(x-1, y+2);
  PutPixel(x, y+1);
  MoveTo(x, y+1);
  PutPixel(x, y);
  MoveTo(x, y);
end;

procedure MAINProc;
var
  i : word;
begin
  InitGraph(7+16);
  Poke(708 + 4,  0*16 +  0);
  Poke(708 + 0,  4*16 +  8);
  Poke(708 + 1,  7*16 +  8);
 for i:=2 to 150 do begin
  PLOTSHIPProc(i, 40, 1);
// do until vcount&128 od
  ERASESHIPProc(i, 40, 0);
  end;
// pause
 for i:=0 to 32767 do begin
  end;
end;

begin
  MAINProc;
end.
