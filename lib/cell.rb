# frozen_string_literal: true

# A Connect Four board has 42 cells (6 high, 7 across)
class Cell
  attr_reader :state, :number

  def initialize(number, state = ' ')
    @number = number
    @state = state
  end

  def change_state(color)
    @state = color
  end

  def to_s
    state
  end
end
