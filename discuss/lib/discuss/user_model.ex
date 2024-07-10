defmodule Discuss.UserModel do
  @moduledoc """
  The Model context.
  """
  import Ecto.Query, warn: false
  alias Discuss.Repo
  alias Discuss.Model.User
  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

end
