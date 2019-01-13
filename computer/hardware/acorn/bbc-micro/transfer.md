# Copying

http://mdfs.net/Software/Comms/

# Transmission

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
  100   IF ADVAL(-1)>0 AND ADVAL(-3)>0 THEN PROCout
  110   IF ADVAL(-2)>0 THEN PROCin
  120 UNTIL INKEY(-33)
  125 *FX 2
  130 END
 1000 DEFPROCout
 1010 *FX 2,2
 1020 A%=138:X%=2
 1030 REPEAT
 1035   Y%=GET:CALL OSBYTE
 1040 UNTIL ADVAL(-1)=0 OR ADVAL(-3)=0
 1050 ENDPROC
 1100 DEFPROCin
 1110 *FX 2,1
 1120 REPEAT
 1130   C%=GET
 1140   IF C%=10 THEN PRINT ELSE VDU C%
 1150 UNTIL ADVAL(-2)=0
 1155 *FX 2,2
 1160 ENDPROC
```

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

## Copy a Program to BBC micro

* save with windows newlines
* cat <file> > /dev/ttyUSB0
