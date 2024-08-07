defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  # import Phoenix.Controller

  alias Discuss.UserModel

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && UserModel.get_user(user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end
