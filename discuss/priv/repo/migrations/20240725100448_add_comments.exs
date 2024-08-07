defmodule Discuss.Repo.Migrations.AddComments do
  use Ecto.Migration

  def change do
    create  table(:comments) do
      add :comments, :string
      add :user_id, references(:users)
      add :topic_id, references(:topics)
    end
  end
end
