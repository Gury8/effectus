// Effectus auto-generated Mad Pascal source code listing
program callosPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Calling OS routines by using PROC
// memory assignment

procedure TEXTProc;
begin
  Write('Press two keys to scroll up!');
  Writeln;
end;

// Scroll screen
procedure SCROLLProc; assembler;
asm
  jsr $F7F7
  rts
end;

// Keyclick sound
procedure CLICKProc; assembler;
asm
  jsr $F983
  rts
end;

// Read key
procedure KBGETProc; assembler;
asm
  jsr $F302
  rts
end;

// Cassette-beep sound
procedure BEEPWAITProc(times : byte); assembler;
asm
  jsr $FDFC
  rts
end;

procedure MAINProc;
var
  N : byte;
  key : byte;
begin
  Write(Chr(125));
  GotoXY(2 + 1,  18 + 1);
  TEXTProc;
  BEEPWAITProc(1);
  KBGETProc;
 FOR N:=1 TO 20 do begin
  CLICKProc;
  SCROLLProc;
  end;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
