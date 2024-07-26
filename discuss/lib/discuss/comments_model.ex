defmodule Discuss.CommentsModel do
  import Ecto.Query, warn: false

  alias Discuss.Model.Comments
  alias Discuss.Repo

  # Create comment
  def create_comment(attrs \\ %{}) do
    %Comments{}
    |> Comments.changeset(attrs)
    |> Repo.insert()
  end

  # Get comment
  def get_comment(id), do: Repo.get!(Comments, id)
end
