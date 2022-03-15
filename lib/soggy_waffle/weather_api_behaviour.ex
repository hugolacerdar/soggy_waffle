defmodule SoggyWaffle.WeatherAPI.Behaviour do
  @callback get_forecast(city :: String.t()) :: {:ok, term()} | {:error, reason :: term()}
end
