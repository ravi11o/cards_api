defmodule CardsApi.Repo.Migrations.MultipleColumnSearch do
  use Ecto.Migration

  def up do
    execute "CREATE extension if not exists pg_trgm;"
    execute "CREATE INDEX cards_title_trgm_index ON cards USING gin (title gin_trgm_ops);"
  end
 
  def down do
    execute "DROP INDEX cards_title_trgm_index;"
  end
end
