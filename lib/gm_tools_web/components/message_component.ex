defmodule GmToolsWeb.MessageComponent do
  @moduledoc """
  Provides a component to display the various styles of messages
  """

  alias GmTools.Messages.Message
  use Phoenix.Component

  attr :message, Message

  def message(assigns = %{message: %{style: "lookup"}}) do
    ~H"""
      <b><%= @message.name %></b> looks up <%= @message.message %>
    """
  end

  def message(assigns = %{message: %{style: "roll"}}) do
    ~H"""
      <b><%= @message.name %></b> rolls <%= @message.message %>
    """
  end

  def message(assigns = %{message: %{style: "emote"}}) do
    ~H"""
      <b><%= @message.name %></b> <em><%= @message.message %></em>
    """
  end

  def message(assigns) do
    ~H"""
      <b><%= @message.name %>:</b> <%= @message.message %>
    """
  end
end
