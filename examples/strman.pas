// Effectus auto-generated Mad Pascal source code listing
program strmanPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// String manipulation with PROCedures
// SCopy, ScopyS and SAssign

procedure MAINProc;
var
  key : byte;
  STR01 : array[0..21] of byte;  // STR01_byte_array
  STR02 : array[0..15] of byte;  // STR02_byte_array
  STR03 : array[0..15] of byte;  // STR03_byte_array
begin
  Write(Chr(125));
  Writeln('');
  for eff_var:=0 to 21 do
    STR01[eff_var]:=32;
  eff_string:='HELLO THERE: ATARIAN';
STR01[0]:=20;
  for eff_var:=1 to 20 do 
    STR01[eff_var]:=Ord(eff_string[eff_var]);
  for eff_var:=0 to 15 do
    STR02[eff_var]:=32;
  for eff_var:=0 to 21 do
    STR02[eff_var]:=STR01[eff_var];
  Write('STR01=');

  eff_string:='';
  for eff_var:=1 to STR01[0] do
    StrAdd(eff_string, chr(STR01[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Write('STR02=');

  eff_string:='';
  for eff_var:=1 to STR02[0] do
    StrAdd(eff_string, chr(STR02[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  for eff_var:=0 to 15 do
    STR02[eff_var]:=32;
  STR02[0]:=5-1 + 1;

  for eff_var:=1 to 5-1 + 1 do 
    STR02[eff_var]:=STR01[eff_var + 1 - 1];
  Write('STR02=');

  eff_string:='';
  for eff_var:=1 to STR02[0] do
    StrAdd(eff_string, chr(STR02[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  for eff_var:=0 to 15 do
    STR03[eff_var]:=32;
  STR03[0]:=11-7 + 1;

  for eff_var:=1 to 11-7 + 1 do 
    STR03[eff_var]:=STR01[eff_var + 7 - 1];
  Write('STR03=');

  eff_string:='';
  for eff_var:=1 to STR03[0] do
    StrAdd(eff_string, chr(STR03[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  for eff_var:=0 to 15 do
    STR03[eff_var]:=32;
  STR03[0]:=18-14 + 1;

  eff_string:='HELLO THERE: ATARIAN';
  for eff_var:=1 to 18-14 + 1 do 
    STR03[eff_var]:=Ord(eff_string[eff_var + 14 - 1]);
  Write('STR03=');

  eff_string:='';
  for eff_var:=1 to STR03[0] do
    StrAdd(eff_string, chr(STR03[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  eff_string:='ATARI   ';
  eff_cnt:=1;
  for eff_var:=7 - 1 to 20 - 1 do begin
    STR01[eff_var + 1]:=Ord(eff_string[eff_cnt]);
    Inc(eff_cnt);
  end;
  Write('STR01=');

  eff_string:='';
  for eff_var:=1 to STR01[0] do
    StrAdd(eff_string, chr(STR01[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  for eff_var:=0 to 15 do
    STR02[eff_var]:=32;
  eff_string:='TO OTHER MECH';
STR02[0]:=13;
  for eff_var:=1 to 13 do 
    STR02[eff_var]:=Ord(eff_string[eff_var]);
  eff_cnt:=1;
  for eff_var:=7 - 1 to 20 - 1 do begin
    STR01[eff_var + 1]:=STR02[eff_cnt];
    Inc(eff_cnt);
end;
  Write('STR01=');

  eff_string:='';
  for eff_var:=1 to STR01[0] do
    StrAdd(eff_string, chr(STR01[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  key:=Get(7);
  ReadKey;
end;

// HELLO THERE: ATARIAN ORIG
// 20
// STR01=HELLO THERE: ATARIAN
// STR02=HELLO THERE: ATARIAN
// STR02=HELLO
// STR03=THERE
// STR03=ATARI
// STR01=HELLO ATARI
// STR01=HELLO TO OTHER MECH
begin
  MAINProc;
end.
