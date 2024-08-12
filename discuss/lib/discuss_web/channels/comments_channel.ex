defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  def join(name, _message, socket) do
    IO.puts(name)
    {:ok, %{hello: "world"}, socket}
  end

  def handle_in(name, message, socket) do
    IO.puts("+++++++")
    IO.puts(name)
    IO.inspect(message)
    {:reply, :ok, socket}
  end
end
