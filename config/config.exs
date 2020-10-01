# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :biscoito,
  ecto_repos: [Biscoito.Repo]

# Configures the endpoint
config :biscoito, BiscoitoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "efUNfsCSuX6r0FDL+5OqxqejJXh/k+n4gnOEeWy+m681qB3fBcZyn5tnX2TXexO/",
  render_errors: [view: BiscoitoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Biscoito.PubSub,
  live_view: [signing_salt: "F/1RRMpc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
base_path: "/api/auth",
providers: [
  identity: {Ueberauth.Strategy.Identity, [
    callback_methods: ["POST"],
    nickname_field: :username,
    param_nesting: "user",
    uid_field: :username
  ]}
]

config :biscoito, Biscoito.Guardian,
  issuer: "Biscoito",
  secret_key: "yvHZbBjadA+Z+4Yju0MTgKw1a0jM9K7I/e0EXS5e0KGpfIcwB74/MMuDJGxzUpgb",

  # We will get round to using these permissions at the end
  permissions: %{
    default: [:read_users, :write_users]
  }
