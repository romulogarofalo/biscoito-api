defmodule BiscoitoWeb.AuthenticationController do
  use BiscoitoWeb, :controller

  alias Biscoito.Accounts
  alias Biscoito.Guardian

  plug Ueberauth

  def login(conn, %{"username" => username, "password" => password}) do
    handle_user_conn(Accounts.get_user_by_username_and_password(username, password), conn)
  end

  defp handle_user_conn(user, conn) do
    IO.inspect(user)
    case user do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user)
        conn
          |> put_resp_header("authorization", "Bearer #{jwt}")
          |> json(%{data: %{token: jwt}})
      # Handle our own error to keep it generic
      {:error, _reason} ->
        conn
        |> put_status(401)
        |> json(%{message: "user not found"})
    end
  end
end
