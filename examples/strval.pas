// Effectus auto-generated Mad Pascal source code listing
program strvalPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Number to string conversion using
// StrB, StrI and StrC procedures
// 
// String to number conversion by using
// ValB, ValI and ValC functions
var
  key : byte;
  num1 : byte;
  num2 : integer;
  num3 : word;
  strnum1 : array[0..6] of byte;  // strnum1_byte_array
  strnum2 : array[0..6] of byte;  // strnum2_byte_array
  strnum3 : array[0..6] of byte;  // strnum3_byte_array

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Writeln('');
  Write('Number to string conversion using');
  Writeln;
  Write('StrB,StrI and StrC procedures');
  Writeln;
  Writeln('');
  eff_string:='65000';
  for eff_var:=0 to 6 do
    strnum1[eff_var]:=32;
  strnum1[0]:=5;
  for eff_var:=1 to 5 do 
    strnum1[eff_var]:=Ord(eff_string[eff_var]);
  eff_string:='3200';
  for eff_var:=0 to 6 do
    strnum2[eff_var]:=32;
  strnum2[0]:=4;
  for eff_var:=1 to 4 do 
    strnum2[eff_var]:=Ord(eff_string[eff_var]);
  eff_string:='210';
  for eff_var:=0 to 6 do
    strnum3[eff_var]:=32;
  strnum3[0]:=3;
  for eff_var:=1 to 3 do 
    strnum3[eff_var]:=Ord(eff_string[eff_var]);
  Write('strnum1=');

  eff_string:='';
  for eff_var:=1 to strnum1[0] do
    StrAdd(eff_string, chr(strnum1[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Write('strnum2=');

  eff_string:='';
  for eff_var:=1 to strnum2[0] do
    StrAdd(eff_string, chr(strnum2[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Write('strnum3=');

  eff_string:='';
  for eff_var:=1 to strnum3[0] do
    StrAdd(eff_string, chr(strnum3[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Writeln('');
  num3:=35000;
  eff_string:=IntToStr(num3);
  for eff_var:=0 to 6 do
    strnum1[eff_var]:=32;
  eff_cnt:=Length(eff_string);
  strnum1[0]:=eff_cnt;
  for eff_var:=1 to eff_cnt do 
    strnum1[eff_var]:=Ord(eff_string[eff_var]);
  num2:=3100;
  eff_string:=IntToStr(num2);
  for eff_var:=0 to 6 do
    strnum2[eff_var]:=32;
  eff_cnt:=Length(eff_string);
  strnum2[0]:=eff_cnt;
  for eff_var:=1 to eff_cnt do 
    strnum2[eff_var]:=Ord(eff_string[eff_var]);
  num1:=230;
  eff_string:=IntToStr(num1);
  for eff_var:=0 to 6 do
    strnum3[eff_var]:=32;
  eff_cnt:=Length(eff_string);
  strnum3[0]:=eff_cnt;
  for eff_var:=1 to eff_cnt do 
    strnum3[eff_var]:=Ord(eff_string[eff_var]);
  Write('strnum1=');

  eff_string:='';
  for eff_var:=1 to strnum1[0] do
    StrAdd(eff_string, chr(strnum1[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Write('strnum2=');

  eff_string:='';
  for eff_var:=1 to strnum2[0] do
    StrAdd(eff_string, chr(strnum2[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
  Write('strnum3=');

  eff_string:='';
  for eff_var:=1 to strnum3[0] do
    StrAdd(eff_string, chr(strnum3[eff_var]));

  Write(TrimRight(eff_string));
  Writeln;
// printBE(strnum1(0))
// printBE(strnum2(0))
// printBE(strnum3(0))
  Write('Size of card value is', strnum1[0], '', eol, '');
  Write('Size of integer value is', strnum2[0], '', eol, '');
  Write('Size of byte value is', strnum3[0], '', eol, '');
  Writeln('');
  Write('String to number conversion by using');
  Writeln;
  Write('ValB,ValI and ValC');
  Writeln;
  Writeln('');
  eff_string:='     ';
  for eff_var:=1 to strnum3[0] do
    eff_string[eff_var]:=chr(strnum3[eff_var]);
  num1:=StrToInt(eff_string);
  Write('num1=');

  Write(num1);  Writeln;
  num2:=StrToInt('1500');
  Write('num2=');

  Write(num2);  Writeln;
  num3:=StrToInt('44611');
  Write('num3=');

  Write(num3);  Writeln;
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
