// Effectus auto-generated Mad Pascal source code listing
program inline_asmPrg;

uses
  Crt, StringUtils, SySutils, Graph, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Inline machine language demo

procedure MAINProc;
var
  key : byte;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('Using inline machine language');
  Writeln;
  Writeln('');
asm
    .by $A9 $21 $8D $C6 $02 $00 $60 
  end;
  Write('Press any key to change color!(1)');
  Writeln;
  key:=Get(7);
  ReadKey;
asm
    .by $A9 $90 $3E $C6 $02 $0 $60 
  end;
  Write('Press any key to change color!(2)');
  Writeln;
  key:=Get(7);
  ReadKey;
asm
    .by $A9 $60 $8D $C6 $02 $0 $60 
  end;
  Write('Press any key to change color!(3)');
  Writeln;
  key:=Get(7);
  ReadKey;
asm
    .by $A9 $76 $8D $C6 $02 $0 $60 
  end;
  Write('Press any key to change color!(4)');
  Writeln;
  key:=Get(7);
  ReadKey;
asm
    .by $A9 $13 $8D $C6 $02 $0 $60 
  end;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
