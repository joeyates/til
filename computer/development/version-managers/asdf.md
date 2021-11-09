# erlang

https://github.com/asdf-vm/asdf-erlang

# Compile Erlang with wxWidgets

apt-get -y install libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev

# Build from source

asdf install {{plugin}} ref:{{version}}

Avoid nodejs problem with lack of checksum from GitHub

NODEJS_CHECK_SIGNATURES='no' asdf install nodejs ref:{{version}}
