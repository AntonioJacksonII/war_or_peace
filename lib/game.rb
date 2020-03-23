require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  def initialize
    create_cards
    shuffle_cards
    assign_cards_to_decks
    assign_decks_to_players
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
    @cards.shuffle!
  end

  def assign_cards_to_decks
    @deck1 = Deck.new(@cards[0..25])
    @deck2 = Deck.new(@cards[26..52])
  end

  def assign_decks_to_players
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
  end

  def start
    turns = 0

    1000000.times do
      if @player1.deck.cards == []
        p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      elsif @player2.deck.cards == []
        p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      elsif turns == 1000001
        p "---- DRAW ----"
        break
      elsif (@player1.deck.cards.length != 0) && (@player2.deck.cards.length != 0)
        current_turn = Turn.new(@player1, @player2)
        turns += 1
          if current_turn.type == :basic
            p "Turn #{turns}: #{current_turn.winner.name} won 2 cards."
          elsif current_turn.type == :war
            p "Turn #{turns}: WAR - #{current_turn.winner.name} won 6 cards."
          elsif current_turn.type == :mutually_assured_destruction
            p "Turn #{turns}: *mutually assured destruction* 6 cards removed from play."
          end
        current_turn.pile_cards
          if current_turn.type == :basic || current_turn.type == :war
            current_turn.award_spoils(current_turn.winner)
          end
      end
    end
  end
end
