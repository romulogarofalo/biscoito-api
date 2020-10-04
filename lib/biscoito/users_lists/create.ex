defmodule Biscoito.UsersLists.Create do

  alias Biscoito.{Repo, UsersLists}

  def call(attrs) do
    attrs
    |> UsersLists.build()
    |> create_users_lists()
  end

  defp create_users_lists({:ok, struct}), do: Repo.insert(struct)
  defp create_users_lists({:error, _message} = error), do: error

end
