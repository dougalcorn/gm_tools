defmodule GmTools.LookupsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GmTools.Lookups` context.
  """

  @doc """
  Generate a verb.
  """
  def verb_fixture(attrs \\ %{}) do
    {:ok, verb} =
      attrs
      |> Enum.into(%{
        verb: "some verb"
      })
      |> GmTools.Lookups.create_verb()

    verb
  end
end
