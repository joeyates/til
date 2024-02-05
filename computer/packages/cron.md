# Handle `%`

See `man -S 5 crontab`:

       Percent-signs (%) in the  command,  unless  escaped  with
       backslash  (\),  will be changed into newline characters, and all data after
       the first % will be sent to the command as standard input.

Solution 1: Use a variable

```
MY_VARIABLE=%ciao

* * * * * bash -c "echo $MY_VARIABLE"
```

Solution 2: Excape with `\`

```
* * * * * bash -c "echo \%ciao"
```
