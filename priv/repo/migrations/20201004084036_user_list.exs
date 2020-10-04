defmodule Biscoito.Repo.Migrations.UserList do
  use Ecto.Migration

  def change do
    create table(:users_lists, primary_key: false) do
      add :id_user, references(:users)
      add :id_list, references(:lists)
      timestamps()
    end
  end
end
