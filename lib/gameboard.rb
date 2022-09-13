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

  # returns column array given col_number
  def find_column(col_number = 1)
    columns[col_number].map do |number|
      cells[number]
    end
  end

  # returns #rows or #columnn (type)
  def retrieve_line(latest_cell, type)
    number = latest_cell.number
    send(type).find { |subarray| subarray.include?(number) }
  end

  # returns column array given cell
  # def retrieve_column(latest_cell)
  #   number = latest_cell.number
  #   columns.find { |subarray| subarray.include?(number)}
  # end

    # def retrieve_row(latest_cell)
  #   number = latest_cell.number
  #   rows.find { |subarray| subarray.include?(number)}
  # end

  def rows
    [[0, 1, 2, 3, 4, 5, 6],
     [7, 8, 9, 10, 11, 12, 13],
     [14, 15, 16, 17, 18, 19, 20],
     [21, 22, 23, 24, 25, 26, 27],
     [28, 29, 30, 31, 32, 33, 34],
     [35, 36, 37, 38, 39, 40, 41]]
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

  def any_4_in_a_row?(latest_cell)
    # check_row(latest_cell)
    check_column(latest_cell)

    row_offset = 1
    column_offset = 7

    # check_4_consecutive(row)
    # check_4_consecutive(column)

  end

  def check_4_consecutive

  end

  def check_row(latest_cell)
    offset = 1
    reverse_offset = offset * -1
    # row = retrieve_row(latest_cell)
    row = retrieve_line(latest_cell, 'rows')
    last_num = latest_cell.number
    last_color = latest_cell.state
    counter = 1
    tally1 = check_cell_array(row, last_num, last_color, offset) || 0
    tally2 = check_cell_array(row, last_num, last_color, reverse_offset) || 0
    counter += tally1 + tally2
    puts "That's Connect Four!" if counter == 4
    puts ['counter', counter]
  end

  def check_column(latest_cell)
    offset = 7
    reverse_offset = offset * -1
    column = retrieve_line(latest_cell, 'columns')
    # column = retrieve_column(latest_cell)
    last_num = latest_cell.number
    last_color = latest_cell.state
    counter = 1
    tally1 = check_cell_array(column, last_num, last_color, offset) || 0
    tally2 = check_cell_array(column, last_num, last_color, reverse_offset) || 0
    counter += tally1 + tally2
    puts "That's Connect Four!" if counter == 4
    puts ['counter', counter]
  end

  def check_cell_array(cell_array, last_num, last_color, offset)
    next_num = last_num
    counter = 0

    loop do
      puts 'entered loop-start'
      # next_num += offset if row.include?(next_num + offset)
      next_num = cell_array.include?(next_num + offset) ? (next_num + offset) : nil
      break if next_num.nil?

      # puts 'entered loop-mid'
      if cells[next_num].state == last_color
        # puts 'entered loop-deep'
        counter += 1
      else
        break
      end
    end
    counter
  end
end
