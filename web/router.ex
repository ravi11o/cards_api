defmodule CardsApi.Router do
  use CardsApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CardsApi do
    pipe_through :api

    resources "/cards", CardController, only: [:index, :show]
    get "/cards/color/:color", CardController, :filter_card
    
  end
end
