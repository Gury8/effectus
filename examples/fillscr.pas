// Effectus auto-generated Mad Pascal source code listing
program fillscrPrg;

uses
  Crt, StringUtils, SySutils, Graph, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Fill screen demo
var
  RTCLOCK : byte absolute 20;
  SAVMSCL : byte absolute 88;
  SAVMSCH : byte absolute 89;
  I : byte;
  J : byte;
  TIME : byte;
  KEY : byte;
  SCREEN : word;

procedure BENCHProc;
begin
  InitGraph(24);
  RTCLOCK:=0;
  SCREEN:=SAVMSCL+256*SAVMSCH;
 FOR I:=0 TO 31 do begin
 FOR J:=0 TO 239 do begin
  Poke(SCREEN+J, 255);
  end;
  Inc(SCREEN, 240);
  end;
  TIME:=RTCLOCK;
  InitGraph(0);
  Write('', eol, ' ', TIME, ' JIFFIES');
  KEY:=Get(7);
  ReadKey;
end;

begin
  BENCHProc;
end.
