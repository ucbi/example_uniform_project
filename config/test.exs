import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :base_proj, BaseProj.Repo,
  username: "postgres",
  password: "postgres",
  database: "base_proj_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :base_proj, BaseProjWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "G2T2mh3q+YZV5tWZmFL8UhU6ivCcC8TxkWr/u/hiKU/pxV4CscvfVBRmWrTXJqk4",
  server: false

# In test we don't send emails.
config :base_proj, BaseProj.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
