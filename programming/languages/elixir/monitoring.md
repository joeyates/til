:erlang.system_info(:logical_processors)

# `:erlang.statistics/1`

http://erlang.org/doc/man/erlang.html#statistics-1

```elixir
:erlang.statistics({{item}})
```

Items:
* :active_tasks -> a list of the count of active tasks for each scehduler
* :active_tasks_all -> a list of the count of active tasks for each scehduler
* `:context_switches` - a tuple (2 elements) with number of context switches since the system started
* `:exact_reductions`
* `:garbage_collection`
* `:io`
* `:microstate_accounting`
* `:reductions`
* :run_queue -> integer
* :run_queue_lengths -> list with the queue length for each scheduler
* `:run_queue_lengths_all`
* `:runtime`
* `:scheduler_wall_time`
...

    IO.puts ":erlang.statistics(:run_queue): #{:erlang.statistics(:run_queue)}"

Count of messages in a process's message queue:

Process.info(pid, :message_queue_len)
