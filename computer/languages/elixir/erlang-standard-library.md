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

# ets - Erlang Term Storage

Store data in the runtime system.
