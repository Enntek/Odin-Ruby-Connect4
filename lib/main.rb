# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'

game = ConnectFour.new
game.play_game

# require 'pry-byebug'
# binding.pry

# gameboard = GameBoard.new
# gameboard.free_cell?(1)

# Where should we inject? main, init args, init body?
# TDD - test first development
# Keep methods SRP, keep classes SRP

"

We have column1, which is an array of numbers.
We want to know if there are any @cells that are free.
We need to use our column1 array to find the first free cell.


Change state from ' ' to something meaningful

We need to test what, not how.
"

