// Effectus auto-generated Mad Pascal source code listing
program typePrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// TYPE declaration demo
type
  REC = record
  day : byte;
  month : byte;
  year : word;
  height : byte;
  end;  // type
var
  data : REC;
  weightData : byte;
  key : byte;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('TYPE declaration demonstration');
  Writeln;
  Writeln('');
  data.day:=12;
  data.month:=4;
  data.year:=1975;
  data.height:=182;
  weightData:=data.height;
  Write('Personal data');
  Writeln;
  Write('-------------');
  Writeln;
  Write('', eol, 'Birthday: ', data.day, '.', data.month, '.', data.year, '', eol, '');
  Write('Height: ');

  Write(weightData);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
