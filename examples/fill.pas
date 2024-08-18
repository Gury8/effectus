// Effectus auto-generated Mad Pascal source code listing
program fillPrg;

uses
  Crt, StringUtils, Graph;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Using Fill procedure
// in graphics mode 7

procedure MAINProc;
begin
  InitGraph(7);
  Write('FILL TEST');
  Writeln;
  Poke(708 + 4,  0*16 +  15);
  SetColor(1);
  PutPixel(20, 3);
  MoveTo(20, 3);
  LineTo(120, 3);
  LineTo(120, 20);
  LineTo(20, 20);
  LineTo(20, 3);
  SetColor(2);
  PutPixel(10, 22);
  MoveTo(10, 22);
  LineTo(180, 22);
  LineTo(180, 70);
  LineTo(10, 70);
  LineTo(10, 22);
  Poke(765, 3);
  FloodFill(2, 2, 2);
  SetColor(3);
  PutPixel(50, 35);
  MoveTo(50, 35);
  LineTo(146, 35);
  LineTo(146, 80);
  LineTo(50, 80);
  LineTo(50, 35);
  Poke(765, 1);
  FloodFill(65, 50, 3);
  SetColor(1);
  Poke(765, 2);
  FloodFill(100, 18, 1);
  Write(Chr(125));
  Write('FILL TEST');
  Writeln;
  repeat
  until false;
end;

begin
  MAINProc;
end.
