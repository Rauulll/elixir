defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller

  alias Discuss.UserModel
  alias Discuss.Model.User

  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{
      name: auth.info.name,
      token: auth.credentials.token,
      provider: "github",
      email: auth.info.email}

    case UserModel.create_user(user_params) do
      {:ok, user_params} ->
        conn
        |> put_flash(:info, "Logged in successfully")
        |> redirect(to: ~p"/topics")

      {:error} ->
        conn
        |> put_flash(:warning, "Error logging in")
    end
  end
end
