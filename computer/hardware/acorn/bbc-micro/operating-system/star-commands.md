# Operating system commands

Lines of text that start with `*` are passed to the operating system.

* `*HELP` - list subsystems
* `*HELP <subsystem>` - list commands provided by subsystem
* `*HELP <command>` - show help on commands

# DFS - Disk File System

## Watford DFS

* Density: 40 or 80 tracks
* Numbering: primary - 0, 2
* Max Files per drive: 31

## File Specifiers

Files are specified by drive, directory and filename (an 'fsp'):

```
:{{drive}}.{{directory}}.{{filename}}
```

Initial Defaults:
* drive: 0
* directory: $

## AFSP

Commands like `*INFO` accept fsps with wildcards ('afsp's):

* `#` - single character
* `*` - any number of characters

# Operating System

* `*FX` - call `OSBYTE`

# Disks

* `*.` - abbreviation of `*CAT`
* ??? - list disks
* `*DISK <number>` - ???
* `*DRIVE <number>` - select drive by number
* `*DIR <directory>` - set the current directory
* `*CAT [:{{number}}]` - list drive contents
* `*EX <directory>` - list detailed file information for a directory
  (can't get this to work)
* `*FORM [40|80]` - format disk
* `*FREE <number>` - show free space on drive
  (defaults to current drive)
  (can't get this to work)
* `*INFO <afsp>` - list detailed drive contents
* `*TITLE <title>` - sets a disk's title

* `*EDIT` - open watford drive tools

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

## Keyboard

* `*KEY <number> <text>` - program a function key

## *EX

```
> *EX <directory>
```

* directory defaults to current directory

Output: see `*INFO`

## *INFO

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
