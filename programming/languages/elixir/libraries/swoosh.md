config/dev.exs

```
config :swoosh, :api_client, false

config {{App atom}}, {{App}}.Mailer,
  adapter: Swoosh.Adapters.Local,
  from_address: "admin@example.com"
```

config/prod.exs

```
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: {{App}}.Finch
```

config/runtime.exs

```
if config_env() == :prod do
  ...
  smtp_host =
    System.get_env("SMTP_HOST") ||
      raise "environment variable SMTP_HOST is missing."
  smtp_user =
    System.get_env("SMTP_USER") ||
      raise "environment variable SMTP_USER is missing."
  smtp_password =
    System.get_env("SMTP_PASSWORD") ||
      raise "environment variable SMTP_PASSWORD is missing."
  smtp_port =
    System.get_env("SMTP_PORT") ||
      raise "environment variable SMTP_PORT is missing."

  config {{App atom}}, {{App}}.Mailer,
    adapter: Swoosh.Adapters.SMTP,
    relay: smtp_host,
    username: smtp_user,
    password: smtp_password,
    ssl: true,
    tls: :if_available,
    auth: :always,
    port: smtp_port,
    retries: 2,
    no_mx_lookups: false,
    from_address: smtp_user
```

config/test.exs

```
config {{App atom}}, {{App}}.Mailer,
  adapter: Swoosh.Adapters.Test

config :swoosh, :api_client, false
```

lib/{{app}}/mailer.ex

```
defmodule {{App}}.Mailer do
  use Swoosh.Mailer, otp_app: {{App atom}}

  def from do
    {"{{App}}", from_address()}
  end

  def from_address do
    config_get!(:from_address)
  end

  defp config_get!(key) do
    config = Application.fetch_env!({{App atom}}, __MODULE__)
    Keyword.fetch!(config, key)
  end
end
```

mix.exs

```
  defp deps do
    [
      ...
      {:gen_smtp, ">= 0.0.0"},
      {:swoosh, "~> 1.3"},
      {:finch, "~> 0.13"}
```


# Test Setup

```
import Swoosh.Email

alias {{App}}.Mailer

recipient = ""

email = new() |> to(recipient) |> from(Mailer.from()) |> subject("A test message") |> text_body("The message body")

{:ok, metadata} = Mailer.deliver(email)
```
