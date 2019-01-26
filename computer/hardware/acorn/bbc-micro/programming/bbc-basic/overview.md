# BBC Basic

# Open Source

* https://www.riscosopen.org/viewer/view/apache/RiscOS/Sources/Programmer/BASIC/s/

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
