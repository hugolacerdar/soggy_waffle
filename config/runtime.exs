import Config

DotenvParser.load_file(".env")

config :soggy_waffle, app_key: System.fetch_env!("APP_KEY")
