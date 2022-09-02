# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# uniform:remove
config :base_proj, Uniform, blueprint: BaseProj.Uniform.Blueprint
# /uniform:remove

config :base_proj,
  ecto_repos: [BaseProj.Repo]

# Configures the endpoint
config :base_proj, BaseProjWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: BaseProjWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BaseProj.PubSub,
  live_view: [signing_salt: "oqvP3rhI"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :base_proj, BaseProj.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
