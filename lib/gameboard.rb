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

  def rows
    [[0, 1, 2, 3, 4, 5, 6],
     [7, 8, 9, 10, 11, 12, 13],
     [14, 15, 16, 17, 18, 19, 20],
     [21, 22, 23, 24, 25, 26, 27],
     [28, 29, 30, 31, 32, 33, 34],
     [35, 36, 37, 38, 39, 40, 41]]
  end

  def retrieve_row(latest_cell)
    number = latest_cell.number
    rows.find { |subarray| subarray.include?(number)}
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
    column_array = retrieve_column(col_number)
    column_array.find { |cell| cell.state == ' ' } # .find matches 1 item only
  end

  def take_cell(cell, color)
    cell.change_state(color)
  end

  def any_4_in_a_row?(latest_cell)
    # we have our last_move
    # we have cells
    # check row
    # check column
    # check both diagonals
  end

  def check_row(latest_cell)

    check_row_algo(row, last_color, )
  end

  def check_row_algo
    row = retrieve_row(latest_cell)
    last_num = latest_cell.number
    last_color = latest_cell.state
    next_num = last_num
    counter = 1

    # abstraction
    direction = -1
    direction = 1

    # call this inbetween
    next_num = last_num

    loop do
      puts 'entered loop-start'

      next_num += direction if row.include?(next_num + direction)
      break if next_num.nil?

      puts 'entered loop-mid'

      if cells[next_num].state == last_color

        puts 'entered loop-deep'

        counter += 1
        puts ['counter', counter]
        if counter == 4
          puts "That's four in a row!"
          break
        end
      else
        break
      end
    end
  end
end
