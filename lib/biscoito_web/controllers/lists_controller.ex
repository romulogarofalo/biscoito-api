defmodule BiscoitoWeb.ListsController do
  use BiscoitoWeb, :controller

  action_fallback BiscoitoWeb.FallbackController

  def create(%{req_headers: headers} = conn, attr_list) do
    headers
    |> Enum.at(1)
    |> elem(1)
    |> Biscoito.Guardian.decode_and_verify()
    |> IO.inspect()
    with {:ok, list} <- Biscoito.create_list(attr_list) do
      conn
      |> put_status(:created)
      |> render("list.json", list: list)
    end
  end

end
