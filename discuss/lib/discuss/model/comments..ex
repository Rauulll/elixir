defmodule Discuss.Model.Comments do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :comments, :string

    belongs_to (:topic), Discuss.Model.Topic
    belongs_to (:user), Discuss.Model.User
  end

  def changeset(struct, attr \\ %{}) do
    struct
    |> cast(attr, [:comments, :user_id, :topic_id])
    |> validate_required([:comments])
  end
end
