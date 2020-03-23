require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

class Turn

  attr_reader :player1, :player2, :spoils_of_war, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    set_turn_type
  end

  def set_turn_type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      @type = :basic
    elsif (@player1.deck.cards.length >= 3 && @player2.deck.cards.length >=3) && (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) && (@player1.deck.cards[2].rank == @player2.deck.cards[2].rank)
      @type = :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      @type = :war
    end
  end

  def winner
    if @type == :basic
      if @player1.deck.cards[0] == nil
        @player2
      elsif @player2.deck.cards[0] == nil
        @player1
      elsif @player1.deck.cards[0].rank >  @player2.deck.cards[0].rank
        @player1
      else
        @player2
      end
    elsif @type == :war
      if @player1.deck.cards[2] == nil
        @player2
      elsif @player2.deck.cards[2] == nil
        @player1
      elsif @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      else
        @player2
      end
    elsif @type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
      @spoils_of_war
    elsif @type == :war
      @spoils_of_war = @player1.deck.cards.shift(3) + @player2.deck.cards.shift(3)
    elsif @type == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    winner.deck.cards.push(*@spoils_of_war)
    @spoils_of_war =[]
  end
end
