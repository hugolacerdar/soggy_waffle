defmodule SoggyWaffleTest do

  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  setup do
    current_weather_api_module =
      Application.get_env(
        :soggy_waffle,
        :weather_api_module,
        SoggyWaffle.WeatherAPI
      )

    Application.put_env(
      :soggy_waffle,
      :weather_api_module,
      SoggyWaffle.WeatherAPIMock
    )

    on_exit(fn ->
      Application.put_env(
        :soggy_waffle,
        :weather_api_module,
        current_weather_api_module
      )
    end)
    :ok
  end
  describe "rain?/2" do

    setup _ do
      Mox.stub_with(SoggyWaffle.WeatherAPIMock, SoggyWaffle.WeatherAPI)
      :ok
    end
    test "success: gets forecasts, returns true for imminent rain" do

      expect(SoggyWaffle.WeatherAPIMock, :get_forecast, fn city ->
        assert city == "Los Angeles"

        response = %{
          "list" => [
            %{
              "dt" => DateTime.to_unix(DateTime.utc_now()) + 60,
              "weather" => [%{"id" => _thunderstorm = 231}]
            }
          ]
        }

        {:ok, response}
      end)

      assert SoggyWaffle.rain?("Los Angeles", DateTime.utc_now())
    end
  end
end
