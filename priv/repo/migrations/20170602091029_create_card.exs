defmodule CardsApi.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :url,               :string
      add :card_type,         :string
      add :title,             :string
      add :author_name,       :string
      add :author_url,        :string
      add :provider_name,     :string
      add :provider_url,      :string
      add :cache_age,         :string
      add :thumbnail_url,     :string
      add :thumbnail_width,   :string
      add :thumbnail_height,  :string

      timestamps()
    end

    create unique_index(:cards, [:url])
  end
end
