# Files

# Opening/closing

command | meaning
--------|--------
`:e `*file*      | open *file* in a new buffer
`:e!`            | reopen the current file, discarding changes

# Minimal Actions

command | meaning
--------|--------
`d`                      | delete
`u`                      | undo
`x`                      | delete character
`y`                      | copy
`^r`                     | redo
`A`/`a`                  | insert at end of line/after cursor
`I`/`i`                  | insert at beginning of line/before cursor
`O`/`o`                  | edit in new line before/after
`P`/`p`                  | paste before/after

## Buffers

command | meaning
--------|--------
`:buffers`       | list buffers
`:ls`            |
`:buffer `*n*    | switch to buffer *n*
`:`*n*`b`        |
`:bprevious`     | previous buffer
`:bnext`         | next buffer
`:bd`            | close the current buffer

# Output

command | meaning
--------|--------
`:messages`   | show previous output


## Tabs

command | meaning
--------|--------
`:tabedit `*file*   | edit *file* in a new tab
`:tab sball`        | open all buffers as tabs
`:tabm `*n*         | move tab to (0-indexed) position *n*
`:tabnew`           | create a new tab (without an associated buffer)
`gt`                | next tab
*n*`gt`             | go to *n*th tab
`gT`                | previous tab

## Windows/viewports

command | meaning
--------|--------
`:sp`               | Split current pane into 2 horizontally (both showing current file):
`:vs`               | ...vertically
`^wq`               | Unsplit (close current window)
`^ww`               | Switch window

## Folding

command | meaning
--------|--------
`zc`                | close current fold
`zo`                | open current fold
`zr`                | open one level of folding

# Editing

## View

command | meaning
--------|--------
`^e`                | Shift up
`^q`                | Shift down

## Autocompletion

command | meaning
--------|--------
`^X^N`    | words in current file
`^N`      | words in any file
`^X^]`    | tags
`^X^U`    | user defined completion (e.g. Rails)

## Indentation

command | meaning
--------|--------
`=`       | re-indent the current selection
`==`      | re-indent the current line
`gg=G`    | re-indent whole file

# Case

command | meaning
--------|--------
`~`       | toggle case
`g~`M       | toggle case
`gU`M       | upcase
`gu`M       | downcase

# Options (Variables)

Types:
* string
* number
* toggle

command | meaning
--------|--------
`:set`                      | Print all non-default options
`:set all`                  | Print all options
`:set `*option*`?`          | Print option's value
`:set `*option*             | (string/number option) print value
`:set `*option*`=`*value*   | (string/number option) Set the option
`:set `*option*             | (toggle option) set to `on`
`:set no`*option*           | (toggle option) set to `off`
`:set `*option*`!`          | (toggle option) invert value

Scopes:
(Indicated by 1-letter prefixes)

* g: - global
* v: - global, defined by Vim

(see `:help internal-variables`)

# Registers

Register *name*s are single, lowercase characters.

The "unnamed" register is `"`.

command | meaning
--------|--------
`:reg(isters)`            | list registers and contents
`"`*name*`yy`             | copy current line to register *name*
`"`*name*`p`              | paste register *name*

# Macros

Record to and playback register contents.

command | meaning
--------|--------
`q`*name*                 | start recording *name*
`q`                       | stop recording
`@`*name*                 | execute macro *name*
*n*`@`*name*              | execute macro *name* *n* times
`@@`                      | repeat last macro

## Leader

The 'leader' is a user-defined key that prefixes commands. Commands shortcuts
can be defined `<leader>foo` so that they work with any user's value of 'leader'.

command | meaning
--------|--------
`:let mapleader`         | see the current leader
`:let mapleader = ","`   | set leader

# Find and Replace

Command syntax:
```
:[range]s[ubstitute]/find_pattern/replace_string/flags count
```

Range:
* [nothing] - current line
* % - whole file
* n,m - range of lines
* '<,'> - in the selection (default command in visual mode)
* g/pattern - only on lines containing pattern

Flags:
* c - confirm each
* g - replace all occurences in line
* i - ignore case

Characters requiring escaping:
* [
* =
* >

Find Patterns:
* \<text\> - whole word
* [...] - range
* \+ - 1 or more times
* \(xxx\) - capture
* \(text1|text2\) - alternatives

Replace:
* text - itself
* \n - nth capture
* \=command - result of a command

## Useful commands:

* 'text' . 'text'
* line(".") - current line number
* expand(variable)
* submatch(n) - parts of the match (0 == whole match)
* toupper()
* @a - contents of register a

## Examples

Remove spaces after opening parentheses:
```
:%s/{ /{/gc
```

Remove spaces after opening (, { or [
```
:%s/ \([)}]\)/\1/gc
```

# File Type

`:set syntax=`*file type*

Set file type inside files with a 'modeline':

`# vim: set syntax=sh :`

# Colorschemes

Load a colorscheme:
`:colorscheme `*name*

Print current colorscheme:
`:colorscheme`

Dump the current colorscheme:
`:highlight`

# Configuration

Define a macro:

`let @`*name*` = 'command'`

# Help

...

# Other

## External commands

command | meaning
--------|--------
`:sh`                     | open shell
`:!`*command*             | run *command* in a shell

# Plugins

## CtrlP

Open in new vertical split: `^v`

# Cookbook

## Replace all tabs with two spaces

`:%s/\t/  /g`
