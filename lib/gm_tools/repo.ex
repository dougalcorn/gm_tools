defmodule GmTools.Repo do
  use Ecto.Repo,
    otp_app: :gm_tools,
    adapter: Ecto.Adapters.Postgres
end
