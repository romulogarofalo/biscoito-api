defmodule Biscoito.Lists do

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "lists" do
    field :name, :string
    field :total, :float, default: 0.0
    timestamps()
  end

  @required_attrs [:name]

  def build(attrs) do
    attrs
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(attrs), do: create_changeset(%__MODULE__{}, attrs)
  def changeset(list, attrs), do: create_changeset(list, attrs)

  defp create_changeset(module_or_list, attrs) do
    module_or_list
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
  end


end
