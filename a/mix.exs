defmodule A.MixProject do
  use Mix.Project

  @app :a

  def project do
    [
      app: @app,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [{@app, release()}]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      included_applications: [:b, :c]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:b, path: "../b"},
      {:c, path: "../c"}
    ]
  end

  def release do
    []
  end
end
