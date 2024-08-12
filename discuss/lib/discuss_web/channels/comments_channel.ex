defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  alias Discuss.{Model, CommentsModel}


  def join("comments:" <> topic_id, _message, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Model.get_topic!(topic_id)

    {:ok, %{}, assign(socket, :topic, topic)}
  end

  def handle_in(_name, %{"content" => comment}, socket) do
    result =
      socket.assigns.topic
      |> Ecto.build_assoc(:comments)
      |> CommentsModel.create_comment(%{comments: comment})

    IO.puts("++++++")
    IO.inspect(result)
    IO.puts("++++++")

    case result do
      {:ok, comment} ->
        {:reply, {:ok, comment}, socket}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, {:error, %{changeset: changeset}}, socket}
    end
  end
end
