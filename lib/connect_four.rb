# frozen_string_literal: true

require_relative 'player'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'

# board is 6 high and 7 wide
# play until winner, or board is full

# This class contains the game logic for Connect Four
class ConnectFour
  include Display
  attr_reader :player1, :player2

  def initialize
    # what should we put in here?
    @gameboard = GameBoard.new
    @player1 = Player.new('Player One')
    @player2 = Player.new('Player Two')
  end

  def play_game
    greeting
    choose_color
    # turn_loop until game_over?
  end

  def choose_color
    choose_color_message
    player1.establish_color
  end

  def turn_loop

  end

  def game_over?

  end

  def greeting
    puts 'Welcome to Connect Four!'
  end
end
