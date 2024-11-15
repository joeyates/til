# Installation

Unstable:

```
sudo add-apt-repository ppa:neovim-ppa/unstable
```

## Server

```
pip3 install neovim-remote
```

nvim always runs a server:

```
:echo v:servername
```

Open files with `nvr`

# Configuration

~/.config/nvim/init.lua

# Using Lua

```
:help lua
```

# Commands

Run a lua command

```
:lua {{COMMAND}}
```

# Autocmd

Events: https://neovim.io/doc/user/autocmd.html#autocmd-events

# Introspection

Print a variable

```
:lua print(vim.opt.autoindent:get())
```

Print table variables

```
:lua print(vim.inspect(vim.opt.formatoptions:get()))
```

# Vim

## Variables

https://neovim.io/doc/user/lua.html#lua-vim-variables

* vim.g - global editor variables
* vim.b - buffer-scoped variables
  * vim.b - the current buffer
  * vim.b[n] - buffer `n`
* vim.w - window-scoped variables
* vim.t - tabpage-scoped variables

Current file path

    filename = vim.api.nvim_buf_get_name(0)


## Options

* vim.o - works like Vim's `set`
* vim.opt - works like `set`, but can be assigned table values
  `vim.opt.NAME = { ... }`
  `vim.opt.NAME:prepend = { ... }`
  `vim.opt.NAME:append = { ... }`
  `vim.opt.NAME:remove = { ... }`
  `vim.opt.NAME:get()` - access an option
* vim.go - "accesses the global value of a global-local option" (?!)
* vim.bo - buffer options
  * filetype
* vim.wo

# Lua

# Output

print(string.format('event fired: %s', vim.inspect(ev)))

# Run a Shell Command

```lua
os.execute('COMMAND')
```

# Get Information

NeoVim version

```
:version
```

Lua version:

```
:lua print(_VERSION)
```
