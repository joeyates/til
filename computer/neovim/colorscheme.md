Find the syntax id of the character under the cursor

```
:echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")
```

Or, with treesitter:

```
:Inspect
```
