// Effectus auto-generated Mad Pascal source code listing
program getkeyPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Device Input/Output demonstration

procedure MAINProc;
var
  key : byte;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('Device Input/Output demonstration');
  Writeln;
  Writeln('');
  Write('Press any key to play with and');
  Writeln;
  Write('exit program by typing E key!');
  Writeln;
  Writeln('');
  Cls(1);
  Opn(1, 4, 0, 'K:');
 WHILE key<>69 do begin
  key:=Get(1);
  Write(Chr(key));
  end;
  Cls(1);
  Write('', eol, '', eol, 'End of program', eol, '');
end;

begin
  MAINProc;
end.
