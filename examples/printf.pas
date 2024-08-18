// Effectus auto-generated Mad Pascal source code listing
program printfPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// PrintF demo
var
  x : byte;
  y : integer;
  z : word;
  key : byte;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example');
  Writeln;
  Write('PrintF demo');
  Writeln;
  Writeln('');
  x:=120;
  y:=-3200;
  z:=65001;
  Write('The numbers are:', eol, 'x=', x, ',y=', y, ',z=', z, '.', eol, '');
  Write('', eol, 'Procent sign: ');
  Write('', '%');
  Write('', eol, '', '%after');
  Write('', eol, 'before', '%');
  Write('', eol, 'Procent sign ''', '%'' in one line format!');
  Write('', eol, '', eol, 'HEX x(BYTE) ', X, '=', '$', HexStr(X, 4), '');
  Write('', eol, 'HEX y(INT) ', Y, '=', '$', HexStr(Y, 4), '');
  Write('', eol, 'HEX z(CARD) ', Z, '=', '$', HexStr(Z, 4), '');
  Write('', eol, '', eol, 'First character: ', Chr(65), '');
  Write('', eol, 'Number one: ', Chr(49), '');
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
