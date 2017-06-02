defmodule CardsApi.CardView do
  use CardsApi.Web, :view

  def render("index.json", %{cards: cards}) do
    %{data: render_many(cards, CardsApi.CardView, "card.json")}
  end

  def render("show.json", %{card: card}) do
    %{data: render_one(card, CardsApi.CardView, "card.json")}
  end

  def render("card.json", %{card: card}) do
    %{id: card.id, url: card.url, color: card.card_color, 
      title: card.title, author: card.author_name}
  end
end
