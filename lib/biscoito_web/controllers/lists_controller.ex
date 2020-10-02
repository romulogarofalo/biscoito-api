defmodule BiscoitoWeb.ListsController do
  use BiscoitoWeb, :controller

  action_fallback BiscoitoWeb.FallbackController

  def create(conn, attr_list) do
    with {:ok, list} <- Biscoito.create_list(attr_list) do
      conn
      |> put_status(:created)
      |> render("list.json", list: list)
    end
  end

end
