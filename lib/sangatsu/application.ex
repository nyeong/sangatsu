defmodule Sangatsu.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Sangatsu.Repo,
      # Start the Telemetry supervisor
      SangatsuWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sangatsu.PubSub},
      # Start the Endpoint (http/https)
      SangatsuWeb.Endpoint
      # Start a worker by calling: Sangatsu.Worker.start_link(arg)
      # {Sangatsu.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sangatsu.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SangatsuWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
