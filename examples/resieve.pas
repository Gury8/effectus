// Effectus auto-generated Mad Pascal source code listing
program resievePrg;

uses
  Crt, StringUtils;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Benchmark test
// Calculating prime numbers
var
  ch : byte absolute 764;
  RTCLOCK : byte absolute 20;
  FLAGS : array[0..8191] of byte;  // FLAGS_byte_array

procedure SIEVEProc;
var
  SQRCOUNT : byte = 91;
  FRAME : byte = 0;
  N : word;
  K : word;
begin
 WHILE FRAME=RTCLOCK do begin
  end;
  FillChar(FLAGS, 8190, 1);
 FOR N:=2 TO SQRCOUNT do begin
  if  FLAGS[N]=1  then begin
  K:=N*2;
 WHILE K<=8191 do begin
  FLAGS[K]:=0;
  Inc(K, N);
  end;
  end;  // if
  end;
end;

procedure MAINProc;
var
  N : word;
  COUNT : word = 0;
begin
  RTCLOCK:=0;
  SIEVEProc;
  Write('Effectus 0.5');
  Writeln;
  Write('Calculating prime numbers');
  Writeln;
  Write('', eol, ' ', RTCLOCK, ' JIFFIES');
 FOR N:=2 TO 8191 do begin
  if  FLAGS[N]=1  then begin
  Inc(COUNT);
  end;  // if
  end;
  Write('', eol, ' ', COUNT, ' PRIMES');
 WHILE ch=255 do begin
  end;
end;

begin
  MAINProc;
end.
