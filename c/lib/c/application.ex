defmodule C.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    IO.puts("Starting C")
    children = [
      # Starts a worker by calling: C.Worker.start_link(arg)
      # {C.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: C.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
