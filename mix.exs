defmodule Huami.Mixfile do
  use Mix.Project

  def project do
    [app: :huami,
     version: "0.0.1",
     name: "Huami",
     source_url: "https://github.com/yesmeck/huami.ex",
     escript: escript_config,
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    []
  end

  def escript_config do
    [ main_module: Huami ]
  end
end
