# Sessions

Detach the current session:

```
^B d
```

Reattach existing session:

```
$ tmux attach
```

# Commands

Fill list: https://man7.org/linux/man-pages/man1/tmux.1.html

* new-window

# Key Bindings

* ^B ? - list key bindings
* ^B c - create new window

# Windows

* set window title:

```
^B ,
^B :rename_window
```

# Scripting

```
rename-window '{{name}}'
```

```
new-window -n '{{name}}'
```

Horizontal split:

```
split-window -v -t '{{existing name}}
```

```
send-keys -t '{{name}}' '{{command 1}}' C-m '{{command 2}}' C-m
```
