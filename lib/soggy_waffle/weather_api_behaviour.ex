defmodule SoggyWaffle.WeatherAPIBehaviour do
  @callback get_forecast(city :: String.t()) :: {:ok, term()} | {:error, reason :: term()}
end
