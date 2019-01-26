## Copy BBC Micro to Modern

Input/output program

Notes:

* `*FX 203,50,0` - Set input buffer minimum
* `*FX 7,8` - Set input baud rate to 19200
* `*FX 8,8` - Set output baud rate to 19200
* `*FX 156,20,227` - Set ACIA register. Set word format (?)
* `*FX 2,2` - Specify input from keyboard and serial buffered
* `*FX 229,1` - Make 'ESC' insert the byte 27, instead of interrupting program
* `OSBYTE=&FFF4` - ???
* `ADVAL(-1)`
  * negative arguments are reads
  * ADVAL 1-4 are analogue channels
* `*FX 2` - reset keyboard as input channel
