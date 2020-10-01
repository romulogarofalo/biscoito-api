defmodule Biscoito.Repo do
  use Ecto.Repo,
    otp_app: :biscoito,
    adapter: Ecto.Adapters.Postgres
end
