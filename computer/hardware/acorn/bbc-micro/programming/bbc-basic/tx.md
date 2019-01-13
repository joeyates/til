Program source:
http://www.bbcbasic.co.uk/bbcbasic/manual/annexe.html

Notes:
* baud rate: 9600

# Analysis

190 *FX3,7 : REM send output to ??, value 7 is wrong - 'unused'
200 *FX8,7 : REM set output baud rate to 9600
210 *FX7,7 : REM set input baud rate to 9600
220 *FX2,1 : REM use serial port for IO
230 *FX21,1 : REM flush input buffer
240 *FX21,2 : REM flush output buffer

280   VDU byte : REM send `byte` to output
