defmodule BiscoitoWeb.ListsController do
  use BiscoitoWeb, :controller

  action_fallback BiscoitoWeb.FallbackController


  def create(%{req_headers: headers} = conn, attr_list) do
    bearer_token = elem(Enum.at(headers, 1), 1)
    token = String.slice(bearer_token, 7..String.length(bearer_token))
    {:ok, paramsToken} = Biscoito.Guardian.decode_and_verify(token, %{"typ" => "access"})
    %{"sub" => idUser} = paramsToken
    with {:ok, list} <- Biscoito.create_list(attr_list) do
      IO.inspect(list.id)
      # Biscoito.create_users_lists()

      conn
      |> put_status(:created)
      |> render("list.json", list: list)
    end
  end

end
