# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'

game = ConnectFour.new
game.play_game

"NOTES

Change state from ' ' to something meaningful

We need to test what, not how.

Remember to write integration tests at the end.
Check for win and draw from beginning of game.

You must write edge cases for all of your tests.

Other testing tools to use:
allow_any_instance_of
expect_any_instance_of
receive_message_chain(:method1, :method2, :method3).and_return('some_characters')
instance_variable_get
instance_variable_set

Change 'color' to X and O

Or try to use these: ⚫ ⚪

When testing error messages, use literal, not method.
"
