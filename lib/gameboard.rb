# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'
require_relative 'cell'
require_relative 'display'


# A Connect Four board has 42 cells (6 high, 7 across)
class GameBoard
  attr_reader :cells

  COLUMN_1 = [0, 7, 14, 21, 28, 35].freeze
  COLUMN_2 = [1, 8, 15, 22, 29, 36].freeze
  COLUMN_3 = [2, 9, 16, 23, 30, 37].freeze
  COLUMN_4 = [3, 10, 17, 24, 31, 38].freeze
  COLUMN_5 = [4, 11, 18, 25, 32, 39].freeze
  COLUMN_6 = [5, 12, 19, 26, 33, 40].freeze
  COLUMN_7 = [6, 13, 20, 27, 34, 41].freeze

  def initialize
    @cells = create_cells
  end

  def create_cells
    all_cells = Array.new(42)
    all_cells.map.with_index do |item, index|
      Cell.new(index)
    end
  end

  def has_free_cells?(column)

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
