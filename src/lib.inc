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

    Program file: lib.inc
    Description : Supporting routines
}

(*
 * Function   : ExtractText
 * Description: Extracts string between characters Ch1 and Ch2
 * Parameters : Str (String) - Input string
 *              Ch1 (Char) - First character as a wrapper of input string
 *              Ch2 (Char) - Last character as a wrapper of input string
 * Returns: String value
 * Examples:
 *   Str:=Between('ProcX(int a, byte b);', '(', ')');
 *   Str:=Between('PrintE("test")', '"', '"');
*)
function ExtractText(Str : String; Ch1, Ch2 : Char) : String;
begin
    result:=Copy(Str, Pos(Ch1, Str) + 1, RPos(Ch2, Str) - Pos(Ch1, Str) - 1);
    if Trim(result) = '' then result:=str;
end;

(*
 * Function   : Extract
 * Description: Extract text by specified offset and delimiter
 * Parameters : offset (byte)
 *              str (string)
 *              delim (char)
 * Returns    : String value
*)
function Extract(offset : byte; str : string; delim : char) : string;
var
    res : string;
begin
    res:=ExtractDelimited(offset, str, [delim]);
    if (res = '') and (offset > 1) then begin
        res:=ExtractDelimited(1, str, [delim]);
    end;

    //if sNoTrim in Flags then
    //  Result:=res
    //else

    Result:=Trim(res);
end;

(*
 * Function   : Strip
 * Description: Deletes all occurences of a character in a string
 * Parameters : Str (String) - Input string
 *              Ch (Char) - Character to be deleted from the string
 * Returns: String value
*)
function Strip(Str : String; Ch : Char) : String;
begin
    Result:=StringReplace(Str, Ch, '', [rfReplaceAll, rfIgnoreCase]);
end;

(*
 * Function   : ExtractFilenameWithoutExt
 * Description: Extract filename without extension
 * Parameters : AFileName (string)
 * Returns    : String value
*)
function ExtractFilenameWithoutExt(AFileName: String) : String;
begin
    Result:=ChangeFileExt(ExtractFileName(AFileName), '');
end;

(*
 * Function   : ReplaceKey
 * Description: Replace string
 * Parameters : outStr (string)
 *              inKey (string)
 * Returns    : String value
*)
function ReplaceKey(outStr, inKey : string) : string;
var
    i : integer;
begin
    Result:=outStr;
    for i:=Low(_REPLACEMENT) to High(_REPLACEMENT) do begin
        if _REPLACEMENT[i][0] = inKey then begin
            Result:=_REPLACEMENT[i][1];
            break;
        end
    end;
end;

(*
 * Function   : IsArrayElementInString
 * Description: Replace string
 * Parameters : seek (array of string)
 *              str (string)
 * Returns    : Boolean value
*)
function IsArrayElementInString(seek : array of string; str : string) : boolean;
var
    i : integer;
begin
    Result:=false;
    str:=UpperCase(str);
    for i:=Low(seek) to High(seek) do begin
        if Pos(seek[i], str) > 0 then begin
            Result:=true;
            break;
        end
    end;
end;

(*
 * Function   : VarValue
 * Description: Compare input value with the vars value at position valuePos by the index
 * Parameters : valuePos (byte)
 *              index (byte)
 *              compareValue (string)
 * Returns: True if variable property is the same as compareValue
 *          otherwise false
*)
function VarValue(valuePos, index : byte; compareValue : string) : boolean;
begin
    if ExtractDelimited(valuePos, vars.ValueFromIndex[index], [';']) = compareValue then
        result:=true
    else
        result:=false;
end;

(*
 * Function   : GetVarValue
 * Description: Extract specific variable property from the list
 * Parameters : valuePos (byte) - Variable property position
 *              index (byte)    - Index of variable in the list
 * Returns: Extracted variable property
*)
function GetVarValue(valuePos, index : byte) : string;
begin
    result:=ExtractDelimited(valuePos, vars.ValueFromIndex[index], [';']);
end;

(*
 * Function   : ReplaceToken
 * Description: Replace/substitute program defined tokens with true operators
 * Parameters : code (string)
 *              operand (string)
 *              newOperand01 (string)
 *              newOperand02 (string)
 * Returns: String value
*)
function ReplaceToken(code, operand, newOperand01, newOperand02 : string) : string;
begin
    if (Pos(operand, code) > 1) and (Pos('"', code) > 0)
        and (Pos(operand, code) > Pos('"', code)) then
    begin
        //
    end
    else if Pos(operand, code) > 0 then begin
        if operand = newOperand01 then begin
            code:=ReplaceStr(code, ' ' + operand, operand);
            code:=ReplaceStr(code, operand + ' ', newOperand01);
            code:=ReplaceStr(code, operand, newOperand02);
        end
        else begin
            code:=ReplaceStr(code, ' ' + operand + ' ', newOperand01);
            code:=ReplaceStr(code, operand + ' ', newOperand01);
            code:=ReplaceStr(code, ' ' + operand, newOperand02);
        end;
    end;

    result:=code;
end;

(*
 * Procedure  : CheckOper
 * Description: Count operator occurrences in an expression
 * Parameters : op (string)
 *              expr (string)
*)
procedure CheckOper(op, expr : string);
var
    x, y : integer;
begin
    y:=1;
    repeat
        x:=nPos(op, expr, y);
        if x > 0 then begin
            oper.Add(op + '=' + IntToStr(x) + ';0');
        end;

        inc(y);
    until x = 0;
end;

(*
 * Function   : ActionSCompare
 * Description: Simulating Action! SCompare method
 * Parameters : params (string)
 * Returns: String value
*)
function ActionSCompare(params : string) : string;
var
    paramsEx : TStringArray;
begin
    result:='-2';
    paramsEx:=params.Split(',');

    if High(paramsEx) = 1 then begin
        paramsEx[0]:=Trim(paramsEx[0]);
        paramsEx[1]:=Trim(paramsEx[1]);

        if paramsEx[0][1] = '''' then
            paramsEx[0]:=ExtractText(paramsEx[0], '''', '''')
        else
            paramsEx[0]:=ExtractDelimited(3, vars.ValueFromIndex[vars.IndexOfName(paramsEx[0])], [';']);
        
        if paramsEx[1][1] = '''' then
            paramsEx[1]:=ExtractText(paramsEx[1], '''', '''')
        else
            paramsEx[1]:=ExtractDelimited(3, vars.ValueFromIndex[vars.IndexOfName(paramsEx[1])], [';']);
            
        paramsEx[0]:=ExtractText(paramsEx[0], '"', '"');
        paramsEx[1]:=ExtractText(paramsEx[1], '"', '"');
        //writeln(paramsEx[0], ' * ', paramsEx[1]);

        if paramsEx[0][1] < paramsEx[1][1] then
            result:='-1'
        else if paramsEx[0][1] = paramsEx[1][1] then
            result:='0'
        else
            result:='255';
    end;
end;

(*
 * Procedure  : SplitStr
 * Description: Split source string using delimiter
 * Parameters : source (string)             - Source string to be delimited
 *              delimiter (string)          - Delimiter used for spliting source string
 *              delimitedList (TStringList) - Output list of resulting splitted source string
*)
procedure SplitStr(const source, delimiter: string; var delimitedList: TStringList);
var
    s : PChar;
    DelimiterIndex : Integer;
    Item : String;
begin
    s:=PChar(Source);
    DelimitedList.Clear;
    repeat
        DelimiterIndex:=Pos(Delimiter, s);
        if DelimiterIndex=0 then Break;

        Item:=Copy(s, 1, DelimiterIndex-1);
        DelimitedList.Add(Item);
        inc(s, DelimiterIndex + Length(Delimiter)-1);
    until DelimiterIndex = 0;

    DelimitedList.Add(s);
end;

procedure FuncInIfCond(procName, temp, params2 : string);
var
    //params : TStringArray;
    temp02 : string;
    list : TStringList;
    i : byte;
begin
    list:=TStringlist.create;
    //writeln(procname, ' ', temp, ' ', params2, ' ', compare);
    for i:=0 to 4 do begin
        list.Clear;
        SplitStr(temp, _CMP_OPER[i], list);
        //params:=temp.Split(compare);
        // High(params) = 1
        if list.Count = 2 then begin
            list[0]:=Trim(list[0]);
            list[1]:=Trim(list[1]);
            temp02:=Extract(1, list[0], '(');
            //writeln('temp02 = ', temp02, ' procname = ', procname);
            if funcs.IndexOfName(temp02) >= 0 then begin
                temp02:='';

                if procName = 'RAND' then
                    temp02:='Random'
                else if procName = 'PEEK' then
                    temp02:='Peek'
                else if procName = 'PEEKC' then
                    temp02:='DPeek'
                else if procName = 'SCOMPARE' then begin
                    temp02:=procName;
                    branchPtr.isFuncInIf:=true;
                    branchPtr.ifThenCode += ActionSCompare(params2) + ' ' + _CMP_OPER[i] + ' ' + list[1];
                end;

                if (temp02 <> '') and (temp02 <> 'SCOMPARE') then begin
                    branchPtr.isFuncInIf:=true;
                    branchPtr.ifThenCode += ' ' + temp02 + '(' + params2 + ') ' +
                        _CMP_OPER[i] + ' ' + list[1] + ' ';
                end;
            end;
        end;
    end;

    list.Free;
end;

(*
 * Function   : IsNumber
 * Description: Checking if src is a number
 * Parameters : src (char)
 * Returns: Boolean value
*)
function IsNumber(src : char) : boolean;
begin
    Result:=(src in ['0'..'9']) or (src = '$');
    //Result:=((src > Chr(47)) and (src < Chr(58))) or (src = '$');
end;

(*
 * Function   : VarClear
 * Description: Filling BYTE ARRAY variable with space character
 * Parameters : param01 (string)
 * Returns: String value
*)
function VarClear(param01 : string) : string;
var
    temp : string;
begin
    temp:=ExtractDelimited(4, vars.ValueFromIndex[vars.IndexOfName(param01)], [';']);
    result:='  for eff_var:=0 to ' + temp + ' do' + LineEnding +
            '    ' + param01 + '[eff_var]:=32;';
end;

// procedure Debug(str : string; isShown : boolean);
// begin
//   if isShown then Writeln(str);
// end;
