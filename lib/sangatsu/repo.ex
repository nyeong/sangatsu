defmodule Sangatsu.Repo do
  use Ecto.Repo,
    otp_app: :sangatsu,
    adapter: Ecto.Adapters.Postgres
end
