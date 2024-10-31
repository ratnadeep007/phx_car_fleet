defmodule PhxPractice.Repo do
  use Ecto.Repo,
    otp_app: :phx_practice,
    adapter: Ecto.Adapters.Postgres
end
