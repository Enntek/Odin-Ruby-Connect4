# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'gameboard'
require_relative 'cell'
require_relative 'display'



# There are 2 players in Connect Four
class Player
  def initialize(name, color = 'red')
    @name = name
    @color = color
  end
end
