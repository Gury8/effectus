// Effectus auto-generated Mad Pascal source code listing
program includePrg;

uses
  Crt, StringUtils, Graph;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// INCLUDE demo
// Effectus example
// 
// User library for INCLUDE demo
var
  CH : byte absolute 764;

procedure WAITFORKEYProc;
begin
  CH:=255;
 WHILE CH=255 do begin
  end;
end;

procedure PRINTTEXTProc;
begin
  Write('Hello world');
  Writeln;
end;

procedure CHANGECOLORProc;
begin
  Poke(710, 50);
  Poke(712, 160);
end;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('INCLUDE demonstration');
  Writeln;
  Writeln('');
  Write('Press any key and see my greetings!');
  Writeln;
  WAITFORKEYProc;
  Writeln('');
  PRINTTEXTProc;
  Writeln('');
  Write('Press any key to change color!');
  Writeln;
  WAITFORKEYProc;
  CHANGECOLORProc;
  WAITFORKEYProc;
end;

begin
  MAINProc;
end.
