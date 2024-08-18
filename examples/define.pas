// Effectus auto-generated Mad Pascal source code listing
program definePrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
var
  key : byte;

procedure DEFINE_TESTProc;
var
  n : byte;
begin
  Write(Chr(125));
  Poke(710, 0);
  Poke(712, 60);
  Writeln('');
  Writeln('');
  Write('DEFINE statement test');
  Writeln;
  Writeln('');
  Writeln('');
  Write('Cls,Newline');
  Writeln;
  Writeln('');
  Write('Count from 1 to max');
  Writeln;
 FOR n:=1 to 3 do begin
  Write(n);  Writeln;
  end;
  key:=Get(7);
  ReadKey;
end;

begin
  DEFINE_TESTProc;
end.
