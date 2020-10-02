defmodule Biscoito.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :total, :float, default: 0.0
      timestamps()
    end
  end
end
