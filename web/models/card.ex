defmodule CardsApi.Card do
  use CardsApi.Web, :model

  schema "cards" do
    field :url,               :string
    field :card_color,        :string
    field :title,             :string
    field :author_name,       :string
    field :author_url,        :string
    field :provider_name,     :string
    field :provider_url,      :string
    field :cache_age,         :string
    field :thumbnail_url,     :string
    field :thumbnail_width,   :string
    field :thumbnail_height,  :string

    timestamps()
  end

  @required_fields ~w(url card_color)
  @optional_fields ~w(title author_name author_url provider_url provider_name cache_age
  thumbnail_width thumbnail_url thumbnail_height)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end

  def search(query, search_term) do
    from(c in query,
    where: fragment("? % ?", c.card_color, ^search_term),
    order_by: fragment("similarity(?, ?) DESC", c.card_color, ^search_term))
  end

  def search_title(query, search_term) do
    from(c in query,
    where: fragment("? % ?", c.title, ^search_term),
    order_by: fragment("similarity(?, ?) DESC", c.title, ^search_term))
  end
end
