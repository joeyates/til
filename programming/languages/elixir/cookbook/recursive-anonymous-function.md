# Problem

How do I define an anonymous function that can call itself

# Solution 1

Pass in the function

```
anon = fn list, fun ->
  [first | rest] = list
  IO.puts(first)
  if Enum.any?(rest) do
    fun.(rest, fun)
  end
end

anon.([1, 2, 3], anon)
```
