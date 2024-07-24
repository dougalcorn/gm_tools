defmodule GmTools.Lookups.Verb do
  use Ecto.Schema
  import Ecto.Changeset

  schema "verbs" do
    field :verb, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(verb, attrs) do
    verb
    |> cast(attrs, [:verb])
    |> validate_required([:verb])
  end
end
