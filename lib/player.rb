# frozen_string_literal: true

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
    picked_color = valid_input == 'r' ? 'r' : 'b'
    @color = picked_color
  end

  def takes_other_color(taken_color)
    remaining_color = taken_color == 'r' ? 'b' : 'r'
    @color = remaining_color
  end
end
