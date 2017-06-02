defmodule CardsApi.CardController do
  use CardsApi.Web, :controller

  alias CardsApi.Card

  def index(conn, _params) do
    cards = Repo.all(Card)
    render(conn, "index.json", cards: cards)
  end

  

  def show(conn, %{"id" => id}) do
    card = Repo.get!(Card, id)
    render(conn, "show.json", card: card)
  end

  def filter_card(conn, %{"color" => color}) do
    query = from c in Card, 
      where: c.card_color == ^color,
      order_by: c.id
    cards = Repo.all(query)
    render(conn, "index.json", cards: cards)
  end
end
