require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test

  def test_game_exists
    @game = Game.new

    assert_instance_of Game, @game
  end

  def test_create_cards_has_52_cards

    assert_equal 52, Game.new.create_cards.length
  end

  def test_shuffle_cards
    @cards = Game.new

    assert @cards != Game.new.shuffle_cards
  end

  def test_assign_cards_to_decks_creates_decks

    assert_instance_of  Deck, Game.new.assign_cards_to_decks
  end

  def test_assign_cards_to_players

    assert_instance_of Player, Game.new.assign_decks_to_players
  end

  def skip test_start

  end


end
