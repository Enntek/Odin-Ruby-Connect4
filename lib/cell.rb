# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'
require_relative 'gameboard'
require_relative 'display'


# A Connect Four board has 42 cells (6 high, 7 across)
class Cell
  def initialize(number, state = 'unoccupied')
    @number = number
    @state = state
  end
end
