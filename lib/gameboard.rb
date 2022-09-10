# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'
require_relative 'cell'
require_relative 'display'


# A Connect Four board has 42 cells (6 high, 7 across)
class GameBoard
  attr_reader :cells

  def initialize
    @cells = create_cells
  end

  def create_cells
    all_cells = Array.new(42)
    all_cells.map.with_index do |item, index|
      Cell.new(index)
    end
  end
end

# gameboard = GameBoard.new


###

# class GameBoard
#   extend Forwardable
#   include Enumerable
#   def_delegators :@cells, :size, :each

#   attr_reader :cells

#   def initialize
#     @cells = create_cells
#   end

#   Cell = Struct.new(:number, :state) do
#     def to_s
#       "#{state}"
#     end
#   end

#   def create_cells(all_cells = Array.new(9))
#     all_cells.map.with_index do |element, index|
#       Cell.new(index, ' ')
#     end
#   end

#   def change_cell_state(valid_number, player_side)
#     cells[valid_number].state = player_side
#   end
# end
