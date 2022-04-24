defmodule Bioparser.MGnify do
  @user_agent [ {"User-agent", "Elixir juhnowski@gmail.com"} ]

  def fetch(url) do
    url
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end

  # def handle_response({ :ok, %{status_code: 200, body: body}}) do { :ok, body }
  #   { :ok, body }
  # end

  # def handle_response({ _, %{status_code: _, body: body}}) do
  #   { :error, body }
  # end


  def handle_response({ _, %{status_code: status_code, body: body}}) do {
    status_code |> check_for_error(),
    body        |> Poison.Parser.parse!()
  }
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error

end
