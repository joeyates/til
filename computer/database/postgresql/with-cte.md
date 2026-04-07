```
WITH cte1 AS (
  SELECT * FROM table1 WHERE a_field = 123
)
DELETE FROM table2 t2
USING cte1 c
WHERE c.id = t2.customer_id;
```

# Delete Records That Are Referenced by Another Table Using CTE

```sql
WITH unreferenced AS (
  SELECT p.id from points p left join points_tracks pt on p.id = pt.point_id where pt.track_id is NULL
)
DELETE FROM points p
USING unreferenced u
WHERE p.id = u.id;
```
