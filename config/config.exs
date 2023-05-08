import Config

config :ash, :use_all_identities_in_manage_relationship?, false
config :helpdesk, :ash_apis, [Helpdesk.Support]

config :helpdesk, ash_apis: [Helpdesk.Support]
config :helpdesk, ecto_repos: [Helpdesk.Repo]

import_config "#{config_env()}.exs"
