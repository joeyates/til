# Functions

* `to_tsvector(STRING)` - Converts a string to a tsvector.
* `to_tsvector(CONFIGURATION, STRING)` - Converts a string to a tsvector using stemming and stop words from a configuration.
* `websearch_to_tsquery(STRING)` - Converts a string to a tsquery using the websearch syntax.
* `websearch_to_tsquery(CONFIGURATION, STRING)` - Converts a string to a tsquery using the websearch syntax and a configuration.

# Type Casts

```sql
'foo'::tsvector
```

# Operators

* `TSVECTOR @@ TSQUERY`
* `TSQUERY @@ TSVECTOR`
* `TEXT @@ TSQUERY` - Casts text to a tsvector and then does match
