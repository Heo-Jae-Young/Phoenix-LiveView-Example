#---
# Excerpted from "Programming Phoenix LiveView",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/liveview for more book information.
#---
# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pento,
  ecto_repos: [Pento.Repo]

# Configures the endpoint
config :pento, PentoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "olwmMHEMYDJN6ej6oHncz5fLSQcHSfoCGCxAyzdH1d6gevUV3Ki6ZCNC5TLGBaeP",
  render_errors: [view: PentoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pento.PubSub, adapter: Phoenix.PubSub.PG2], 
  live_view: [
     signing_salt: "UYR7DhqFQwVlHJMMYCYGrwqjVDVeyscI"
   ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
