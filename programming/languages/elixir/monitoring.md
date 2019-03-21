:erlang.system_info(:logical_processors)

# `:erlang.statistics/1`

http://erlang.org/doc/man/erlang.html#statistics-1

* :erlang.statistics(:run_queue)
* :erlang.statistics(:run_queue_lengths)

    IO.puts ":erlang.statistics(:run_queue): #{:erlang.statistics(:run_queue)}"
