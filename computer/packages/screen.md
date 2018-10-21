# Starting screen

* `screen -S NAME` - start a named session
* `screen -Rd` - reopen the existing session
* `screen -Rd TEXT` - reopen the existing session with matching name
* `screen -x` - join an open screen session

# Configuration (.screenrc)

...

# Inside screen

Interaction with screen is via keybindings, or by running commands.

* `Ctrl+A` - default keybinding prefix (`^A` below)
* `Ctrl+A : COMMAND` - run a command (`:` below)

## Windows

* `:other` (`^A ^A`) - switch to previous
* `:select [0-9]` (`^A [0-9]`) - switch to a numbered window

## Regions (splits)

* `:split -v` (`^A |`) - vertical split
* `:split` (`^A S`) - horizontal split
* `:only` (`^A Q`) - delete all other regions
* `:focus up|*down|top|bottom` (`^A <TAB>`) - move to another region

# Outside screen

* `screen -list` - list screen sessions
* `screen -X COMMAND PARAMETERS` - send a command to screen

# Other

* `chmod 0666 ???` - allow ...

# References

* http://aperiodic.net/screen/
