==================
  Effectus 0.5.6
==================

The main goal of Effectus is to emulate Action! language as close as possible. Source code is
generated using Mad Pascal cross-compiler, which is further compiled to binary code with
Mad Assembler (Mads). These powerful tools were created by Tomasz Biela (Tebe).

The steps are following:
- Action! code is parsed and appropriate Mad Pascal source code listing (*.pas) is generated
- Mad Pascal compiles this code to *.a65 file prepared for compilation by Mad Assembler
- Mad Assembler compiles *.a65 file to final binary code (*.xex by default)

examples directory includes listing examples to demonstrate available features of Effectus language,
which can be basis for your further development and experimentation.

My special thanks and credits go to:
- Tomasz Biela (Tebe), author of Mad Pascal and Mad Assembler (Mads). He made this all possible!
- Zbyti, who helps me with developing, fixing bugs, Linux distribution compilation and providing
  me with many listing examples and benchmark test examples. And laughs... :)
- Mariusz Buk for hosting original project on GitHub with MacOs compilation
- All others not mentioned here, who help me with comments, suggestions, testing, etc.

- Effectus 0.5.6 was compiled with Free Pascal 3.2.2

- Included cross-compilers compilers
    - Mad Pascal Compiler version 1.7.1 [2024/08/14] for MOS 6502 CPU
    - Mad Assembler 2.1.7 build 33 (1 Aug 24) (2024/08/01)

------------------
What is supported?
------------------

Scalar data types
------------------

BYTE, CHAR, INT, CARD

Extended data type
------------------

BYTE ARRAY, CARD ARRAY, POINTER

- Variable memory address assignment

  Examples:
  BYTE CH=764, COL=710, BYTE GRACTL=$D01D

- TYPE declaration

  TYPE REC = [
    BYTE day, month CARD year
    BYTE height
  ]

- Declaring array variables pointing to memory address

  BYTE ARRAY arrD=28000
  CARD ARRAY arr=$8000

Conditions and branches
-----------------------

- IF/THEN/ELSE/ELSEIF condition statements
- FOR, WHILE, DO, UNTIL, OD branch statements
- infinite loops using DO OD
- EXIT statement for unconditional exit from the current condition or loop

Graphics
--------

PROCedures: GRAPHICS, PLOT, DRAWTO, FILL, LOCATE
Global variable Color for setting the color to draw on screen

Sound
-----

PROCedures: SOUND, SNDRST

INCLUDE files
-------------

Files can be included, starting in the same directory as main compiled listing code.
Currently one level of included files is supported. This means only main listing program can read
files with INCLUDE directive, but not any other files, even if they have this directive called in.

String manipulation
-------------------

PROCedures:
  STRB, STRC, STRI, SCOPY, SCOPYS, SASSIGN, INPUTS,
  PRINT, PRINTE, PRINTB, PRINTBE, PRINTI, PRINTIE, PRINTC, PRINTCE, PRINTF, PUT, PUTE

FUNCtions:
  GETD, INPUTB, INPUTC, INPUTI, SCOMPARE, VALB, VALC, VALI

Arithmetic manipulation
-----------------------

Bitwise manipulation
--------------------

Bitwise/logical operators: AND (&), OR (%), XOR (!), LSH (left shift), RSH (right shift)

Data manipulation
-----------------

PROCedures:
  ZERO, SETBLOCK, MOVEBLOCK

DEFINE declaration (constant substitutions for any statement)
-------------------------------------------------------------

Device I/O support
------------------

PROCedures:
  OPEN, CLOSE, PUTD, PUTDE, PRINTD, PRINTDE, XIO,
  PRINTBD, PRINTBDE, PRINTCD, PRINTCDE, PRINTID, PRINTIDE,
  INPUTSD, INPUTMD

FUNCtions:
  INPUTBD, INPUTCD, INPUTID

- Printing to text modes by using PrintD and PrintDE is allowed

Inline machine language
-----------------------

- Support for inline machine language anywhere in the body of code listing (after variable
  declaration)

  Examples:
    [$A9$21$8D$02C6$0$60]
    [
      $A9$90
      $3E$02C6 $0 $60
    ]

- PROCedure machine language support
- FUNCtion machine language support

  Example:

  PROC TEST=*(BYTE CURSOR,BACK,BORDER,X,Y,UPDOWN)
  [
    $8E 710  ; BACKGROUND COLOR
    $8C 712  ; BORDER COLOR
    $8D 752  ; CURSOR VISIBILITY
    $A5 $A5 $8D 755  ; CHARACTERS UPSIDE DOWN?
    $A5 $A3 $8D 85 0  ; COLUMN FOR TEXT
    $A5 $A4 $8D 84 0  ; ROW FOR TEXT
    $60]

You can send parameters to machine language routines. The compiler stores parameters using
A, X and Y registers, then zero-page addresses from $A3 to $AF are used.

Address      nth byte of parameters
-------      ----------------------
 A register   1st
 X register   2nd
 Y register   3rd
 $A3          4th
 $A4          5th
 :            :
 :            :
 $AF          16th

System manipulation
-------------------

PROCedures:
  POKE, POKEC

PROCedures:
  PEEK, PEEKC

Extra, non-standard statements
------------------------------

- Support for Mad Pascal with directive PAS {}
  
  Example:
    PAS {
      repeat until keypressed;
      for i := 0 to 14 do begin
        SayHelloProc;
        Delay(120);
      end;
    }

  Calling PROCedures and FUNCtions, implemented in Effectus, must include appropriate string
  extension in PAS {} block, in particular, Proc extension for PROCedures and Func extension for
  FUNCtions. Variables or any other entities can be interchanged between Effectus and PAS {}
  block of code.

- Support for Mad Assembler with directive ASM {}

  Example:
    ASM {
      lda #0
      sta 710
    }

- ODFOR and ODWHILE loop directives, which can be used as substitutions for enclosing OD directive
  to close FOR and WHILE loop blocks as there are some issues when using FOR and WHILE statements inside
  ELSE and ELSEIF condition blocks

Misc
----

- Other PROCedures: POSITION, SETCOLOR
- Other FUNCtions: RAND, STICK, STRIG, PADDLE, PTRIG
- Custom PROCedures and FUNCtions are supported
  (parameters can be mixed by any of scalar data types: BYTE, CARD, INT, CHAR)
- Memory address calls through PROCedures are supported (OS calls can be accomplished)

  Examples:
  ; Scroll screen
  PROC SCROLL=$F7F7()
  ; Cassette-beep sound
  PROC BEEPWAIT=$FDFC(BYTE times)

Effectus directory structure
----------------------------

- root directory: program executables, license documents and other supporting files
- src: Effectus source code
- examples: Action!/Effectus examples
- bin: Mad Pascal and Mad Assembler binaries with source code

Command prompt execution
------------------------

effectus <filename> <parameters>

Available options:

-o:extension  Binary file extension
-c            Clear summarized log file
-i            Effectus variable usage list
-t            Effectus only translate source to Mad Pascal
-z            Variable zero page address
-zb           BYTE variable zero page address
-zw           CARD (word) variable zero page address
-zp           Pointer (PByte) zero page address
-mi           Mad Assembler compile info
-target:name  Target system: a8 (default), c64, c4p, Neo6502, raw

- Effectus/Action! source code listing can reside on any path and resulting code
  can also be generated there

- Log files are created on compile time

Missing features and bug issues
-------------------------------

You can read about missing features and bug issues in additional file dev_log.txt!



Written by Bostjan Gorisek from Slovenia
References:
  https://gury.atari8.info/effectus/
  https://github.com/mariusz-buk/effectus
  https://github.com/Gury8/effectus
  https://atariage.com/forums/topic/291426-effectus-action-cross-compiler-using-mad-assembler-mads/
  https://atariage.com/forums/topic/306222-effectus-suggestions-and-bug-reports/

Mad Pascal and MAD Assembler (MADS) are products written by Tomasz Biela (Tebe) from Poland
References:
  https://mads.atari8.info/doc/en/
  https://github.com/tebe6502/Mad-Pascal
  https://github.com/tebe6502/Mad-Assembler
