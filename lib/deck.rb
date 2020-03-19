require './lib/card'
require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    percent_high = (high_ranking_cards.length.to_f / cards.length).round(4) * 100
  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    cards << new_card
  end

end
