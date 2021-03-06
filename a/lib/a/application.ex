defmodule A.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    IO.puts("Starting A")

    spawn(&start_b_later/0)

    children = [
      # Starts a worker by calling: A.Worker.start_link(arg)
      # {A.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: A.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp start_b_later() do
    IO.puts("Starting B in a second")
    Process.sleep(1000)

    IO.puts("Ok, going to start B...")
    Application.ensure_all_started(:b)
  end
end
