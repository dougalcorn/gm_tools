defmodule GmTools.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GmTools.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        message: "some message",
        name: "some name"
      })
      |> GmTools.Messages.create_message()

    message
  end
end
