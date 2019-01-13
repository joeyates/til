# Operating system commands

Lines of text that start with `*` are passed to the operating system.

* `*HELP` - list subsystems
* `*HELP <subsystem>` - list commands provided by subsystem
* `*HELP <command>` - show help on commands

# Operating System

* `*FX` - call `OSBYTE`

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

Note: file names seem to be case-insensitive when read.

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
  * can be used to save plain text program listings
* `*TYPE <fsp>` - print out file contents
* `*WIPE <fsp>` - delete a file

```
*LOAD <program>
*SPOOL PLAIN
LIST
*SPOOL
```

## Keyboard

* `*KEY <number> <text>` - program a function key

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
