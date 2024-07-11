defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller

  alias Discuss.UserModel

  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      name: auth.info.name,
      token: auth.credentials.token,
      provider: "github",
      email: auth.info.email
    }

    signin(conn, user_params)

  end

  defp signin(conn, user_params) do
    case update_or_insert_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome")
        |> put_session(:user_id, user.id)
        |> redirect(to: ~p"/topics")
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: ~p"/topics")
    end
  end

  defp update_or_insert_user(user_params) do
    case UserModel.get_user(user_params.email) do
      nil ->
        UserModel.create_user(user_params)
      user ->
        {:ok, user}
    end
  end
end
