defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck generates a deck of cards" do
    deck_length = Cards.create_deck()
    assert length(deck_length) == 52
  end

  test "save/2 save the deck as binary" do
    deck = Cards.create_deck()
    Cards.save(deck, "my_deck")
    assert is_binary(File.read!("my_deck"))
  end
end
