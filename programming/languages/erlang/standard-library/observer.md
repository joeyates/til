# Installation

The observer is a wxWidgets application.

See here: https://github.com/asdf-vm/asdf-erlang#before-asdf-install

brew install autoconf openssl@1.1 wxwidgets

## "No usable OpenSSL found"

For 24.0 I was unable to fix this on macOS with M1 processor
https://github.com/erlang/otp/issues/4821

## "invalid parameter name: 'new' is a keyword"

Build without JIT:

KERL_CONFIGURE_OPTIONS=--disable-jit asdf install erlang ...
