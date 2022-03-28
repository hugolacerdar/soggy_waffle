defmodule SoggyWaffleTest do

  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  describe "rain?/2" do

    setup _ do
      Mox.stub_with(SoggyWaffle.WeatherAPIMock, SoggyWaffle.WeatherAPI)
      :ok
    end
    test "success: gets forecasts, returns true for imminent rain" do

      # expect(SoggyWaffle.WeatherAPIMock, :get_forecast, fn city ->
      #   IO.inspect(city == "Los Angeles", label: "Checking")
      #   assert city == "Los Angeles"

      #   response = %{
      #     "list" => [
      #       %{
      #         "dt" => DateTime.to_unix(DateTime.utc_now()) + 60,
      #         "weather" => [%{"id" => _thunderstorm = 231}]
      #       }
      #     ]
      #   }

      #   {:ok, response}
      # end)

      # assert SoggyWaffle.rain?("Los Angeles", DateTime.utc_now())
    end
  end
end
