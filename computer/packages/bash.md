# Configuration

If a line starts with a space, don't add it to history
If a line is repeated, don't add it to history

* HISTCONTROL=ignoreboth

# Subshells

```
(...commands)
```

# Variables

## set default value

Return first parameter if set, otherwise the supplied value: 
```
${1:-foo};
```

## calculated default value

# Commands

Perform expansion, without other commands:
```
: {command}
```

# Conditions ("Tests")

[Files](http://tldp.org/LDP/abs/html/fto.html):

* `-d` - is a directory
* `-e` - exists
* `-f` - is a file
* `-s` - is not zero size

Integers:

* `-eq` - equal
* `-ne` - not equal
* `-gt` - greater than

Strings:

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

# case

```
case "$foo" in
  bar)
     ...
     ;;
  *)
     ...
esac
```

# for

## numerical loop over range

```
for i in {1..20}; do echo $i; done
```

## Convert a series of image files

for file in *.CR2; do convert "${file}" "${file/%.CR2/.jpg}"; done
