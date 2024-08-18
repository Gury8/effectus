// Effectus auto-generated Mad Pascal source code listing
program sayyoPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  isPasAsm : boolean;

  strBuffer : string;
// Effectus example
// 
// Using Mad Pascal and Mad Assembler
// directly inside Effectus code listing
// with PAS {} and ASM {} code block

procedure SAYYOProc;
var
  rnd01 : byte;
  rnd02 : byte;
begin
  rnd01:=Random(255);
  rnd02:=Random(255);
  Write('YO! ');

  Poke(710, rnd01);
  Poke(712, rnd02);
end;

procedure MAINProc;
var
  ch : byte;
  i : byte;
begin
  Write('Press any key for greetings!');
  Writeln;
  asm {
  lda #0
  sta 710
  lda #42
  sta 712
  };
  repeat until keypressed;
  for i := 0 to 14 do begin
  SayYoProc;
  Sound(Random(3), 100, Random(10) + 8, 8);
  Delay(120);
  end;
  Poke(710, 80); Poke(712, 134);
  Sound(0, 0, 0, 0); Sound(1, 0, 0, 0);
  Sound(2, 0, 0, 0); Sound(3, 0, 0, 0);
  Writeln(#$9b#$9b'Press any key to exit!');
  ReadKey;
  //repeat until keypressed;
  ch:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
