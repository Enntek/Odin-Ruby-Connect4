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
  include ValidInput

  attr_reader :player1, :player2, :current_player

  def initialize
    # what should we put in here?
    @gameboard = GameBoard.new
    @player1 = Player.new('Player One')
    @player2 = Player.new('Player Two')
    @current_player = player1
  end

  def play_game
    greeting
    choose_color
    turn_loop
    # turn_loop until game_over?
  end

  def choose_color
    choose_color_message
    player1.establish_color
    player2.takes_other_color(player1.color)
  end

  def turn_loop
    draw_board
    move_piece
    # switch_current_player
    # check_draw
    # check_win
  end

  def move_piece
    loop do
      column = input_column_number
      break if gameboard.has_free_cells?(column)
    end

    # we need to write code to find what pieces are in the column
  end

  def input_column_number
    select_column_message
    allowable_input = (1..7).to_a
    valid_column_number = validate_input(allowable_input)
  end

  def game_over? 
  end

  def greeting
    puts 'Welcome to Connect Four!'
  end
end
