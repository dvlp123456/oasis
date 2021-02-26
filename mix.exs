defmodule Oasis.MixProject do
  use Mix.Project

  @source_url "https://github.com/elixir-oasis/oasis"

  def project do
    [
      app: :oasis,
      version: "0.0.1-dev",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "Oasis (WIP)"
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:recase, "~> 0.7"},
      {:yaml_elixir, "~> 2.5"},
      {:plug, "~> 1.11"},
      {:jason, "~> 1.2"},
      {:ex_json_schema, "~> 0.8.0-rc1"},
      {:plug_cowboy, "~> 2.0", only: [:dev, :test]},
      {:finch, "~> 0.6", only: [:dev, :test]},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
