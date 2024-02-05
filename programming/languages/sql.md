# Common Table Expressions (CTEs)

```
WITH {{NAME}} AS ({{QUERY}}) ...;

# Find records with duplicates in a field

```
SELECT {{FIELD}}
FROM {{TABLE}}
GROUP BY {{FIELD}}
HAVING COUNT(*) > 1;
```
