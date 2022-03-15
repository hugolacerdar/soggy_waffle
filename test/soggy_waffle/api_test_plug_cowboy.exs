setup do
  options = [
    scheme: :http,
    plug: SoggyWaffle.WeatherAPITestRouter,
    options: [port: 4040]
  ]

  start_supervised!({Plug.Cowboy, options})
  :ok
end

test "get_forecast/1 hits GET /data/2.5/forecast" do
  query = "losangeles"
  app_id = "MY_APP_ID"
  test_server_url = "http://localhost:4040"

  assert {:ok, body} =
    SoggyWaffle.WeatherAPI.get_forecast("Los Angeles", test_server_url)

  assert %{"list" => [weather | _]} = body
  assert %{"dt" => _, "weather" => _} = weather
end
