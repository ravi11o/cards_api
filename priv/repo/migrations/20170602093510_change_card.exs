defmodule CardsApi.Repo.Migrations.ChangeCard do
  use Ecto.Migration

  def change do
    alter table(:cards) do
      add :card_color, :string
      remove :card_type
    end
  end
end
