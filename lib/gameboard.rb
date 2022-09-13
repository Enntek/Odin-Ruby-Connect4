# frozen_string_literal: true

require_relative 'display'

# A Connect Four board has 42 cells (6 high, 7 across)
class GameBoard
  include Display

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

  def columns
    [[0, 7, 14, 21, 28, 35],
     [1, 8, 15, 22, 29, 36],
     [2, 9, 16, 23, 30, 37],
     [3, 10, 17, 24, 31, 38],
     [4, 11, 18, 25, 32, 39],
     [5, 12, 19, 26, 33, 40],
     [6, 13, 20, 27, 34, 41]]
  end

  def retrieve_column(col_number = 1)
    columns[col_number].map do |number|
      cells[number]
    end
  end

  def column_full?(col_number)
    column_array = retrieve_column(col_number)
    result = totally_occupied?(column_array)
    column_full_message if result
    result
  end

  def board_full?
    cells_array = cells
    result = totally_occupied?(cells_array)
  end

  def totally_occupied?(cells_array)
    free = ' '
    cells_array.none? { |cell| cell.state == free }
  end

  def locate_free_cell(col_number)
    column = retrieve_column(col_number)
    column.find { |cell| cell.state == ' ' } # .find matches 1 item only
  end

  def take_cell(color)
    free_cell.change_state(color)
  end
end

