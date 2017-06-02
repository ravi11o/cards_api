# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
defmodule DatabaseSeeder do
  def add_random_card do
    Faker.start
    CardsApi.Repo.insert!(
      %CardsApi.Card{
        url: Faker.Internet.url,
        card_color: Faker.Commerce.color,
        title: Faker.App.name,
        author_name: Faker.App.author
        })
  end
end

Enum.each(1..100, fn n -> DatabaseSeeder.add_random_card end)
 
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
