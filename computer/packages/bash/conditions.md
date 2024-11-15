# File Conditions

[Files](http://tldp.org/LDP/abs/html/fto.html):

* `-d` - is a directory
* `-e` - exists
* `-f` - is a file
* `-s` - is not zero size

# Integer Conditions

* `-eq` - equal
* `-ne` - not equal
* `-gt` - greater than

# Strings Conditions

* `=` - equal
* `==` - equal
* `<` - less than (ASCII ordering)
* `-z` - is zero length
* `-n` - is not zero length

Examples:

File exists:

```
if [ -e "$FILENAME" ]
then
  ...
fi
```

File does not exist:

```
if [ ! -f "$FILENAME" ]
then
  ...
fi
```

