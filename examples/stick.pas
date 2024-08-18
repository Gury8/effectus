// Effectus auto-generated Mad Pascal source code listing
program stickPrg;

uses
  Crt, StringUtils, SySutils, Joystick;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Joystick demo
// (using Stick and Strig functions)

procedure MAINProc;
var
  b : byte;
  fire : byte;
begin
  Write(Chr(125));
  fire:=1;
 WHILE fire>0 do begin
  B:=stick[0];
  Write(B);  Writeln;
  fire:=strig[0];
  end;
  Write('TRIGGER WAS PRESSED!');
  Writeln;
end;

begin
  MAINProc;
end.
