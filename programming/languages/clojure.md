* wikibook - http://en.wikibooks.org/wiki/Clojure_Programming
* Clojure Toolbox - http://www.clojure-toolbox.com/

# Code Structure

* `;` - line comment

# Data Structures

* `()` - list
* `[]` - vector
* `{}` - map

# Leiningen

Install: https://github.com/technomancy/leiningen/blob/stable/README.md#installation

Search for libraries:
    lein search text
Sources for libraries:
http://search.maven.org
clojars
...

## Commands:

lein deps
lein ring server-headless - run a ring application without opening a browser

# Heroku

https://devcenter.heroku.com/articles/clojure-support
https://devcenter.heroku.com/articles/clojure-web-application

# Libraries

## Compojure

A routing library for Ring
clojar
clojure.java.jdbc
Examples
friend
Authentication/authorization
korma
Database DSL

lib-noir
Extracted from noir, usable in Compojure
sessions
static resources
response types
caching
bcrypt

Moustache
A web framework
Noir
Abandoned - see lib-noir
Ring
A web application library
Database
clojure/java.jdbc
docs
Migrations
What I want:
reversible migrations
separation of schema and migration
migrations can be added to different branches in parallel
http://www.luminusweb.net/docs/useful_libraries.md#database_migrations
http://www.luminusweb.net/docs/migrations.md
clojure.java.jdbc
A DSL for databases. No specific migration support.
Drift
Lobos
Expects to find:
src/lobos/config.clj
src/lobos/migrations.clj
Migratus
Ragtime
