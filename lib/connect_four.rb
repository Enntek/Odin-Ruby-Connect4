# frozen_string_literal: true

require_relative 'display'

# This class contains the game logic for Connect Four
class ConnectFour
  include Display
  include ValidInput

  attr_reader :player1, :player2, :current_player, :gameboard, :game_over, :latest_cell

  def initialize(gameboard = nil, player1 = nil, player2 = nil)
    @gameboard = gameboard || GameBoard.new
    @player1 = player1 || Player.new('Player One')
    @player2 = player2 || Player.new('Player Two')
    @current_player = @player1
    @game_over = false
  end

  def play_game
    greeting
    choose_color
    draw_board
    turn_loop until game_over?
    play_again
  end

  def choose_color
    choose_color_message
    player1.establish_color
    player2.takes_other_color(player1.color)
  end

  def turn_loop
    execute_turn
    draw_board
    check_draw
    check_win
    switch_current_player
  end

  def execute_turn(col_number = 0)
    loop do
      col_number = input_column_number
      break unless gameboard.column_full?(col_number)
    end
    move_piece(col_number)
  end

  def move_piece(col_number)
    free_cell = gameboard.locate_free_cell(col_number)
    gameboard.take_cell(free_cell, current_player.color)
    @latest_cell = free_cell
  end

  def input_column_number
    select_column_message(current_player)
    allowable_chars = (1..7).to_a
    valid_column_number = validate_input(allowable_chars).to_i - 1
  end

  def check_draw
    result = gameboard.board_full?
    game_draw_message if result
    end_game if result
  end

  def check_win
    result = gameboard.any_connect_four?(latest_cell)
    win_message(current_player) if result == true
    end_game if result == true
  end

  def end_game
    @game_over = true
  end

  def game_over?
    @game_over ? true : false
  end

  def switch_current_player
    @current_player = @current_player == player1 ? player2 : player1
  end

  def play_again
    play_again_message
    allowable_chars = %w[y n]
    valid_response = validate_input(allowable_chars)
    initialize if valid_response == 'y'
    play_game if valid_response == 'y'
    good_bye_message if valid_response == 'n'
  end
end
