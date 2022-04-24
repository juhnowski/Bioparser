defmodule Bioparser.MixProject do
  use Mix.Project

  def project do
    [
      app: :bioparser,
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"}
    ]
  end

  defp escript_config() do
      [
        main_module: Bioparser.CLI
      ]
  end
end
