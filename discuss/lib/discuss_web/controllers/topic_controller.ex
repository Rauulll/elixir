defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Model.Topic

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render(conn, :new, changeset: changeset)
  end
end
