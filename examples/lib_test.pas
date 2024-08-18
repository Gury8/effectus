// Effectus auto-generated Mad Pascal source code listing
program lib_testPrg;

uses
  Crt, StringUtils, Graph;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example:
// User library for INCLUDE demo

procedure WAITFORKEYProc;
begin
 WHILE CH=255 do begin
  end;
end;

procedure PRINTTEXTProc;
begin
  eff_string:='';
  Write('Hello world');

  Writeln;
end;

procedure CHANGECOLORProc;
begin
  Poke(710, 50);
  Poke(712, 160);
end;

begin
  CHANGECOLORProc;
end.
