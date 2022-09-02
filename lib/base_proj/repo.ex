defmodule BaseProj.Repo do
  use Ecto.Repo,
    otp_app: :base_proj,
    adapter: Ecto.Adapters.Postgres
end
