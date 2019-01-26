# Copying

http://mdfs.net/Software/Comms/

## Create a Plain Text File from a BBC Basic Program

```
*LOAD {{program}}
*SPOOL {{filename}}
LIST
*SPOOL
```

## Copy a Program to BBC micro

* save with windows newlines

perl -p -e 's/\n/\r\n/' < UNIX_LF.txt > WINDOWS_CRLF.txt

Connect terminal emulator

minicom --baudrate 4800 <<config name>>

On BBC:

NEW
*FX 7,6
*FX 2,1

Minicom send:

^BS

ascii

<Enter>

Enter file path

To terminate, via terminal:

* FX 2,0

## Copy form BBC Micro to a Linux Computer

$ stty -F /dev/ttyUSB0 igncr # ignore extra carriage returns
$ stty -F /dev/ttyUSB0 4800
$ stty -F /dev/ttyUSB0 eof '' # may be useful for binary transfers

*FX 8,6 # output 4800 baud
*FX 3,1 # output to serial and defaults
*FX 3,23 # output only to serial (better for binary?)

$ cat -v < /dev/ttyUSB0 > {{file}}

### text files

*TYPE {{file}}

### BBC Basic Files

*LOAD {{file}}
LIST

### binary files, then re-extract binary

*DUMP {{file}}

## Using Minicom

This method fails when certain character codes are passed.

First, load, or copy over a file transfer program.

Minicom capture:

^BL

Enter path for capture file.

Run file transfer program.

> RUN

^BL (Close)
