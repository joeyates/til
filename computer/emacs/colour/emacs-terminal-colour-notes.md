# Problem

Emacs should support 24-bit colour (aka truecolor) in the terminal.
Doing so depends on the terinal configuration.

# TL;DR

Solution: compile a terminfo and set that as TERM before launching Emacs.

# Emacs

https://www.gnu.org/software/emacs/manual/html_node/efaq/Colors-on-a-TTY.html

Colours Emacs can use:

```
M-x list-colors-display
```

Force a mode:

8 colour:

```shell
$ TERM=xterm emacs -w
```

256 colour:

```shell
$ xterm-TERM=256color emacs -nw
```

Output:

* 8 colour mode: 8 lines (black to white),
* 256 colour mode: 256 lines (black to white, bright black to bright white,
  color-16 to color-255),
* 24-bit mode: 556 lines

Scripts to show terminal colours:

https://github.com/JohnMorales/dotfiles/tree/master/colors

24-bit in Emacs:

https://emacs.stackexchange.com/questions/32506/conditional-true-color-24-bit-color-support-for-iterm2-and-terminal-app-in-osx

https://github.com/emacs-mirror/emacs/commit/e463e5762bbe628be3d15da066a90f079a8468b3

# Colour in Terminals and Terminal Emulators

## Tmux

https://github.com/syl20bnr/spacemacs/wiki/Terminal

## Terminator

Does it have Tc cupport?

$ tmux info | grep Tc

# terminfo

Compile a description:

$ /usr/bin/tic -x -o ~/.terminfo terminfo-24bit.src

## Debug terminfo

Get the result for a specific colour:

$ TERM=xterm-24bits tput setf24 65555 | cat -v
