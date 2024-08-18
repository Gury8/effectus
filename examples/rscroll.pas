// Effectus auto-generated Mad Pascal source code listing
program rscrollPrg;

uses
  Crt, StringUtils;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Scrolling demo

procedure MAINProc;
var
  i : word;
  scrloc : word absolute 88;
  screen : PByte;  // screen_byte_array
  new_dir : array[0..7] of byte = ($D7, $D8, $D9, $FF, 1, 39, 40, 41);  // new_dir_byte_array
var
  ch : byte;
  dir : byte;
begin
  dir:=1;
  screen:=pointer(SCRLOC);
  repeat
 FOR i:=0 TO 959 do begin
  screen[i]:=ch+i;
  end;
  if  Random(10) = 0  then begin
  dir:=new_dir[Random(8)];
  end;  // if
  ch:=ch+dir;
  until false;
end;

begin
  MAINProc;
end.
