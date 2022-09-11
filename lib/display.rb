# frozen_string_literal: true

# This module prints the game to the console
module Display
  
  def greeting
    puts 'Welcome to Connect Four!'
  end

  def choose_color_message
    puts "#{player1.name} choose a color: red(r) or blue(b)"
  end

  def invalid_input_message
    puts 'Invalid input, try again!'
  end
end

module ValidInput
  include Display

  def validate_input(allowable_input)
    user_input = ''
    #  = criteria.split('')
    loop do
      user_input = gets.chomp.downcase
      break if allowable_input.include?(user_input)

      invalid_input_message
    end

    user_input
  end
end
