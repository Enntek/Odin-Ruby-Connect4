# frozen_string_literal: true
require_relative 'connect_four'
require_relative 'player'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'

game = ConnectFour.new
game.play_game

# Where should we inject? main, init args, init body?
# TDD - test first development
# Keep methods SRP, keep classes SRP
