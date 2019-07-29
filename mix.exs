defmodule LoLPoints.MixProject do
  use Mix.Project

  def project do
    [
      app: :lolpoints,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      escript: escript_conf(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {LoLPoints.Application, []}
    ]
  end

  defp deps do
    [
      {:yaml_elixir, "~> 2.4"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 4.0.1"}
    ]
  end

  defp escript_conf do
    [
      main_module: LoLPoints,
      name: "LoLPoints Server",
      path: "./bin/lolpoints"
    ]
  end
end
