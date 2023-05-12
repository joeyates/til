Git offers diffing, use that! :)

```sh
git diff f1 f2
```

Show character by character differences:

```sh
git diff --word-diff --word-diff-regex=. f1 f2
```

By default `diff` produces output where removed lines are prefixed with
'<' and inserted lines with '>' and a '---' separator.

To produce a 'Unified diff', with '-' and '+', use `-U n`,
where `n` is the number of context lines:

```sh
diff -U 2 FILE1 FILE2
```

To get a 'word diff', or 'inline diff', combine with `wdiff`:

```sh
diff -U 2 FILE1 FILE2 | wdiff [-d|--diff-input]
```

...with delimiters and highlighting:

```sh
diff -U 2 FILE1 FILE2 | wdiff [-d|--diff-input] --terminal --start-delete='{-' --end-delete='-}' --start-insert='{+' --end-insert='+}'
```
