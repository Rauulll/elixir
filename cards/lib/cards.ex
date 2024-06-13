defmodule Cards do
  @moduledoc """
  A module for creating and manipulating a deck of cards.
  """

  @doc """
  Create a new deck of cards.
  """
  def create_deck do
    values = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    suits = ["♠","♣","♥","♦"]

    for suit <- suits, value <- values do
        "#{value}#{suit}"
    end
  end

  @doc """
  Shuffle the deck of cards.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> new_deck = Cards.shuffle(deck)
      iex> deck !== new_deck
      true

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Check if a card is in the deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "2♠")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

  @doc """
  Deal a hand of cards from the deck based on the number passed into `hand_size`

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, _rest_of_deck} = Cards.deal(deck, 2)
      iex> hand
      ["2♠", "3♠"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save the deck to a file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Load the deck from a file.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "Error reading file"
    end
  end

  @doc """
  Create a hand of cards.
  """
  def create_hand(hand_size) do
    Cards.create_deck() |> Cards.shuffle |> Cards.deal(hand_size)
  end
end
