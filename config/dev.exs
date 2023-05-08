import Config

# Configure your database
config :helpdesk, Helpdesk.Repo,
  username: "postgres",
  password: "fG9L02fYQZ0F8lku85l",
  hostname: "localhost",
  database: "ash",
  port: 5432,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
