defmodule Biscoito.Lists.Create do

  alias Biscoito.{Repo, Lists}

  def call(attrs) do
    attrs
    |> Lists.build()
    |> create_list()
  end

  defp create_list({:ok, struct}), do: Repo.insert(struct)
  defp create_list({:error, _message} = error), do: error

end
