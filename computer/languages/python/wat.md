# Optparse - no required arguments

Optparse parses options. So it has been decided that no option can be required.
The alternative proposed is `argparse` where positional arguments can be required.

From the [official docs][optparse-docs]:
```
required option
    an option that must be supplied on the command-line;
    note that the phrase “required option” is self-contradictory in English.
    optparse doesn’t prevent you from implementing required options,
    but doesn’t give you much help at it either.
```

[optparse-docs]: https://docs.python.org/2/library/optparse.html
