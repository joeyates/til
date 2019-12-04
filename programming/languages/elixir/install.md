# kiex

* `kiex list known` - list available versions
* `kiex install {{version}}` - install a version
* `kiex use {{version}}` - use a version in the current shell
* `kiex default {{version}}` - set a default version

# From Source

* http://elixir-lang.org/install.html

## Run Elixir's own Tests

```
make test
```

Run a single test:

```sh
$ cd lib/{{eex|elixir|...}}
$ ../../bin/elixir ../../bin/mix test test/some/particular/file_test.exs:12
```
