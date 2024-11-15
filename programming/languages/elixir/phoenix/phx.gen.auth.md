* https://hexdocs.pm/phoenix/mix_phx_gen_auth.html

Generates views, routes, notifications and database migrations for
email+password authentication

# Preparation

Add `ecto_sql`

```
mix ecto.gen.repo -r {{App}}.Repo
```

edit config/config.exs

```
config :my_app, ecto_repos: [{{App}}.Repo]
```

# Invocations

```sh
mix phx.gen.auth Accounts User users
```

LiveView authentication views

```sh
mix phx.gen.auth Accounts User users --live
```

## Setup SMTP

See Elixir library Swoosh

# Without Email Interactions

```sh
mix phx.gen.auth Accounts User users --live
rm lib/*/accounts/user_notifier.ex
rm lib/*_web/live/user_confirmation_instructions_live.ex
rm lib/*_web/live/user_confirmation_live.ex
rm lib/*_web/live/user_forgot_password_live.ex
rm lib/*_web/live/user_registration_live.ex
rm lib/*_web/live/user_reset_password_live.ex
rm lib/*_web/live/user_settings_live.ex
```

edit lib/*_web/components/layouts/root.html.heex:

* remove the block with the link to settings and register

edit lib/*_web/router.ex:

```
-       live "/users/register", UserRegistrationLive, :new
-       live "/users/reset_password", UserForgotPasswordLive, :new
-       live "/users/reset_password/:token", UserResetPasswordLive, :edit
-       live "/users/settings", UserSettingsLive, :edit
-       live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
-       live "/users/confirm/:token", UserConfirmationLive, :edit
-       live "/users/confirm", UserConfirmationInstructionsLive, :new
```

edit lib/*_web/controllers/user_session_controller.ex:

* remove create/1 functions for "registered" and "password_updated"

edit lib/*_web/live/user_login_live.ex:

* remove header subtitle ("register") section
* remove .link to forgot password

edit lib/*/accounts.ex

* delete `## User registration`, `## Settings`, `## Confirmation` and `## Reset password` section

```
mix deps.get
mix ecto.migrate
```

N.B. This leaves functions in lib/*/accounts/user.ex which relate to user settings
updates.

# Manual User Creation

Add function to Accounts

```

  ## User creation

  @doc """
  Creates a user, **without** requiring email confirmation.

  ## Examples

      iex> create_and_confirm_user(%{field: value})
      {:ok, %User{}}

      iex> create_and_confirm_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_and_confirm_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> User.confirm_changeset()
    |> Repo.insert()
  end
```

Create a mix task `lib/mix/tasks/create_user.ex`

```elixir
defmodule Mix.Tasks.MY_APP.CreateUser do
  @moduledoc """
  Create a new user with the supplied email and password
  """
  @shortdoc "Create a user"

  use Mix.Task

  alias MY_APP.Accounts

  def run([email, password]) do
    Mix.Task.run("app.start")

    case Accounts.create_and_confirm_user(%{
      email: email,
      password: password
    }) do
      {:ok, _user} ->
        IO.puts "User '#{email}' created"
      {:error, changeset} ->
        IO.puts "User creation failed:"
        render_errors(changeset)
    end
  end

  defp render_errors(%Ecto.Changeset{errors: errors}) do
    Enum.each(errors, &render_error/1)
  end

  defp render_error({field, {message, data}}) do
    message = 
      Enum.reduce(
        data,
        message,
        fn {k, v}, acc ->
          String.replace(acc, "%{#{k}}", to_string(v))
        end
      )
    IO.puts "- #{field} #{message}"
  end
end
```
