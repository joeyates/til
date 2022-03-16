https://www.swi-prolog.org/pldoc/doc_for?object=(%27,%27)/2

# Concepts

* clauses
* queries

`=` represents 'unification'

# Terms

## Atoms

* [a-z] + [a-zA-Z0-9_]*
* '.*'
* [\+-*/<>=:.,&~]+

## Number

Normal numbers: integers or reals

## Constant

* atom | number

## Variables

* [A-Z_] + [a-zA-Z0-9_]*

Varibles starting with '_' are 'anonymous'.

## functor

* atom

## Complex Terms

Also called 'structures'.

* functor + '(' + [term + ','] * + ')'

The number of terms is the 'arity'

## Predicate

A complex term with a certain arity is a 'predicate'

Annotation is atom + '/' arity

# Fact

predicate(atom).
predicate(Variable).
predicate(NUMBER).

# Body

* predicate
* predicate ',' predicate - AND
* predicate ';' predicate - OR

# Goal

Any one of the predicates in a body

# Rule

predicate :- body

The predicate is true if the body is true.
The predicate is the 'head'.

# Clause

* rule + '.'

# Query

A clause supplied to prolog interactively.
Prolog responds with all possible solutions, then 'false'.

# Source

Comment

```prolog
%
```

# REPL

Prompt:

```prolog
?-
```

# Commands

* [FILENAME]. - Load a file
* listing. -  List knowledge
* listing(predicate). - List a predicate
* trace - Show debug output

Check identity ('unification'):

```
=(ARG1, ARG2).
ARG1 = ARG2.
```

Non unification:

ARG1 \= ARG2.

# Versions

## Swipl

* https://www.swi-prolog.org/

Installation:

asdf plugin add swiprolog
brew install cmake libarchive gmp jpeg libarchive libiconv libmcrypt ncurses openssl ossp-uuid pkgconfig readline zlib pcre libedit
asdf install swiprolog 8.4.1

Invocation:

swipl
