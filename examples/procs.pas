// Effectus auto-generated Mad Pascal source code listing
program procsPrg;

uses
  Crt, StringUtils, SySutils, CIO;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
  strBuffer : string;
// Effectus example
// 
// Using local PROCedures
var
  m1 : word;
  m2 : word;
  key : byte;

procedure PRINTTEXTProc;
begin
  Write('', eol, 'Hello from PROC', eol, '', eol, '');
end;

procedure ShowNumProc(n : byte);
begin
  Write('Entered number is ');

  Write(n);  Writeln;
  if  n<>20  then begin
  Write('It is not 20!');
  Writeln;
  end;  // if
end;

// Calculate the sum of two 8-bit
// numbers and print the result to the
// screen
procedure SumBytesProc(n1 : byte; n2 : byte);
var
  total1 : byte;
begin
  total1:=n1+n2;
  Write('Result: ');

  Write(total1);  Writeln;
end;

// Calculate the sum of two 16-bit
// numbers and print the result to the
// screen
procedure SumCardsProc(c1 : word; c2 : word);
var
  total2 : word;
begin
  total2:=c1+c2;
  Write('Result: ');

  Write(total2);  Writeln;
end;

// Currently, mixed data types are not supported
procedure NumbersProc(e1 : word; e2 : word; e3 : byte; e4 : integer; e5 : integer);
begin
  Write('', eol, 'e1=', e1, ',e2=', e2, '');
  Write('', eol, 'e3=', e3, '');
  Write('', eol, 'e4=', e4, ',e5=', e5, '', eol, '');
end;

procedure MAINProc;
begin
  Write(Chr(125));
  Write('Effectus example:');
  Writeln;
  Write('Using local PROCedures');
  Writeln;
  PRINTTEXTProc;
  Write('Variable n holds value ');

  SHOWNUMProc(21);
  Writeln('');
  Write('Input parameters: 10 and 240');
  Writeln;
  SUMBYTESProc(10, 240);
  Writeln('');
  m1:=2100;
  m2:=62000;
  Write('Input parameters: ');

  Write(m1);
  Write(' and ');

  Write(m2);  Writeln;
  Write('held in variables m1 and m2');
  Writeln;
  SUMCARDSProc(m1, m2);
  NUMBERSProc(10000, 65200, 201, 32000, 4651);
  key:=Get(7);
  ReadKey;
end;

begin
  MAINProc;
end.
