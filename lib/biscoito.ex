defmodule Biscoito do
  alias Biscoito.Lists
  alias Biscoito.UsersLists

  defdelegate create_list(attrs), to: Lists.Create, as: :call
  defdelegate create_users_lists(attrs), to: UsersLists.Create, as: :call
end
