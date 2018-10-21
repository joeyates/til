# Install

* http://elixir-lang.org/install.html

## Debian Jessie

Currently (6/6/2015), you need to build branch 1.0 from source.

Erlang dependencies:
```
apt-get purge erlang-solutions
apt-get install erlang-common-test erlang-dev erlang-edoc erlang-eunit \
    erlang-inets erlang-parsetools erlang-ssl erlang-tools
```

Clone repo:
```
git clone https://github.com/elixir-lang/elixir.git
cd elixir
git checkout --track -b v1.0 origin/v1.0
git pull
make clean test
# optionally install system wide:
sudo make install
```
