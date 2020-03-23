require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  def initialize
    create_cards
  end


  def create_cards
    @cards = []
    suits = [:club, :diamond, :heart, :spade]
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]

    values.each do |value|
      @cards << Card.new(:club, value, value.to_i)
      @cards << Card.new(:diamond, value, value.to_i)
      @cards << Card.new(:heart, value, value.to_i)
      @cards << Card.new(:spade, value, value.to_i)
    end
    suits.each do |suit|
      @cards << Card.new(suit, 'Jack', 11)
      @cards << Card.new(suit, 'Queen', 12)
      @cards << Card.new(suit, 'King', 13)
      @cards << Card.new(suit, 'Ace', 14)
    end
  end

  def shuffle_cards
    @cards.shuffle
  end
end
