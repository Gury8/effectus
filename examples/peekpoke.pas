// Effectus auto-generated Mad Pascal source code listing
program peekpokePrg;

uses
  Crt, StringUtils, Graph;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// PEEK and POKE demo
var
  n : byte;
  mem : word;
  CH : byte absolute 764;
  COL : byte absolute 710;

procedure WAITFORKEYProc;
begin
 WHILE CH=255 do begin
  end;
  CH:=255;
end;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('PEEK demonstration');
  Writeln;
  Writeln('');
  n:=Peek(CH);
  Write('Shadow register 764 currently holds:');
  Writeln;
  Writeln('');
  Write(n);  Writeln;
  Writeln('');
  n:=Peek(710);
  Write('Shadow register 710 currently holds:');
  Writeln;
  Writeln('');
  Write(n);  Writeln;
  Writeln('');
  n:=Peek(559);
  Write('Shadow register 559 currently holds:');
  Writeln;
  Writeln('');
  Write(n);  Writeln;
  Writeln('');
  mem:=DPeek($0230);
  Write('Display List Pointer(DLISTL/DLISTH)');
  Writeln;
  Write('address:');
  Writeln;
  Writeln('');
  Write(mem);  Writeln;
  Write('', eol, '', eol, 'POKE demonstration', eol, '');
  Write('Press any key to change color!');
  Writeln;
  WAITFORKEYProc;
  COL:=0;
  Write('Press any key to change color again!');
  Writeln;
  WAITFORKEYProc;
  Poke(710, 212);
  Write('And again!');
  Writeln;
  WAITFORKEYProc;
  n:=65;
  Poke(710, n);
  Write('Last time!');
  Writeln;
  WAITFORKEYProc;
  n:=184;
  Poke(COL, n);
  WAITFORKEYProc;
end;

begin
  MAINProc;
end.
