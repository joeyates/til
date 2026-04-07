# References

```sh
mix ecto.gen.migration create_foos_table name:string
mix ecto.gen.migration create_bars_table title:string:unique foo_id:references:foos
```

