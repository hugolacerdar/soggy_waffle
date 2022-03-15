defmodule SoggyWaffle.WeatherAPITestRouter do
  use Plug.Router

  # manually import assertions since we are not inside an ExUnit test case
  import ExUnit.Assertions

  plug :match
  plug :dispatch
  plug :fetch_query_params

  get "/data/2.5/forecast" do
    params = conn.query_params

    assert is_binary(params["q"])
    assert is_binary(params["APPID"])

    forecast_data = %{
      "list" => [
        %{
          "dt" => DateTime.to_unix(DateTime.utc_now()),
          "weather" => [%{"id" => _thunderstorm = 231}]
        }
      ]
    }

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(forecast_data))
  end
end
