defmodule Bioparser.MGnify do
  @user_agent [ {"User-agent", "Elixir juhnowski@gmail.com"} ]

  def fetch(url) do
    url
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end

  def handle_response({ :ok, %{status_code: 200, body: body}}) do { :ok, body }
    { :ok, body }
  end

  def handle_response({ _, %{status_code: _, body: body}}) do
    { :error, body }
  end

end
