// Effectus auto-generated Mad Pascal source code listing
program inputPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// String input demo
// (using InputS procedure)
var
  key : byte;
  name : array[0..13] of byte;  // name_byte_array
  surname : array[0..21] of byte;  // surname_byte_array

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('String input demonstration');
  Writeln;
  Write('using InputS procedure');
  Writeln;
  Writeln('');
  Write('Whats your name?');
  Writeln;
  eff_string:='';
  Readln(eff_string);
  for eff_var:=0 to 13 do
    name[eff_var]:=32;
  name[0]:=Length(eff_string);
  eff_cnt:=1;
  for eff_var:=1 to name[0] do begin
    name[eff_var]:=Ord(eff_string[eff_cnt]);
    Inc(eff_cnt);
end;
  Writeln('');
  Write('Whats your surname?');
  Writeln;
  eff_string:='';
  Readln(eff_string);
  for eff_var:=0 to 21 do
    surname[eff_var]:=32;
  surname[0]:=Length(eff_string);
  eff_cnt:=1;
  for eff_var:=1 to surname[0] do begin
    surname[eff_var]:=Ord(eff_string[eff_cnt]);
    Inc(eff_cnt);
end;
  Writeln('');
  Write('Thank you,');

  eff_string:='';
  for eff_var:=1 to name[0] do
    StrAdd(eff_string, chr(name[eff_var]));

  Write(TrimRight(eff_string));

  Write(Chr(32));
  eff_string:='';
  for eff_var:=1 to surname[0] do
    StrAdd(eff_string, chr(surname[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Writeln('');
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
