# :beam_lib

When passed a module, it deduces the path to the BEAM file, and fails if it does not exist.
When passed a binary, it doesn't need the file on disk.

## :beam_lib.all_chunks({module})

## :beam_lib.chunks({module}, [{type}])

Type:
* abstract_code - http://www.erlang.org/doc/man/beam_lib.html#type-abst_code
* attributes - Returns the version (:vsn)
* exports
* labeled_exports
* imports
* indexed_imports
* locals
* labeled_locals
* atoms

### abstract_code
* compile
* file
* module
* export - exported functions
* spec - info data and function ASTs

## :beam_lib.info({module|byte code})

# :erlang

## :erlang.get_module_info()

Returns a keyword list with all info about the module:
* :attributes - keyword list (see below)
* :exports - keyword list (see below)
* :imports - keyword list (see below)
* :compile - keyword list (see below)

## :erlang.get_module_info({type})

Param is type:
* :module - returns the module.
* :attributes - returns a keyword list of attributes:
  :vsn - the version (defaults to the MD5 checksum of the module)
* :compile
  * :options
  * :version
  * :time
  * :source
* :exports - returns a keyword list of exported functions and their arity,
* :imports - returns a keyword list of imported functions and their arity,
* :functions - returns a keyword list of *all* functions and their arity.

## :erlang.system_info(TYPE)

* System Information
  * :system_version - returns a string containing:
    OTP version,
    ERTS version,
    processor architecture

# ets - Erlang Term Storage

Store data in the runtime system.

# inets

# io

Print to stdout:

io:format("~s~n", [SOME_VALUE])

Format as a string:

`io_lib:format("~p", [SOME_VALUE])`

## Cookbook

Serve directory contents

* use 'text/html' as default MIME type
* redirect to /foo/ from /foo
* serve /foo/index.html for /foo/

erl -s inets -eval 'inets:start(httpd,[{server_name,"localhost"},{document_root, "."},{server_root, "."},{port, 8000},{mime_type,"text/html"},{mime_types,[{"ht","text/html"},{"htm","text/html"},{"js","text/javascript"},{"css","text/css"},{"gif","image/gif"},{"jpg","image/jpeg"},{"jpeg","image/jpeg"},{"png","image/png"}]},{directory_index, ["index.html"]}]).'
