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

    Program file: procedures.inc
    Description : Emulating Action! procedures
}

        if procs.IndexOfName(procName) >= 0 then
            procType:=ExtractDelimited(2, procs.ValueFromIndex[procs.IndexOfName(procName)], [';'])
        else
            procType:='0';

        //writeln('proctype = ', proctype);
        //writeln('procName = ', procName, ' index = ', procs.ValueFromIndex[procs.IndexOfName(procName)]);

        if procType = _PROC_PRINT then begin
            //writeln('procname = ', procname);
            if (params[0] = '""') or (UpperCase(params[0]) = 'PRINTE()') then
                //params2:=QuotedStr('')
                temp:='  Writeln;'
            else begin
                //code.Add('  eff_string:=' + QuotedStr(params2) + ';');
                //code.Add('  eff_string:=strTrimRight(eff_string);');
                //code.Add('  eff_string:=' + QuotedStr('') + ';');

                if params[0][1] = '"' then
                    temp:='  Write(' + params2 + ');'  + LineEnding
                else if (procName = 'PRINT') or (procName = 'PRINTE') then begin
                    //temp:='  for eff_var in ' + params2 + ' do Write(chr(eff_var));' + LineEnding
                    //temp:='  for eff_var in ' + params2 + ' do StrAdd(eff_string, chr(eff_var));' + LineEnding;
                    //temp:='  for eff_var:=1 to Length(' + params2 + ') do StrAdd(eff_string, chr(' + params2 + '[eff_var]));' + LineEnding;
                    //temp:='  for eff_var:=1 to 20 do' + LineEnding +
                    code.Add('  eff_string:=' + QuotedStr('') + ';');
                    temp:='  for eff_var:=1 to ' + params2 + '[0] do' + LineEnding +
                          '    StrAdd(eff_string, chr(' + params2 + '[eff_var]));' + LineEnding + LineEnding +
                          '  Write(TrimRight(eff_string));' + LineEnding;
                end
                else begin
                    //temp:='  Write(TrimRight(' + params2 + '));' + LineEnding;
                    temp:='  Write(' + params2 + ');';
                end;

                // Print procedure with additional empty line
                procSubType:=ExtractDelimited(3, procs.ValueFromIndex[procs.IndexOfName(procName)], [';']);
                if procSubType = _PROC_PRINT_02 then
                    temp+='  Writeln;';
            end;

            code.Add(temp);
        end
        else if procName = 'PUTE' then begin
            temp:='  Writeln(' + QuotedStr(params2) + ');';
            code.Add(temp);
        end
        else if procName = 'GRAPHICS' then begin
            temp:='';
            devicePtr.isGr0:=params2 = '0';
            temp+='  InitGraph(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'PLOT' then begin
            temp:='  PutPixel(' + params2 + ');' + LineEnding;
            temp+='  MoveTo(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'DRAWTO' then begin
            temp:='  LineTo(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'FILL' then begin
            temp:='  FloodFill(' + params2 + ', ' + prgPtr.colorValue + ');';
            code.Add(temp);
        end
        else if procName = 'POSITION' then begin
            params:=params2.Split(',');
            if High(params) > 0 then
                temp:='  GotoXY(' + params[0] + ' + 1, ' + params[1] + ' + 1);';

            code.Add(temp);
        end
        else if procName = 'POKE' then begin
            temp:='  Poke(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'POKEC' then begin
            temp:='  DPoke(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'ZERO' then begin
            params:=params2.Split(',');
            if High(params) > 0 then begin
                params2:='';
                for j:=0 to High(params) do begin
                    if j = 0 then begin
                        if vars.IndexOfName(params[j]) >= 0 then begin
                            if VarValue(2, vars.IndexOfName(params[j]), _VAR_BYTE_ARRAY)
                                or VarValue(2, vars.IndexOfName(params[j]), _VAR_CARD_ARRAY) then
                            begin
                                params[j]:='@' + params[j];
                            end;
                        end;
                        params2+='pointer(' + params[j] + '),';
                    end
                    else
                        params2+=params[j];
                end;
            end;
            temp:='  FillChar(' + params2 + ', 0);';
            code.Add(temp);
        end
        else if procName = 'SETBLOCK' then begin
            params:=params2.Split(',');
            params[0]:=Trim(params[0]);

            if vars.IndexOfName(params[0]) >= 0 then begin
                if VarValue(2, vars.IndexOfName(params[0]), _VAR_BYTE_ARRAY) or
                    VarValue(2, vars.IndexOfName(params[0]), _VAR_CARD_ARRAY) then
                begin
                    //params[j]:='@' + params[j];
                    //params[0]:='pointer(' + params[0] + ')';
                end
                else
                    params[0]:='pointer(' + params[0] + ')';
            end
            else begin
                params[0]:='pointer(' + params[0] + ')';
            end;

            params[1]:=Trim(params[1]);
            params[2]:=Trim(params[2]);
            params2:=params[0] + ', ' + params[1] + ', ' + params[2];
            temp:='  FillChar(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'MOVEBLOCK' then begin
            params:=params2.Split(',');
            params[0]:=Trim(params[0]);
            params[1]:=Trim(params[1]);
            if IsNumber(params[1][1]) then
                params[1]:='pointer(' + Trim(params[1]) + ')';

            params2:=Trim(params[1]) + ', pointer(' + Trim(params[0]) + '), ' + params[2];
            temp:='  Move(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'SOUND' then begin
            temp:='  Sound(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'SNDRST' then begin
            temp:='  Sound(0, 0, 0, 0);' + LineEnding +
                    '  Sound(1, 0, 0, 0);' + LineEnding +
                    '  Sound(2, 0, 0, 0);' + LineEnding +
                    '  Sound(3, 0, 0, 0);';
            code.Add(temp);
        end
        else if procName = 'PUT' then begin
            temp:='  Write(Chr(' + params2 + '));';
            code.Add(temp);
        end
        else if (procName = 'STRB') or (procName = 'STRC') or (procName = 'STRI') then begin
            // StrC(65000,strnum1)
            if IsNumber(params[0][1]) then begin
                code.Add('  eff_string:=' + QuotedStr(params[0]) + ';');

                //temp02:=ExtractDelimited(4, vars.ValueFromIndex[vars.IndexOfName(params[1])], [';']);
                //temp:='  for eff_var:=0 to ' + temp02 + ' do' +
                //      '    ' + params[1] + '[eff_var]:=32;';

                code.Add(VarClear(params[1]));
                //writeln('varclear: ', params[1], ', ', VarClear(params[1]));

                // String length in array's 0th position
                temp01:=IntToStr(Length(params[0]));
                code.Add('  ' + params[1] + '[0]:=' + temp01 + ';');

                // Fill byte array with string data
                //temp:='  for eff_var:=0 to ' + IntToStr(Length(params[0]) - 1) + ' do ' +
                //        params[1] + '[eff_var]:=Ord(eff_string[eff_var + 1]);';
                temp:='  for eff_var:=1 to ' + temp01 + ' do ' + LineEnding +
                        '    ' + params[1] + '[eff_var]:=Ord(eff_string[eff_var]);';
            end
            // num3 = 35000
            // StrC(num3,strnum1)
            else begin
                code.Add('  eff_string:=IntToStr(' + params[0] + ');');

                //temp02:=ExtractDelimited(4, vars.ValueFromIndex[vars.IndexOfName(params[1])], [';']);
                //temp:='  for eff_var:=0 to ' + temp02 + ' do' +
                //      '    ' + params[1] + '[eff_var]:=32;';
                //code.Add(temp);
                code.Add(VarClear(params[1]));

                // String length in array's 0th position
                //temp01:=IntToStr(Length(params[1]));
                //temp01:=IntToStr(Length(params[0]));
                
                Code.Add('  eff_cnt:=Length(eff_string);');
                code.Add('  ' + params[1] + '[0]:=eff_cnt;');

                //temp:='  for eff_var:=1 to Length(eff_string) do ' + LineEnding +
                //        '    ' + params[1] + '[eff_var]:=Ord(eff_string[eff_var]);';
                temp:='  for eff_var:=1 to eff_cnt do ' + LineEnding +
                        '    ' + params[1] + '[eff_var]:=Ord(eff_string[eff_var]);';
            end;

            code.Add(temp);
        end
        else if procName = 'SCOPY' then begin
            params:=params2.Split(',');
            params[0]:=Trim(params[0]);
            params[1]:=Trim(params[1]);

            // Clear variable with space character
            //temp02:=ExtractDelimited(4, vars.ValueFromIndex[vars.IndexOfName(params[0])], [';']);
            //temp:='  for eff_var:=0 to ' + temp02 + ' do' +
            //      '    ' + params[0] + '[eff_var]:=32;';
            //code.Add(temp);
            code.Add(VarClear(params[0]));

            // F.e.: SCopy(str, 'test')
            if params[1][1] = '''' then begin
                temp:=ExtractText(params[1], '''', '''');
//              for i:=1 to Length(temp) do begin
//                  //temp02+=params2 + '[' + IntToStr(i) + ']=' + 'ord(' + temp[i] + ');';
//                  code.Add(params[0] + '[' + IntToStr(i - 1) + ']:=' + 'ord(' + QuotedStr(temp[i]) + ');');
//              end;

                code.Add('  eff_string:=' + QuotedStr(temp) + ';');

                // Orig:
                //temp:='  for eff_var:=0 to ' + IntToStr(Length(temp) - 1) + ' do ' +
                //        params[0] + '[eff_var]:=Ord(eff_string[eff_var + 1]);';

                // String length
                temp01:=IntToStr(Length(temp));

                // String length in array's 0th position
                temp:=params[0] + '[0]:=' + temp01 + ';' + LineEnding;
                //writeln('temp 1 = ', temp);

                // Fill byte array with string data
                temp+='  for eff_var:=1 to ' + temp01 + ' do ' + LineEnding +
                      '    ' + params[0] + '[eff_var]:=Ord(eff_string[eff_var]);';
                // New:
                //temp:='  for eff_var:=1 to ' + params2 + '[0] do' + LineEnding +
                //    '    ' + StrAdd(eff_string, chr(' + params2 + '[eff_var]));' + LineEnding;
                //temp+='  Write(TrimRight(eff_string));' + LineEnding;
            end
            // F.e.: SCopy(str01, str02)
            else begin
                // Length of string from second parameter
                temp02:=ExtractDelimited(4, vars.ValueFromIndex[vars.IndexOfName(params[1])], [';']);
                //writeln('temp 2 = ', temp02);

                //code.Add('for eff_var in ' + params[1] + ' do ' +
                //  params[0] + '[eff_var]:=' + 'ord(' + params[1] + '[eff_var]);');
                //code.Add(params[0] + ':=' + params[1]);
                
                temp:='  for eff_var:=0 to ' + temp02 + ' do' + LineEnding +
                        '    ' + params[0] + '[eff_var]:=' + params[1] + '[eff_var];';
                        //'ord(' + params[1] + '[eff_var]);';
            end;

            //for eff_var in str1 do Write(chr(eff_var));
            //temp:='  ' + params[0] + ':=' + params[1] + ';';
            code.Add(temp);
        end
        else if procName = 'SCOPYS' then begin
            //temp:='  ' + params[0] + ':=' +
            //      'Copy(' + params[1] + ',' + params[2] + ', ' +
            //      params[3] + ' - ' + params[2] + ' + 1);';

            params:=params2.Split(',');
            params[0]:=Trim(params[0]);
            params[1]:=Trim(params[1]);
            params[2]:=Trim(params[2]);
            params[3]:=Trim(params[3]);
            //writeln(params[2], ' * ', params[3]);

            // Clear variable with space character
            //temp02:=ExtractDelimited(4, vars.ValueFromIndex[vars.IndexOfName(params[0])], [';']);
            //temp:='  for eff_var:=0 to ' + temp02 + ' do' +
            //      '    ' + params[0] + '[eff_var]:=32;';
            //code.Add(temp);
            code.Add(VarClear(params[0]));

            // Calculate string length
            temp01:=params[3] + '-' + params[2] + ' + 1';
            //STR02[0]:=5-1 - 1;
            temp:=params[0] + '[0]:=' + temp01 + ';' + LineEnding;
            Code.Add('  ' + temp);
            //writeln('temp01 = ', temp01, ', temp = ', temp);

            // Literal string variable
            // F.e.: SCopyS(str, 'test string', 6, 10)
            if params[1][1] = '''' then begin
                temp:=ExtractText(params[1], '''', '''');
                code.Add('  eff_string:=' + QuotedStr(temp) + ';');
                //temp:='  for eff_var:=0 to ' + params[3] + '-' + params[2] + ' do ' + LineEnding +
                //        '    ' + params[0] + '[eff_var]:=Ord(eff_string[eff_var+' + params[2] + ']);';
                temp:='  for eff_var:=1 to ' + temp01 + ' do ' + LineEnding +
                        '    ' + params[0] + '[eff_var]:=Ord(eff_string[eff_var + ' + params[2] + ' - 1]);';
            end
            // BYTE ARRAY string variables
            // F.e.: SCopyS(str01, str02, 1, 5)
            else begin
                //temp02:=ExtractDelimited(4, vars.ValueFromIndex[vars.IndexOfName(params[1])], [';']);
                //temp:='  for eff_var:=0 to ' + params[3] + '-' + params[2] + ' do ' + LineEnding +
                //        '    ' + params[0] + '[eff_var]:=' + params[1] + '[eff_var+' + params[2] + '-1];';

                temp:='  for eff_var:=1 to ' + temp01 + ' do ' + LineEnding +
                        '    ' + params[0] + '[eff_var]:=' + params[1] + '[eff_var + ' + params[2] + ' - 1];';
            end;
            code.Add(temp);
        end
        // PROC SAssign(<dest>,<source>, BYTE start,stop
        // SASSIGN(STR01,"ATARI",7,11)
        else if procName = 'SASSIGN' then begin
//          temp:='  ' + params[0] +
//              ':=Concat(Concat(Copy(' + params[0] + ', 1, ' + params[2] + ' - 1), ' +
//              params[1] + '), Copy(' + params[0] + ', ' + params[3] +
//              ' + 1, Length(' + params[0] + ')));';

            params:=params2.Split(',');
            params[0]:=Trim(params[0]);  // Destination
            params[1]:=Trim(params[1]);  // Source
            params[2]:=Trim(params[2]);  // Start pos in dest
            params[3]:=Trim(params[3]);  // End pos in dest

            // Calculate string length
            temp01:=params[3] + '-' + params[2] + ' + 1';
            //STR02[0]:=5-1 - 1;
            //temp:=params[0] + '[0]:=' + temp01 + ';' + LineEnding;
            //Code.Add('  ' + temp);

            // Literal string variable
            // F.e.: SCopyS(str, 'test string', 6, 10)
            if params[1][1] = '''' then begin
                temp:=ExtractText(params[1], '''', '''');
                //writeln('temp = ', temp, '*');
                code.Add('  eff_string:=' + QuotedStr(temp) + ';');
                code.Add('  eff_cnt:=1;');
                //STR01=HELLO ATARI   ERE: A
                temp:='  for eff_var:=' + params[2] + ' - 1 to ' + params[3] + ' - 1 do begin' + LineEnding +
                        '    ' + params[0] + '[eff_var + 1]:=Ord(eff_string[eff_cnt]);' + LineEnding +
                        '    Inc(eff_cnt);' + LineEnding +
                        '  end;';
                //temp:='  for eff_var:=' + temp01 + ' do begin' + LineEnding +
                //        '    ' + params[0] + '[eff_var + 1]:=Ord(eff_string[eff_cnt]);' + LineEnding +
                //        '    Inc(eff_cnt);' + LineEnding +
                //        '  end;';
            end
            // BYTE ARRAY string variable
            // F.e.: SCopyS(str01, str02, 1, 5)
            else begin
                code.Add('  eff_cnt:=1;');
                temp:='  for eff_var:=' + params[2] + ' - 1 to ' + params[3]  + ' - 1 do begin' + LineEnding +
                        '    ' + params[0] + '[eff_var + 1]:=' + params[1] + '[eff_cnt];' + LineEnding +
                        '    Inc(eff_cnt);' + LineEnding +
                        'end;';
            end;

            code.Add(temp);
        end
        else if procName = 'SETCOLOR' then begin
            params:=params2.Split(',');
            temp:='  Poke(708 + ' + params[0] + ', ' + params[1] + '*16 + ' + params[2] + ');';
            code.Add(temp);
        end
        else if procName = 'INPUTS' then begin
            Code.Add('  eff_string:=' + QuotedStr('') + ';');
            code.Add('  Readln(eff_string);');

            //temp02:=ExtractDelimited(4, vars.ValueFromIndex[vars.IndexOfName(params2)], [';']);
            //temp:='  for eff_var:=0 to ' + temp02 + ' do' +
            //      '    ' + params2 + '[eff_var]:=32;';
            //code.Add(temp);
            code.Add(VarClear(params2));

            //temp01:=IntToStr(Length(params[0]));
            //code.Add('  ' + params[1] + '[0]:=' + temp01 + ';');

            temp:=params2 + '[0]:=Length(eff_string);';
            Code.Add('  ' + temp);

            code.Add('  eff_cnt:=1;');
            temp:='  for eff_var:=1 to ' + params2 + '[0] do begin' + LineEnding +
                    '    ' + params2 + '[eff_var]:=Ord(eff_string[eff_cnt]);' + LineEnding +
                    '    Inc(eff_cnt);' + LineEnding +
                    'end;';
            //temp:='  Readln(' + params2 + ');';
            code.Add(temp);
        end
        (*
        format char description for Action!:
        %I  INT
        %U  CARD (the U stands for Unsigned) and BYTE
        %C  print as a character
        %H  Hexadecimal number
        %E  the RETURN character
        %%  output the percent sign
        %S  output as a string

        Some examples:
         PrintF("%EA%EB%E")
         PrintF("%EThe sum of %U and %U is %U%E",a,b,a+b
         PrintF("The letter %C.%E",65)
         PrintF("Score %U: %U",player,score(player))
        *)
        else if procName = 'PRINTF' then begin
            // Format string definition
            params:=params2.Split(',', '"', '"');
            temp:=params[0];
            if Pos('%%', temp) > 0 then
                temp:=ReplaceStr(temp, '%%', '%{percentEff}');

            temp:=ExtractText(temp, '"', '"');
            temp02:=QuotedStr(Extract(1, temp, '%'));

            // "line: %i%E",i
            // "line: %s%E",str
            paramsEx:=temp.Split('%');
            for i:=1 to High(paramsEx) do begin
                if (UpperCase(paramsEx[i][1]) = 'I') or
                    (UpperCase(paramsEx[i][1]) = 'U') or
                    (UpperCase(paramsEx[i][1]) = 'S') then
                begin
                    Inc(cnt);
                    params[cnt]:=ReplaceStr(params[cnt], '(', '[');
                    params[cnt]:=ReplaceStr(params[cnt], ')', ']');
                    temp02+=', ' + params[cnt] + ', ' +
                        QuotedStr(Copy(paramsEx[i], 2, Length(paramsEx[i]) - 1));
                end
                else if UpperCase(paramsEx[i][1]) = 'H' then begin
                    Inc(cnt);
                    params[cnt]:=ReplaceStr(params[cnt], '(', '[');
                    params[cnt]:=ReplaceStr(params[cnt], ')', ']');
                    temp02+=', ' + QuotedStr('$') + ', HexStr(' + params[cnt] + ', 4), ' +
                        QuotedStr(Copy(paramsEx[i], 2, Length(paramsEx[i]) - 1));
                end
                else if UpperCase(paramsEx[i][1]) = 'C' then begin
                    Inc(cnt);
                    temp02+=', Chr(' + params[cnt] + '), ' +
                        QuotedStr(Copy(paramsEx[i], 2, Length(paramsEx[i]) - 1));
                end
                else if Pos('{percentEff}', paramsEx[i]) > 0 then begin
                    SplitStr(paramsEx[i], '{percentEff}', aList);
                    if aList.Count = 1 then
                        temp02+=', ' + QuotedStr('%')
                    else if aList.Count > 1 then
                        temp02+=', ' + QuotedStr('%' + aList[1]);

                    //temp02:=QuotedStr(Extract(1, temp, '%', []));
                    //temp02+=', ' + QuotedStr('%') + QuotedStr(Copy(paramsEx[i], 1, 11));
                end
                else if UpperCase(paramsEx[i][1]) = 'E' then begin
                    temp03:=Extract(2, paramsEx[i], 'E');
                    //temp02+='eol, ' + QuotedStr(Extract(2, paramsEx[i], 'E', []));
                    //     if temp03 = '"' then
                    //       temp02+=', eol'
                    //     else begin
                    temp02+=', eol, ' + QuotedStr(Copy(paramsEx[i], 2, Length(paramsEx[i]) - 1));
                end;
            end;

            code.Add('  Write(' + temp02 + ');');
        end
        else if procName = 'OPEN' then begin
            params:=params2.Split(',');
            if High(params) > 0 then begin
                // procedure Opn(chn, ax1, ax2: byte; device: PByte); assembler;
                temp:='  Opn(' + params[0] + ', ' + Trim(params[2]) + ', 0, ' + Trim(params[1]) + ');';
                code.Add(temp);
            end;
        end
        else if (procName = 'CLOSE') then begin
            //procedure Cls(chn: byte); assembler;
            temp:='  Cls(' + params2 + ');';
            code.Add(temp);
        end
        else if procName = 'PUTD' then begin
            params:=params2.Split(',');
            if High(params) > 0 then begin
                // Put(6, ord('A'*));
                temp:='  Put(' + params[0] + ', ' + params[1] + ');';
                code.Add(temp);
            end;
        end
        else if procName = 'PUTDE' then begin
            //temp:='  strBuffer:=Concat(#$9b, ' + QuotedStr('') + ');' + LineEnding;
            //temp+='  Blockwrite(f, strBuffer[1], Length(strBuffer));';
            temp:='  Put(' + params2 + ', $9b);';
            code.Add(temp);
        end
        else if procType = _PROC_PRINTD then begin
        //else if (procName = 'PRINTBD') or (procName = 'PRINTCD') or (procName = 'PRINTID') then begin
            if procName = 'PRINTD' then begin
                temp03:=StringReplace(params2, ',', '{', []);
                params:=temp03.Split('{');
                if High(params) > 0 then begin
                    temp:='  strBuffer:=' + params[1] + ';' + LineEnding;
                    //temp:='  GotoXY(' + prgPtr.posX + ', ' + prgPtr.posY + ');' + LineEnding;
                    temp+='  BPut(' + params[0] + ', @strBuffer[1], Length(strBuffer));';
                    code.Add(temp);
                end;
            end
            else if procName = 'PRINTDE' then begin
                temp03:=StringReplace(params2, ',', '{', []);
                params:=temp03.Split('{');
                if High(params) > 0 then begin
                    //temp03:=StringReplace(params2, ',', '{', []);
                    //temp03:=Extract(2, temp03, '{');
                    //temp:='  strBuffer:=Concat(' + temp03 + ', #$9b);' + LineEnding;
                    //temp:='  strBuffer:=Concat(' + Trim(params[1]) + ', #$9b);' + LineEnding;
                    params[1]:=Trim(params[1]);
                    if params[1][1] = '''' then
                        temp:='  strBuffer:=Concat(' + Trim(params[1]) + ', #$9b);' + LineEnding
                    else
                        temp:='  strBuffer:=Concat(eff_string, #$9b);' + LineEnding;

                    //temp+='  Blockwrite(f, strBuffer[1], Length(strBuffer));';
                    temp+='  BPut(' + params[0] + ', @strBuffer[1], Length(strBuffer));';
                    code.Add(temp);
                end;
            end
            else begin
                params:=params2.Split(',');
                if High(params) > 0 then begin
                    params[1]:=Trim(params[1]);
                    procSubType:=ExtractDelimited(3, procs.ValueFromIndex[procs.IndexOfName(procName)], [';']);
                    if procSubType = _PROC_PRINTD_01 then
                        temp:='  strBuffer:=IntToStr(' + params[1] + ');' + LineEnding
                    else
                        temp:='  strBuffer:=Concat(IntToStr(' + params[1] + '), #$9b);' + LineEnding;

                    temp+='  BPut(' + params[0] + ', @strBuffer[1], Length(strBuffer));';
                    code.Add(temp);
                end;
            end;
        end
        else if (procName = 'INPUTSD') or (procName = 'INPUTMD') then begin
            //procedure BGet(chn: byte; buf: PByte; cnt: word); assembler; register;
            params:=params2.Split(',');
            if High(params) > 0 then begin
                //temp:='  BlockRead(f, ' + params[1] + ', 255);';
                //temp:='  strBuffer:=' + params[1] + ';' + LineEnding;
                //temp:='  BGet(' + params[0] + ', @strBuffer[1], Length(strBuffer));';
                //writeln('*', params[0], '*, *', params[1] + '*');

                temp:=params[1] + '[0]:=255;';
                Code.Add('  ' + temp);

                if procName = 'INPUTSD' then
                    temp:='  BGet(' + params[0] + ', ' + params[1] + ', SizeOf(' + params[1] + '));'
                else
                    temp:='  BGet(' + params[0] + ', ' + params[1] + ', ' + params[2] + ');';

                code.Add(temp);
                
                Code.Add('for eff_var:=0 to 253 do');
                Code.Add('    eff_array_buffer[eff_var + 1]:=' + params[1] + '[eff_var];');

                Code.Add('for eff_var:=1 to 254 do');
                Code.Add('    ' + params[1] + '[eff_var]:=eff_array_buffer[eff_var];');
            end;
        end
        else if procName = 'XIO' then begin
            //procedure XIO(cmd, chn, ax1, ax2: byte; device: PByte); assembler;
            (*
                cmd - command
                chn - channel 0..7
                ax1 - parameter
                ax2 - parameter
                device - name of device, example "S2:"
                PROC XIO(BYTE chan,0,cmd,auxl,aux2,<filestring))
            *)
            params:=params2.Split(',');
            if High(params) > 0 then begin
                temp:='  XIO(' + params[2] + ', ' + params[0] + ', ' + params[3] + ', ' +
                      params[4] + ', ' + params[5] + ');' + LineEnding;
                code.Add(temp);
            end;
        end
        else begin
            if params2 = '' then
                code.Add('  ' + procName + 'Proc;')
            else
                code.Add('  ' + procName + 'Proc(' + params2 + ');');
        end;
