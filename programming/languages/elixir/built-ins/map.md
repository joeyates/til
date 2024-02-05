# Map

Kernel (globally imported) functions:

* `is_map/1`
* `has_key?/2`
* put_in

Operators:

* map[key] # => value
* map.key # => value

Update existing keys:

* `%{%{a: 1, b: 2} | a: 42}` # => %{a: 42, b: 2}

Map functions:

* delete
* drop
* equal?
* fetch!
* fetch
* filter
* from_keys
* from_struct
* get
* get_and_update!
* get_and_update
* get_lazy
* has_key?
* keys
* merge(m1, m2)
* new
* pop!
* pop
* pop_lazy
* put
* put_new
* put_new_lazy
* reject
* replace!
* replace
* replace_lazy
* split
* take
* to_list
* update!
* update
* values
