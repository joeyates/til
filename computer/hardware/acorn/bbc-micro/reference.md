# Tables

* ADVAL: http://beebwiki.mdfs.net/ADVAL
* OSBYTE: http://beebwiki.mdfs.net/OSBYTEs

## FX Commands (see OSBYTE table)

`*FX 2,1` - use serial port for IO
`*FX 2,0` - use keyboard for input
`*FX 3,...` - specify output streams
`*FX 3,0` - send output to serial port
`*FX 7,<index>` - set input baud rate
`*FX 8,<index>` - set output baud rate
`*FX 21, <number>` - flush buffer

## Baud Rates

1 = 75 baud
2 = 150 baud
3 = 300 baud
4 = 1200 baud
5 = 2400 baud
6 = 4800 baud
7 = 9600 baud
8 = 19200 baud
