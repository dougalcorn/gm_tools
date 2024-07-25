defmodule GmTools.Repo.Migrations.AddStyleToMessages do
  use Ecto.Migration

  def change do
    alter table("messages") do
      add :style, :string
    end
  end
end
