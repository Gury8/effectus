// Effectus auto-generated Mad Pascal source code listing
program soundsPrg;

uses
  Crt, StringUtils, Graph;

var
  eff_var : byte;
  eff_cnt : byte;
  eff_string : string;
// Effectus example
// 
// Sound demo
// (using Sound and SndRst procedures)
var
  CH : byte absolute 764;
  COL : byte absolute 710;

procedure WAITFORKEYProc;
begin
 WHILE CH=255 do begin
  end;
  CH:=255;
end;

procedure SPACEKEYProc;
begin
 WHILE CH<>33 do begin
  end;
  CH:=255;
end;

procedure MAINProc;
begin
  Write(Chr(125));
  Poke(82, 0);
  Poke(708 + 2,  0*16 +  0);
  Write('Effectus example:');
  Writeln;
  Write('Sound demonstration');
  Writeln;
  Writeln('');
  Write('Press space for first s. channel!');
  Writeln;
  SPACEKEYProc;
  COL:=50;
  Sound(0, 100, 10, 10);
  Write('Press space for second s. channel!');
  Writeln;
  SPACEKEYProc;
  COL:=100;
  Sound(1, 140, 12, 12);
  Write('Press space for third s. channel!');
  Writeln;
  SPACEKEYProc;
  COL:=150;
  Sound(2, 200, 14, 6);
  Write('Press space for fourth s. channel!');
  Writeln;
  SPACEKEYProc;
  COL:=180;
  Sound(3, 70, 10, 4);
  Writeln('');
  Write('**************+*********************');
  Writeln;
  Write('Press any key to shut off the sound!');
  Writeln;
  Write('***************+********************');
  Writeln;
  WAITFORKEYProc;
  COL:=240;
  Sound(0, 0, 0, 0);
  Sound(1, 0, 0, 0);
  Sound(2, 0, 0, 0);
  Sound(3, 0, 0, 0);
end;

begin
  MAINProc;
end.
