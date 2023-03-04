defmodule SkiMap.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SkiMapWeb.Telemetry,
      # Start the Ecto repository
      SkiMap.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SkiMap.PubSub},
      # Start Finch
      {Finch, name: SkiMap.Finch},
      # Start the Endpoint (http/https)
      SkiMapWeb.Endpoint
      # Start a worker by calling: SkiMap.Worker.start_link(arg)
      # {SkiMap.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SkiMap.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SkiMapWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
