use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pet_obituary, PetObituary.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pet_obituary, PetObituary.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pet_obituary_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
