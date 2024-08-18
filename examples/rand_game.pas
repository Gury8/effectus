// Effectus auto-generated Mad Pascal source code listing
program rand_gamePrg;

uses
  Crt, StringUtils;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Random Number game
var
  n : byte = 4;
  i : byte;
  CH : byte absolute 764;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('Random Number game');
  Writeln;
  Writeln('');
  Writeln('');
  Write('Select a number between 0 and 3');
  Writeln;
  Write('by pressing corresponding key!');
  Writeln;
  Writeln('');
  CH:=255;
 WHILE CH=255 do begin
  end;
  i:=Random(3);
  if  CH=50  then begin
  n:=0;
  end
  else if  CH=31  then begin
  n:=1;
  end
  else if  CH=30  then begin
  n:=2;
  end
  else if  CH=26  then begin
  n:=3;
  end;  // if
  CH:=255;
  Writeln('');
  Write('You pressed ');

  if  n>3  then begin
  Write('the wrong');

  end
  else begin
  Write(n);
  end;  // if
  Write(' key!');

  if  i=n  then begin
  Write(' You won!!!');
  Writeln;
  end
  else begin
  Write(' You lost,the number is ');

  Write(i);
  Write('!');
  Writeln;
  end;  // if
  Write('', eol, '', eol, 'End of game', eol, '');
end;

begin
  MAINProc;
end.
