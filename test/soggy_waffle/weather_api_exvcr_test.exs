defmodule SoggyWaffle.WeatherAPITest.ExVCR do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "get_forecast/1 hits GET /data/2.5/forecast" do

    use_cassette "weather_api_successful_request" do
      assert {:ok, body} = SoggyWaffle.WeatherAPI.get_forecast("Los Angeles")
      assert %{"list" => [weather | _]} = body
      assert %{"dt" => _, "weather" => _} = weather
    end
  end
end
