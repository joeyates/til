# Struct

A named map with specific keys.

```
%Foo{name: "bar"}
```

# Declaration

```
defmodule Foo do
  defstruct [:bar, :baz]
end
```

Use an atom list sigil for longer lists:

```
defmodule Foo do
  defstruct ~w(bar baz)a
end
```

With default values:

```
defmodule Foo do
  defstruct bar: "Default", baz: nil
end

foo1 = %Foo{bar: "Hello"}
```

Access members via '.':

```
IO.puts foo1.bar
```

# Update

%SomeStruct{struct | key: :value}

with key checking

struct!(%SomeStruct{}, key: :value)
