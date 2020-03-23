require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"

start = gets.chomp

if start == "GO"
  Game.new.start
else
  p "You did not type 'GO'. Please try again."
end
