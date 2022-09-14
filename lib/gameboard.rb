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

  

  # returns column array given col_number
  def find_column(col_number = 1)
    columns[col_number].map do |number|
      cells[number]
    end
  end

  # returns #rows or #columnns (in type)
  def retrieve_line(latest_cell, type)
    puts ['type', type]

    number = latest_cell.number
    send(type).find { |subarray| subarray.include?(number) } unless type == 'diagonal1' || type =='diagonal2'
    build_diagonal(number, type) unless type == 'rows' || type == 'columns'
  end

  def build_diagonal(number, type)
    puts 'HELLO WORLD'
    offset = type == 'diagonal1' ? 9 : 7
    array = [number]
    array << (number -= 9) until number < 0
    array << (number += 9) until number >= 41
    array.uniq!.select!{ |num| num >= 0 && num <= 41 }.sort!
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
    types = ['rows', 'columns']
    # types = ['rows', 'columns', 'diagonal1', 'diagonal2']
    last_color = latest_cell.state

    types.each do |type|
      line_array = retrieve_line(latest_cell, type)
      make_cell_array(line_array, last_color)
    end
  end

  def make_cell_array(line_array, last_color)
    arr_with_colors = line_array.map do |cell_number|
      cells[cell_number].state
    end

    case arr_with_colors
    in [*, ^last_color, ^last_color, ^last_color, ^last_color, *]
      puts 'You win!'
      return true
    else
    end
  end
end
