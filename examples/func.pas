// Effectus auto-generated Mad Pascal source code listing
program funcPrg;

uses
  Crt, StringUtils, SySutils, Joystick;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Using custom/local FUNCtion

function SumFunc(nn1 : word; nn2 : word) : word;
var
  res : word;
begin
  res:=nn1+nn2;
  result:=res;
end;
procedure MAINProc;
var
  n1 : word;
  n2 : word;
  n3 : word;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('Using local functions(FUNC)');
  Writeln;
  Writeln('');
  n1:=30;
  n2:=120;
  Write('Custom function Sum');
  Writeln;
  Writeln('');
  Write('n1=30,n2=120,with sum of n3=');

  n3:=SUMFunc(N1,N2);
  Write(n3);  Writeln;
  n1:=255;
  n3:=SUMFunc(N1,255);
  Write('n1=255 with 255 added is ');

  Write(n3);  Writeln;
  Writeln('');
  Write('Press trigger');
  Writeln;
 WHILE STRIG[0]=1 do begin
  end;
  Write('Trigger pressed');
  Writeln;
  repeat
 UNTIL STRIG[0]=0;
  Write('Trigger not pressed');
  Writeln;
  Write('Program finished!');
  Writeln;
end;

begin
  MAINProc;
end.
