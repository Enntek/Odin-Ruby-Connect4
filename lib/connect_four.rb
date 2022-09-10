# frozen_string_literal: true

require_relative 'player'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'

# board is 6 high and 7 wide
# play until winner, or board is full

# This class contains the game logic for Connect Four
class ConnectFour

  def initialize
    # what should we put in here?
    @gameboard = GameBoard.new
    @player1 = Player.new('player1')
    @player2 = Player.new('player2')
  end

  def play_game
    greeting
    # init 2 players
    # init board -> use composition
    # init spaces
  end

  def greeting
    puts 'Welcome to Connect Four!'
  end

end
