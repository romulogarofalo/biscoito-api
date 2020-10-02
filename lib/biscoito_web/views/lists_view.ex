defmodule BiscoitoWeb.ListsView do
  use BiscoitoWeb, :view
  alias BiscoitoWeb.ListsView
  alias Biscoito.Lists

  def render("list.json", %{list: %Lists{id: id, name: name, total: total}}) do
    %{
      id: id,
      name: name,
      total: total
    }
  end
end
