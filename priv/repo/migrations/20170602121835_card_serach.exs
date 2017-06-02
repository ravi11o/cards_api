defmodule CardsApi.Repo.Migrations.CardSerach do
  use Ecto.Migration

  def up do
    execute "CREATE extension if not exists pg_trgm;"
    execute "CREATE INDEX cards_card_color_trgm_index ON cards USING gin (card_color gin_trgm_ops);"
  end
 
  def down do
    execute "DROP INDEX cards_card_color_trgm_index;"
  end
end
