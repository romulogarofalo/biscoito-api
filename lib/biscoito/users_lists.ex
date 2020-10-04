defmodule Biscoito.UsersLists do

  use Ecto.Schema
  import Ecto.Query, warn: false
  import Ecto.Changeset

  alias Biscoito.Lists
  alias Biscoito.Accounts.User

  schema "users_lists" do
    belongs_to :id_user, User
    belongs_to :id_list, Lists
  end

  @required_attrs [:id_user, :id_list]

  def build(attrs) do
    create_changeset(%__MODULE__{}, attrs)
    |> apply_action(:insert)
  end

  defp create_changeset(module, attrs) do
    module
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
  end


end
