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

    Program file: functions.inc
    Description : Emulating Action! functions
}

    branchPtr.isFuncInIf:=false;

    // Function is in IF condition block
    if (branchPtr.isIfThen and branchPtr.isIfThenInProgress) or
        branchPtr.isWhile or branchPtr.isUntil then
    begin
        FuncInIfCond(procName, temp, params2);
    end
    // Function is not in IF condition block
    else begin
        // doubled delimiter - to be sure ;)
        temp:=',' + procName + ',';

        // RAND, PEEK, PEEKC, VALB, VALC, VALI, GETD, INPUTBD, INPUTCD, INPUTID
        temp01:='  ' + funcVar + ':=' + _MARKER + '(' + params2 + ');';
        // INPUTB, INPUTC, INPUTI
        temp02:='  ' + _MARKER + '(' + funcVar + ');';
        // STICK, STRIG, PADDLE, PTRIG
        temp03:='  ' + funcVar + ':=' + _MARKER + '[' + params2 + '];';
        // ReplaceKey function works on _REPLACEMENT array
        temp04:=ReplaceKey(_MARKER, procName);

        if Pos(temp, ',RAND,PEEK,PEEKC,VALB,VALC,VALI,GETD,INPUTBD,INPUTCD,INPUTID,') > 0 then
            temp01:=ReplaceStr(temp01, _MARKER, temp04)
        else if Pos(temp, ',INPUTB,INPUTC,INPUTI,') > 0 then
            temp02:=ReplaceStr(temp02, _MARKER, temp04)
        else if Pos(temp, ',STICK,STRIG,PADDLE,PTRIG,') > 0 then
            temp03:=ReplaceStr(temp03, _MARKER, temp04);

        if procName = 'GETD' then
            if params2 = '7' then
                temp01+=LineEnding + '  ReadKey;';

        if Pos(_MARKER, temp01) = 0 then begin
            // Check variable type
            temp02:='';

            if (params2[1] <> '''') and not IsNumber(params2[1]) then
                temp02:=ExtractDelimited(
                    2, vars.ValueFromIndex[vars.IndexOfName(params2)], [';']);

            // Is it memory address?
            //writeln('params2     params2[1] = ', params2, params2[1]);
            if (params2[1] <> '''') and not IsNumber(params2[1]) and (temp02 <> '1') then begin
                code.Add('  eff_string:=' + QuotedStr('     ') + ';');
                //Code.add('  writeln(''sizeof = '', SizeOf(' + params2 + '));');
                //Code.add('  writeln(''sizeof = '', ' + params2 + '[0]);');

                //temp03:=ExtractDelimited(3, vars.ValueFromIndex[vars.IndexOfName(params2)], [';']);
                //code.Add('  for eff_var:=0 to SizeOf(' + params2 + ') - 1 do begin' + LineEnding +
                code.Add('  for eff_var:=1 to ' + params2 + '[0] do' + LineEnding +
                         '    eff_string[eff_var]:=chr(' + params2 + '[eff_var]);');
                temp01:='  ' + funcVar + ':=StrToInt(eff_string);';
            end;

            code.Add(temp01);
        end
        else if Pos(_MARKER, temp02) = 0 then
            code.Add(temp02)
        else if Pos(_MARKER, temp03) = 0 then
            code.Add(temp03);

        if procName = 'LOCATE' then begin
            if devicePtr.isGr0 then begin
                params:=params2.Split(',');
                if High(params) > 0 then
                    temp:='  ' + funcVar + ':=GetPixel(' + params[0] + ' + 1, ' + params[1] + ');';
            end
            else begin
                temp:='  ' + funcVar + ':=GetPixel(' + params2 + ');';
            end;

            code.Add(temp);
        end;

        if procName = 'SCOMPARE' then begin
            temp:='  ' + funcVar + ':=' + ActionSCompare(params2) + ';';
            code.Add(temp);
        end;
    end;
