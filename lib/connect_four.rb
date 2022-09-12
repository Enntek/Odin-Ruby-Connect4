# frozen_string_literal: true

# require_relative 'player'
# require_relative 'gameboard'
# require_relative 'cell'
require_relative 'display'

# This class contains the game logic for Connect Four
class ConnectFour
  include Display
  include ValidInput

  attr_reader :player1, :player2, :current_player, :gameboard

  # def initialize(gameboard = GameBoard, player = Player)
  #   @gameboard = gameboard.new
  #   @player1 = player.new('Player One')
  #   @player2 = player.new('Player Two')
  #   @current_player = player1
  # end

  def initialize(gameboard = nil, p1 = nil, p2 = nil)
    @gameboard = gameboard || GameBoard.new
    @player1 = p1 || Player.new('Player One')
    @player2 = p2 || Player.new('Player Two')
  end

  def play_game
    greeting
    choose_color
    # turn_loop
    draw_board
    turn_loop until game_over?
  end

  def choose_color
    choose_color_message
    player1.establish_color
    player2.takes_other_color(player1.color)
  end

  def turn_loop
    execute_turn
    draw_board
    # check_draw
    # check_win
    switch_current_player
  end

  def switch_current_player
    @current_player = @current_player == player1 ? player2 : player1
  end

  def execute_turn(col_number = 0)
    loop do
      col_number = input_column_number
      break if gameboard.free_cell?(col_number)
    end

    move_piece(col_number)
  end
  
  def move_piece(col_number)
    # What does move_piece do?
    # It takes a column number
    gameboard.take_cell(col_number, current_player.color)
  end

  def input_column_number
    select_column_message
    allowable_input = (1..7).to_a
    valid_column_number = validate_input(allowable_input).to_i - 1
  end

  def game_over? 
  end

  def greeting
    puts 'Welcome to Connect Four!'
  end
end
