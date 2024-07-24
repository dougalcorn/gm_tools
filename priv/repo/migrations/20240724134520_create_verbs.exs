defmodule GmTools.Repo.Migrations.CreateVerbs do
  use Ecto.Migration

  def change do
    create table(:verbs) do
      add :verb, :string

      timestamps(type: :utc_datetime)
    end
  end
end
