{
    Program: Effectus
        Effectus parses Action! language source code listings and generates native binary code
        for 8-bit Atari home computers by using excellent Mad Pascal and Mad Assembler languages.

    Authors:
        Bostjan Gorisek (Gury): Effectus
        Tomasz Biela (Tebe)   : Mad Assembler, Mad Pascal
        zbyti and others      : Effectus support, new features, bug fixes...

    Effectus v0.5.6 is compiled with Free Pascal 3.2.2.

    References:
        https://gury.atari8.info/effectus/
        https://github.com/Gury8/effectus
        https://github.com/mariusz-buk/effectus

        https://github.com/tebe6502/Mad-Pascal
        https://github.com/tebe6502/Mad-Assembler

    This program is free software: you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by the Free Software Foundation, either version 3
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
    without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along with this program.
    If not, see <http://www.gnu.org/licenses/>.

    To compile Effectus source code, use the following statement from command line:
      fpc -MDelphi -vh -O3 src\effectus.pas

    Program file: effectus.pas
    Description : Main project file
}
program Effectus;
{$APPTYPE CONSOLE}

uses
    Classes, SySutils, Process, StrUtils, Crt;

var
    i : byte;
    isTranslation : boolean = false;

{$I decl.inc}
{$I lib.inc}
{$I shell.inc}
{$I core.inc}

begin
    CreateLists;
    ShellProc;
    Init;
    Writeln('Reading Action! source file...', actionFilename);
    ReadSource(actionFilename);
    Writeln('Generating code...');

    GenerateCode;

    for i:=1 to ParamCount do begin
        if ParamStr(i) = '-t' then begin
            isTranslation:=true;
            Writeln('Translation only...');
            break;
        end;
    end;

    if not isTranslation then begin
        Writeln('Compiling to native code...');

        if Compile(FilenameSrc) then
            Writeln('Compilation is successful!');
        //else
        //    Writeln('Compile error!');

        if isInfo then ShellInfo;
    end;

    DestroyLists;
end.
