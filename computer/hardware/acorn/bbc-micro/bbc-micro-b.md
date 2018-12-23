# Operating system commands

Lines of text that start with `*` are passed to the operating system.

* `*HELP` - list subsystems
* `*HELP <subsystem>` - list commands provided by subsystem
* `*HELP <command>` - show help on commands

# Disks

* ??? - list disks
* `*DISK <number>` - select drive by number
* `*DIR <directory>` - set the current directory
* `*CAT` - list drive contents
* `*EX <directory>` - list detailed file information for a directory
* `*FORM [40|80]` - format disk
* `*FREE <number>` - show free space on drive (defaults to current drive)
* `*INFO <afsp>` - list detailed drive contents
* `*TITLE <title>` - sets a disk's title

Boot !BOOT program from disk: SHIFT + F12 ? Shift + BREAK

# Files

* `*CLOSE` - close all files
* `*DUMP <afsp>` - print file contents in hex
* `*EXEC <fsp>` - run a Basic program from disk
* `*LIST <fsp>` - print file contents with line numbers
* `*LOAD <filename>` - load a Basic file
* `*RUN <fsp>` - run a machine code file from disk
* `*SAVE <filename> <start> <end> <execute adress> [<reload address>]` -
  save a section of memory
* `*SPOOL` - close a file opened by `*SPOOL <fiename>`
* `*SPOOL <fsp>` - opens a file for plain output
* `*WIPE <fsp>` - delete a file

## Keyboard

* `*KEY <numnber> <text>` - program a function key

## *EX

```
> *EX <directory>
```

* directory defaults to current directory

Output: see `*INFO`

## *INFO

* `afsp` - file specifier, accepts `#` and `*` as wildcards

Output columns:

* Directory
* Filename
* Access
* Load address (in hex)
* Execution address (in hex)
* Length (bytes in hex)
* Start sector (in hex)

## *SAVE

* filename specifier: :<drive>.<dir>.<filename>
* filename length is between 1 and 7 characters

http://bbcbasic.co.uk/bbcbasic/manual/opsys1.html

# BBC Basic

## Source code

* `LIST [<start line>,<end line>]` - list current program
* `RENUMBER`
* `DELETE`

The program code should use lower numbers while functions and
procedures should use higher numbers.

## DATA

Data can be stored in the program's source code in
lines marked `DATA`.
The data is copied into variables using `READ`.
A data pointer marks which line of DATA is to be read next.
The position of the "data pointer" can be manipulated with `RESTORE`

## Screen

* `CLS` - clear screen (with current background colour)
* `MODE <number>` - change screen resolution
* `PRINT <value>`

================

http://central.kaserver5.org/Kasoft/Typeset/BBC/Ch33.html

## Variables

There are 26 pre-declared integer variables: %A..%Z and %@
All other variables a declared with `DIM`

## Keywords

* [..] - assembler
* ABS - 
* ACS - 
* ADVAL - 
* AND - 
* ASC - 
* ASN - 
* AUTO - 
* BGET - 
* BPUT - 
* COLOUR - 
* CALL - 
* CHAIN - 
* CHR$ - 
* CLEAR - Clear all "declared variables"
* CLOSE#<channel> - Closes a file
* CLG - 
* COS - 
* DATA - 
* DEG - 
* DEF FN - Define a function. A function returns a result
* DEF PROC - Define a procedure. A procedure does not return a result.
* DELETE <from>,<to>- Delete a number of lines from the program
* DIV - 
* DIM - 
* DRAW - 
* ENDPROC - 
* END - 
* ENVELOPE - Produce sound
* ELSE - 
* EVAL - 
* ERL - 
* EOF - 
* EOR - 
* ERR - 
* EXP - 
* EXT#(channel) - Get size of file
* FOR...NEXT - 
* FALSE - 
* GOTO - 
* GET$ - 
* GET - 
* GOSUB - 
* GCOL - 
* HIMEM - Read or set the highest limit used by BASIC
* INPUT - 
* IF - 
* INKEY$ - 
* INKEY - 
* INT - 
* INSTR( - 
* LISTO <number> - Set the format for following `LIST` commands.
  Add extra spaces, 1 - after line numbers, 2 - in FOR...NEXT loops,
  3 - in REPEAT...UNTIL loops
* LOAD - 
* LOMEM - 
* LOCAL - Declare a variable local to the current function or procedure.
* LEFT$( - 
* LEN - 
* LET - 
* LOG - 
* LN - 
* MID$( - 
* MOD - 
* MOVE - 
* NEW - Clear the existing program
* NOT - 
* OLD - Recover the previous program after `NEW` or Break having been pressed.
* ON ERROR - 
* ON GOTO - 
* ON GOSUB - 
* OR - 
* OPENIN - Opens a file for input and returns the channel
* OPENOUT - 
* PAGE - 
* PTR#<channel> - Set or read the position of a random access file pointer
* PI - 
* PLOT - 
* POS - 
* REPORT - 
* READ - Copy data from the current `DATA` statement into a variable,
  and advance the "data pointer"
* REM - Precedes a comment in code
* RUN - Start the current program.
* RAD - 
* REPEAT...UNTIL - 
* RESTORE [<line number>] - Set the data pointer line number. Without an
  argument, set it to the first `DATA` statement in the program.
* RETURN - Return th the instruction following the previous call to `GOSUB`
* RIGHT$() - 
* RND - 
* RENUMBER - Change the numbering of the proram's lines
* SAVE "<filename>" - Save current program to current drive
* SGN - 
* SIN - 
* SQR - 
* SOUND - 
* SPC(number) - In `PRINT` statements, print a number of spaces.
* STR$ - 
* STRING$() - 
* STOP - 
* TAN - 
* TAB( - 
* TIME - 
* TRACE ON|OFF|<line number> - Turn on or off printing of line numbers
  before they are executed. If a number is given, only lines *below* that
  number are printed.
* TRUE - 
* USR - Call a machine code routine and accept a return value.
* VDU - Send control codes to the VDU drivers
* VAL - 
* VPOS - 
* WIDTH - 

================

# Serial connection

## Cable

* http://www.cowsarenotpurple.co.uk/bbccomputer/serialcable.html
* http://www.sprow.co.uk/bbc/extraserial.htm#Crossover

## BBC Setup

`*FX 7,<index>` - set input baud rate
`*FX 8,<index>` - set output baud rate
`*FX 2,1` - use serial port for IO

`*FX 2,0` - use keyboard for input

Rates
1 = 75 baud
2 = 150 baud
3 = 300 baud
4 = 1200 baud
5 = 2400 baud
6 = 4800 baud
7 = 9600 baud
8 = 19200 baud

## Desktop setup

* eight data bits, no parity, one stop bit (8N1)
* no hardware flow control

/etc/minicom/.minirc.bbcmicro

Minicom commands

^A E - echo locally
^A L - Capture to file

http://danceswithferrets.org/geekblog/?p=469

# BBC Micro Programs

http://www.danceswithferrets.org/geekblog/wp-content/uploads/2014/09/mandy1.txt
http://www.danceswithferrets.org/geekblog/wp-content/uploads/2014/09/mandy2.txt

# Emulators

* https://bbc.godbolt.org/?keyLayout=natural

# References

## BBC Micro

* http://beebwiki.mdfs.net/Main_Page
* http://bbc.nvg.org/doc/BBCUserGuide-1.00.pdf
* http://primrosebank.net/computers/bbc/documents/BBCMicroUserGuide.pdf

## Motherboard

* http://8bs.com/inbbc.htm

## Disc Filing System - DFS

* http://chrisacorns.computinghistory.org.uk/docs/Acorn/Manuals/Acorn_DiscSystemUGI2.pdf
* http://primrosebank.net/computers/bbc/documents/Acorn_DiscSystemUGI2.pdf

## Serial Connection

### RS423 port

"5-pin DIN "domino" socket (SK4)"

RTS   Data in
    0v
CTS   Data out

* http://chrisacorns.computinghistory.org.uk/docs/Jafa/JafaRS423IFCartridgeUG.pdf
* http://bbc.nvg.org/doc/A%20Hardware%20Guide%20for%20the%20BBC%20Microcomputer/bbc_hw_03.htm

### PC 9-pin D-type

1 - DCD
2 - RD
3 - TD
4 - DTR
5 - GND
6 - DSR
7 - RTS
8 - CTS
9

* http://www.cowsarenotpurple.co.uk/bbccomputer/serialcable.html

### Version 1

BBC          PC
===============
Data out --- 2
Data in  --- 3
0v       --- 5
CTS      --- 7
RTS      --- 8

          |- 1
          |- 4
          |- 6

* http://danceswithferrets.org/geekblog/wp-content/uploads/2014/09/serial_cable_wiring.png
* http://www.sprow.co.uk/bbc/extraserial.htm

### Version 2

* http://www.brahms.demon.co.uk/software/downloads/serial-cable.txt

### Version 3

* http://www.cowsarenotpurple.co.uk/bbccomputer/serialcable.html

Data out --- 2
Data in  --- 3
CTS      --- 4
0v       --- 5
RTS      --- 6
          |- 1

          |- 7
          |- 8

### Version 4

http://www.zprod.org/PG/machines/bbcMicroInterface.htm

# Copying

## Program to BBC micro

* save with windows newlines
* cat <file> > /dev/ttyUSB0

### Transmission

http://www.bbcbasic.co.uk/bbcbasic/manual/annexe.html

```
    5 MODE 0
   10 *FX 203,50,0
   20 *FX 7,8
   30 *FX 8,8
   40 *FX 156,20,227
   50 *FX 2,2
   70 *FX 229,1
   85 OSBYTE=&FFF4
   90 REPEAT
  100 IF ADVAL(-1)>0 AND ADVAL(-3)>0 THEN PROCout
  110 IF ADVAL(-2)>0 THEN PROCin
  120 UNTIL INKEY(-33)
  125 *FX 2
  130 END
 1000 DEFPROCout
 1010 *FX 2,2
 1020 A%=138:X%=2
 1030 REPEAT
 1035 Y%=GET:CALL OSBYTE
 1040 UNTIL ADVAL(-1)=0 OR ADVAL(-3)=0
 1050 ENDPROC
 1100 DEFPROCin
 1110 *FX 2,1
 1120 REPEAT
 1130 C%=GET
 1140 IF C%=10 THEN PRINT ELSE VDU C%
 1150 UNTIL ADVAL(-2)=0
 1155 *FX 2,2
 1160 ENDPROC
```
