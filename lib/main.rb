# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'

game = ConnectFour.new
# game.gameboard.columns

# gameboard = GameBoard.new
# gameboard.free_cell?(1)

# Where should we inject? main, init args, init body?
# TDD - test first development
# Keep methods SRP, keep classes SRP

"
Check each cell from left to right.
Check horizontal wins ONLY to the RIGHT.
Check vertical wins going UP.
Check diagonal wins up-left and up-right.
We need to use a counter.

Change state from ' ' to something meaningful

We need to test what, not how.
"
