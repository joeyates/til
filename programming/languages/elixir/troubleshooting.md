# emfile

Problem:

```
{:erl_prim_loader, :file_error}, report: 'File operation error: emfile. Target: ... Function: get_file. Process: code_server.
```

Solution:

Raise the limit on open files.

macOS:

```
ulimit -n 20000
```
