defmodule SoggyWaffle.WeatherAPI.Behaviour do
  @callback get_forecast(city :: String.t()) :: {:ok, term()} | {:error, reason :: term()}
  @callback get_forecast(city :: String.t(), base_url :: String.t()) :: {:ok, term()} | {:error, reason :: term()}
end
