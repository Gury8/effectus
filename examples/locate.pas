// Effectus auto-generated Mad Pascal source code listing
program locatePrg;

uses
  Crt, StringUtils, SySutils, Graph, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Using Locate in text mode and
// graphics mode

procedure MAINProc;
var
  key : byte;
  loc : byte;
begin
  InitGraph(0);
  GotoXY(3 + 1,  3 + 1);
  Write('HELLO,ATARIAN');

  GotoXY(3 + 1,  5 + 1);
  Write('AT RI');

  Write('', eol, '', eol, 'PRESS ANY KEY TO CONTINUE!');
  KEY:=Get(7);
  ReadKey;
  LOC:=GetPixel(10 + 1,  3);
  Write(LOC);
  GotoXY(5 + 1,  5 + 1);
  Write(Chr(LOC));
  key:=Get(7);
  ReadKey;
  InitGraph(7);
  SetColor(1);
  PutPixel(10, 10);
  MoveTo(10, 10);
  SetColor(2);
  PutPixel(20, 20);
  MoveTo(20, 20);
  SetColor(3);
  PutPixel(30, 30);
  MoveTo(30, 30);
  loc:=GetPixel(20, 20);
  SetColor(LOC);
  PutPixel(60, 60);
  MoveTo(60, 60);
  Write('Locate a pixel and re-plot it at the other location');

  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
