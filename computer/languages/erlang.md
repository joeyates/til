# REPL

```
$ erl
^A, ^E
^G - cancel
tab completion
help()
q() - quit
f(Variable) - undef a vbl
f() - undef all
c(module_name) - compile module
```

# Execution

Create file 'foo.erl':

```erlang
-module(foo).
-export([bar/0]).
bar() -> io:fwrite("baz\n").
```

Start erlang shell:

```shell
$ erl
```

Compile file:

```erlang
1> c(foo).
2> foo:bar().
baz
3> q().
```

# Compilation

```shell
$ erlc program.erl
```

# Files

.erl extension - extension for Erlang code files
.hrl extension - include files.

# Syntax

## Structural

%% - comment.
. - end of ?statement?
,  - part separator

## Types

* Variables - initial uppercase
* _ - unbound variable placeholder
* atoms - initial lower
* tuple { ..., ... }
* list []
* (string == list of printable char codes)
* fun - 

## Fun

FunVariable = fun(args) -> Expression(s);
                             (args2) -> Expressions
                       end
# Record

Define:

(keys are atoms)

```erlang
-record(name, {key1, key2, ...}).
```

Dereference:

```
Variable#name.key
```

# Module

Define:
        -module(name).
Export functions:
        -export([function_1/arity ...]).
Import:


# Operators

* = - pattern match (assigns if undef)
* =:= - equal
* =/= - not equal
* == - ??compare float and integer?? 
* /= - ??
* | - cons operator
* [Variable|Variable] = list - puts head in Head and tail in Tail

# Standard Modules

## erlang

The erlang module is always imported

* hd(list) - head of list
* tl(list) - tail of list
* [] - list comprehension:
NewList = [Expression || Pattern <- List, Condition1, Condition2, ... ConditionN].
[2*N || N <- [1,2,3,4], X rem 2 =:= 0].

## io

* format(string, list) - insert list items into string.
* fwrite(string)

Format options:

* ~n - newline
* ~p - interpolate ???

# inet_parse (undocumented?)

* address(ipv4_string) -> {ok,{b1, b2, b3, b4}}
* address(ipv6_string) -> {ok, ...}

# Standard Applications

## ssh

exports:
* connect/3
* connect/4
Libraries

## euint

Separate tests can be put in module_name_tests.erl

Standard out is captured, print to 'user' to see output:

```erlang
io:format(user, "Some output during testing~n").
```

Basic test:

```erlang
foo() -> 1.
foo_test() ->
        1 = foo().
```

Using the ?assert macro:

```erlang
foo(E) -> E.
foo_test_() ->
        ?assert(foo(1) =:= 1).
```

Test generators:
(test name ends in test_)

```
foo(E) -> E.
foo_test_() ->
        fun () -> ?assert(foo(1) =:= 1) end.
```


The ?_test macro:

```
foo(E) -> E.
foo_test_() ->
        ?_test(?assert(foo(1) =:= 1)).
```


The ?_assert macro:

```
foo(E) -> E.
foo_test_() ->
        ?_assert(foo(1) =:= 1).
```


A list of ?_assert macros:

```
foo(E) -> E.
foo_test_() ->
        [?_assert(foo(1) =:= 1),
         ?_assert(foo(2) =:= 2)].
```


# References

* Learn You Some Erlang
