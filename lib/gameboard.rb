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

  def rows
    [[0, 1, 2, 3, 4, 5, 6],
     [7, 8, 9, 10, 11, 12, 13],
     [14, 15, 16, 17, 18, 19, 20],
     [21, 22, 23, 24, 25, 26, 27],
     [28, 29, 30, 31, 32, 33, 34],
     [35, 36, 37, 38, 39, 40, 41]]
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

  def diagonals1
    [[35], 
     [28, 36], 
     [21, 29, 37],
     [14, 22, 30, 38],
     [7, 15, 23, 31, 39],
     [0, 8, 16, 24, 32, 40],
     [1, 9, 17, 25, 33, 41],
     [2, 10, 18, 26, 34],
     [3, 11, 19, 27],
     [4, 12, 20],
     [5, 13],
     [6]]
  end

  def diagonals2
    [[0],
     [1, 7],
     [2, 8, 14],
     [3, 9, 15, 21],
     [4, 10, 16, 22, 28],
     [5, 11, 17, 23, 29, 35],
     [6, 12, 18, 24, 30, 36],
     [13, 19, 25, 31, 37],
     [20, 26, 32, 38],
     [27, 33, 39],
     [34, 40],
     [41]]
  end

  # returns column array given col_number
  def find_column(col_number = 1)
    columns[col_number].map do |number|
      cells[number]
    end
  end

  def retrieve_line_type(latest_cell, type)
    number = latest_cell.number
    send(type).find { |subarray| subarray.include?(number) }
  end

  def column_full?(col_number)
    column_array = find_column(col_number)
    result = totally_occupied?(column_array)
    column_full_message if result
    result
  end

  def board_full?
    cells_array = cells
    result = totally_occupied?(cells_array)
  end

  # takes column or gameboard
  def totally_occupied?(cells_array)
    free = ' '
    cells_array.none? { |cell| cell.state == free }
  end

  def locate_free_cell(col_number)
    column_array = find_column(col_number)
    column_array.find { |cell| cell.state == ' ' } # .find matches 1 item only
  end

  def take_cell(cell, color)
    cell.change_state(color)
  end

  def any_connect_four?(latest_cell)
    types = ['rows', 'columns', 'diagonals1', 'diagonals2']
    last_color = latest_cell.state

    types.any? do |type|
      line_array = retrieve_line_type(latest_cell, type)
      colors_array = map_colors_to_array(line_array)
      match_pattern_array(colors_array, last_color) # true/nil return
    end
  end

  def map_colors_to_array(line_array)
    arr_with_colors = line_array.map do |cell_number|
      cells[cell_number].state
    end
  end

  def match_pattern_array(colors_array, last_color)
    case colors_array
    in [*, ^last_color, ^last_color, ^last_color, ^last_color, *]
      return true
    else
      nil
    end
  end
end
