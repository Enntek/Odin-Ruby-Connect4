# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'

game = ConnectFour.new
game.play_game

"
Change state from ' ' to something meaningful

We need to test what, not how.

Remember to write integration tests at the end.
Check for win and draw from beginning of game.

You must write edge cases for all of your tests.

Split #match_pattern_array into 2 methods.
"
