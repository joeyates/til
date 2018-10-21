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

# Condifions ("Tests")

## `-e`: File exists

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

## `-eq`: Integers equal
## `==`: Strings equal

# for

## numerical loop over range

```
for i in {1..20}; do echo $i; done
```

## Convert a series of image files

for file in *.CR2; do convert "${file}" "${file/%.CR2/.jpg}"; done
