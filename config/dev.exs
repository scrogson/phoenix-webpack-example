use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :example, Example.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  check_origin: false,
  watchers: [
    webpack: ["--config", "./config/webpack_css.config.js", "--watch-stdin"],
    node: ["./config/phoenixWebpackDevServer.js"],
    npm: ["run", "copy-assets"]
  ]

# Watch static and templates for browser reloading.
config :example, Example.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(css|png|jpeg|jpg|gif|svg)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :example, Example.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "kold",
  password: "postgres",
  database: "example_dev",
  hostname: "localhost",
  pool_size: 10
