import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :helpdesk, Helpdesk.Repo,
  username: "postgres",
  password: "fG9L02fYQZ0F8lku85l",
  hostname: "localhost",
  database: "ash_test#{System.get_env("MIX_TEST_PARTITION")}",
  port: 5432,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
