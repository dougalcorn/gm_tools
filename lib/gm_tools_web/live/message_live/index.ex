defmodule GmToolsWeb.MessageLive.Index do
  use GmToolsWeb, :live_view

  alias GmTools.Messages
  alias GmTools.Messages.Message

  @impl true
  def mount(_params, _session, socket) do
    changeset = Message.changeset(%Message{}, %{})
    messages = Messages.list_messages() |> Enum.reverse()

    {:ok, socket
     |> assign(form: to_form(changeset))
     |> stream(:messages, messages)
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Message")
    |> assign(:message, Messages.get_message!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Message")
    |> assign(:message, %Message{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Messages")
    |> assign(:message, nil)
  end

  defp apply_action(socket, _, _) do
    socket
  end

  @impl true
  def handle_info({GmToolsWeb.MessageLive.FormComponent, {:saved, message}}, socket) do
    {:noreply, stream_insert(socket, :messages, message)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    message = Messages.get_message!(id)
    {:ok, _} = Messages.delete_message(message)

    {:noreply, stream_delete(socket, :messages, message)}
  end

  def handle_event("validate", %{"message" => message_params}, socket) do
    changeset = Message.changeset(%Message{}, message_params)
    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  def handle_event("save", %{"message" => message_params}, socket) do
    case Messages.create_message(message_params) do
      {:ok, message} ->
        changeset = Message.changeset(%Message{}, %{"name" => message_params["name"], "message" => ""})

        {:noreply,
         socket
         |> assign(:form, to_form(changeset))
         |> stream_insert(:messages, message)
        }

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
