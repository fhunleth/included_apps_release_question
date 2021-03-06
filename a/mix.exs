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
      mod: {A.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:b, path: "../b", runtime: false}
    ]
  end

  def release do
    [applications: [b: :load, c: :load]]
  end
end
