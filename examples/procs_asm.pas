// Effectus auto-generated Mad Pascal source code listing
program procs_asmPrg;

uses
  Crt, StringUtils, SySutils, Graph, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Using local PROCedures using machine
// language
var
  KEY : byte;

procedure PokeTestProc(d : byte); assembler;
asm
  lda d
    .by $8D $C6 $02 $60 
end;
procedure TESTProc(CURSOR : byte; BACK : byte; BORDER : byte; X : byte; Y : byte; UPDOWN : byte); assembler;
asm
  lda CURSOR
  ldx BACK
  ldy BORDER
  mva X $a3
  mva Y $a4
  mva UPDOWN $a5
    .by $8E $C6 $02 $8C $C8 $02 $8D $F0 $02 $A5 $A5 $8D $F3 $02 $A5 $A3 $8D $55 $00 $A5 $A4 $8D $54 $00 $60 
end;
procedure MAINProc;
begin
  Write(Chr(125));
  Write('', eol, 'Press any key to change color!', eol, '');
  KEY:=Get(7);
  ReadKey;
  POKETESTProc(68);
  Writeln('');
  Write('Press any key to see everything');
  Writeln;
  Write('upside down...');
  Writeln;
  KEY:=Get(7);
  ReadKey;
  TESTProc(1, 20, 30, 8, 8, 4);
  Write('LOOK,I AM UPSIDE DOWN!');
  Writeln;
  KEY:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
