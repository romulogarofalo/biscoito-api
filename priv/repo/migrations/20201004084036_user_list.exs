defmodule Biscoito.Repo.Migrations.UserList do
  use Ecto.Migration

  def change do
    create table(:users_lists, primary_key: false) do
      add :user_id, references(:users)
      add :list_uuid, references(:lists)
      timestamps()
    end
  end
end
