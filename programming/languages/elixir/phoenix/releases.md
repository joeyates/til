https://hexdocs.pm/phoenix/releases.html

# Convert a Project to Use Releases

* Minimum Elixir 1.9
* Runtime config in config/runtime.exs

* Rename config/prod.secret.exs to config/runtime.exs
* Remove
import_config "prod.secret.exs"
from config/prod.exs
