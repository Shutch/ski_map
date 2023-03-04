defmodule SkiMap.Repo do
  use Ecto.Repo,
    otp_app: :ski_map,
    adapter: Ecto.Adapters.Postgres
end
