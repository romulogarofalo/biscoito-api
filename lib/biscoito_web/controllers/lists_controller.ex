defmodule BiscoitoWeb.ListsController do
  use BiscoitoWeb, :controller

  action_fallback BiscoitoWeb.FallbackController

  def create(%{req_headers: headers} = conn, attr_list) do
    IO.inspect(Enum.at(headers, 1))
    with {:ok, list} <- Biscoito.create_list(attr_list) do
      conn
      |> put_status(:created)
      |> render("list.json", list: list)
    end
  end

end
