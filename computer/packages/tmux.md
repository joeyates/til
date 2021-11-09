# Running commands

Commands can be launched in the following ways:

* via tmux configurations files,
* on the tmux command-line,
* as commands from within tmux,
* via keyboard shortcuts from within tmux.

## From the Command Line

Commands can be sent to running sessions by adding `-t` to indicate the **t**arget.

## Via Keyboard shortcuts

Commands can be mapped to a keyboard shortcut consisting of a prefix
and a character. The default prefix is Ctrl+B (^B)

## From within tmux

Commands can be run via `^B :`

# Commands

* attach - same as `attach-session
* attach-session - attach to the current session
* detach
  * ^B d
* new-window - create a new window
* new-window -n '{{name}}' - ...with a name
  * ^B c
* list-keys - list key bindings
* list-keys -N - list key bindings with notes
  * ^B ?
* rename-window {{name}}
  * ^B ,
* split-window - split window
* split-window -v - ...horiziontally (!)
* split-window -h - ...vertically (!)
* send-keys - simulate typing
* send-keys '{{command 1}}' C-m - ...add an enter keypress

# Cookbook

## Sessions

Reattach to an existing session:

```
$ tmux attach
```

## Commands

All commands are listed in tmux help:

```
$ man tmux
```
