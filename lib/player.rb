# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'

# There are 2 players in Connect Four
class Player
  include Display
  include ValidInput
  attr_reader :name, :color

  def initialize(name, color = nil)
    @name = name
    @color = color
  end

  def establish_color
    choices = %w[r b]
    valid_input = validate_input(choices)
    picked_color = valid_input == 'r' ? 'red' : 'blue'
    @color = picked_color
  end

  def takes_other_color(taken_color)
    remaining_color = taken_color == 'red' ? 'blue' : 'red'
    @color = remaining_color
  end
end
