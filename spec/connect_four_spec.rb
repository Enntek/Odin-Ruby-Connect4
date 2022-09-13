require './lib/connect_four'
require './lib/player'
require './lib/gameboard'
require './lib/cell'

describe ConnectFour do
  # Usually we don't test #initialize, this is for practice
  describe '#initialize' do
    context 'when we want to use class_double' do
      let(:game) { described_class.new }

      it 'creates an instance of GameBoard' do
        gameboard = class_double('GameBoard').as_stubbed_const
  
        expect(gameboard).to receive(:new).once
        ConnectFour.new
      end
  
      it 'creates two instances of Player' do
        player = class_double('Player').as_stubbed_const
  
        expect(player).to receive(:new).twice
        ConnectFour.new
      end
    end

    context 'when we want to use an instance_double of GameBoard' do
      let(:gameboard) { instance_double(GameBoard) }
      let(:p1) { instance_double(Player) }
      let(:p2) { instance_double(Player) }

      it 'receives #columns' do
        game_init = described_class.new(gameboard, p1, p2)
        # expect_any_instance_of(GameBoard).to receive(:columns)
        expect(game_init.gameboard).to receive(:columns)
        game_init.gameboard.columns
      end
    end

    context 'when we want to use an instance_double of Player' do
      let(:gameboard) { instance_double(GameBoard) }
      let(:p1) { instance_double(Player) }
      let(:p2) { instance_double(Player) }

      it 'receives #establish_color' do
        game_init = described_class.new(gameboard, p1, p2)
        expect(game_init.player1).to receive(:establish_color)
        game_init.player1.establish_color
      end
    end
  end

  describe '#play_game' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end

  describe '#choose_color' do
    let(:game) { described_class.new }

    it 'sends #establish_color to player1' do
      allow(game).to receive(:puts)
      expect(game.player1).to receive(:establish_color)
      game.choose_color
    end
  end

  describe '#turn_loop' do
    # this may be a public 'script' method, it only calls other methods,
    # those individual methods will be tested but perhaps this one shouldn't.
  end

  describe '#input_column_number' do
    context 'when user input is a valid column number' do
      let(:game) { described_class.new }

      it 'returns column number - 1' do
        valid_column_number = '1'
        allow(game).to receive(:puts)
        allow(game).to receive(:gets).and_return(valid_column_number)

        expect(game.input_column_number).to eq(0)
      end
    end

    context 'when user inputs an invalid column number, then a valid one' do
      let(:game) { described_class.new }

      it 'returns a column number and one error message' do
        invalid_input = 'g'
        valid_input = '3'
        allow(game).to receive(:puts)
        allow(game).to receive(:gets).and_return(invalid_input, valid_input)

        expect(game).to receive(:invalid_input_message).exactly(1).time
        game.input_column_number
      end
    end
  end

  describe '#execute_turn' do
    let(:gameboard) { instance_double(GameBoard) }
    let(:game) { described_class.new(gameboard) }

    context 'when input is valid' do
      it 'completes loop' do
        allow(game).to receive(:gets).and_return('1')
        allow(game.gameboard).to receive(:column_full?).and_return(false)
        allow(game).to receive(:puts)
        expect(game).to receive(:move_piece)
        game.execute_turn
      end

      it 'completes loop and calls #move_piece' do
        good_input = '4'
        allow(game).to receive(:gets).and_return(good_input)
        allow(game).to receive(:puts)
        allow(game.gameboard).to receive(:column_full?).and_return(false)

        expect(game).to receive(:move_piece)
        game.execute_turn
      end
    end

    context 'when input is invalid first, then valid' do
      it 'completes loop after receiving 1 error message' do
        bad_input = 'z'
        good_input = '4'
        allow(game).to receive(:gets).and_return(bad_input, good_input)
        allow(game).to receive(:puts)
        allow(game.gameboard).to receive(:column_full?).and_return(false)
        allow(game).to receive(:move_piece)

        expect(game).to receive(:invalid_input_message).once
        game.execute_turn
      end
    end

    context 'when input is invalid first, then valid' do
      it 'completes loop after receiving 2 error messages' do
        bad_input = 'z'
        good_input = '4'
        allow(game).to receive(:gets).and_return(bad_input, bad_input, good_input)
        allow(game).to receive(:puts)
        allow(game.gameboard).to receive(:column_full?).and_return(false)
        allow(game).to receive(:move_piece)
  
        expect(game).to receive(:invalid_input_message).twice
        game.execute_turn
      end
    end

    describe '#move_piece' do
      let(:gameboard) { instance_double(GameBoard) }
      let(:game) { described_class.new(gameboard) }
      
      it 'calls locate_free_cell to find the free cell in a given column' do
        col_number = 1
        allow(gameboard).to receive(:take_cell)
        expect(gameboard).to receive(:locate_free_cell)
        game.move_piece(col_number)
      end

      it 'calls take_cell' do
        col_number = 1
        allow(gameboard).to receive(:locate_free_cell)
        expect(gameboard).to receive(:take_cell)
        game.move_piece(col_number)
      end
    end
  end

  describe '#switch_current_player' do
    let(:game_switch) { described_class.new }

    it 'changes current_player to the other player' do
      expect { game_switch.switch_current_player }.to change(game_switch, :current_player)
    end
  end

  describe '#check_draw' do
    let(:gameboard) { instance_double(GameBoard) }
    let(:game) { described_class.new(gameboard) }

    it 'sends #board_full? to gameboard' do
      expect(gameboard).to receive(:board_full?)
      game.check_draw
    end
  end

  describe '#end_game' do
    let(:game) { described_class.new }

    it 'sets @game_over to true' do
      expect { game.end_game }.to change(game, :game_over).from(false).to(true)
    end
  end

  describe '#game_over?' do
    # This is a simple true false conditional, it shouldn't be tested.
  end

  describe '#check_win' do
    let(:gameboard) { instance_double(GameBoard) }
    let(:game) { described_class.new(gameboard) }
    let(:cell) { instance_double(Cell)}

    it 'sends a message to gameboard.any_4_in_a_row?' do
      last_move = cell
      expect(gameboard).to receive(:any_4_in_a_row?)
      game.check_win
    end
  end
end

describe Player do
  describe '#validate_input (in module Display)' do
    let(:player) { described_class.new('Player One') }

    it 'returns "r" when input is "r"' do
      choices = %w[r b]
      allow(player).to receive(:gets).and_return('r')

      input = player.validate_input(choices)
      expect(input).to eq('r')
    end

    context 'when first input is bad, and second is good' do
      it 'completes loop and receives error message once' do
        choices = %w[r b]
        allow(player).to receive(:gets).and_return('3', 'b')

        expect(player).to receive(:invalid_input_message).once
        player.validate_input(choices)
      end
    end
  end

  describe '#establish_color' do
    let(:player) { described_class.new('Player One') }

    context 'when input is valid' do
      it 'sets player1 color to red when input is r' do
        allow(player).to receive(:gets).and_return('r')
        expect { player.establish_color }.to change(player, :color).from(nil).to('r')
      end

      it 'sets player1 color to blue when input is b' do
        allow(player).to receive(:gets).and_return('b')
        expect { player.establish_color }.to change(player, :color).from(nil).to('b')
      end
    end
  end

  describe '#takes_other_color' do
    let(:player2) { described_class.new('Player Two') }

    it 'sets player2 as blue when player1 is red' do
      taken_color = 'r'
      player2.takes_other_color(taken_color)

      expect(player2.color).to eq('b')
    end

    it 'sets player2 as red when player1 is blue' do
      taken_color = 'b'
      player2.takes_other_color(taken_color)

      expect(player2.color).to eq('r')
    end
  end
end

describe GameBoard do
  let(:gameboard) { described_class.new }

  describe '#create_cells' do
    it 'returns an array' do
      expect(gameboard.create_cells).to be_kind_of(Array)
    end
  end

  describe '#column_of_cells' do
    it 'returns an array of Cell objects' do
      array = gameboard.retrieve_column
      expect(array).to be_kind_of(Array)
    end
  end

  describe '#column_full?' do
    context 'when given column has at least one free cell' do
      let(:cell) { instance_double(Cell, state: ' ') }

      before do
        array_with_one_cell = [cell]
        allow(gameboard).to receive(:puts)
        allow(gameboard).to receive(:retrieve_column).and_return(array_with_one_cell)
      end

      it 'returns nil' do
        col_number = 1
        return_value = gameboard.column_full?(col_number)
        expect(return_value).to be false
      end
    end

    context 'when given column has no free cells (is full)' do
      let(:cell) { instance_double(Cell, state: 'r') }

      before do
        array_with_one_cell = [cell]
        allow(gameboard).to receive(:retrieve_column).and_return(array_with_one_cell)
      end

      it 'returns true' do
        col_number = 1
        allow(gameboard).to receive(:puts)
        return_value = gameboard.column_full?(col_number)
        expect(return_value).to be true
      end

      it 'receives 1 error message' do
        col_number = 1
        expect(gameboard).to receive(:column_full_message).exactly(1).time
        gameboard.column_full?(col_number)
      end
    end
  end


  describe '#totally_occupied?' do
    context 'when array contains at least 1 free cell' do
      let(:cell) { instance_double(Cell, state: ' ') }

      it 'returns false' do
        array_of_cells = [cell, cell, cell]

        result = gameboard.totally_occupied?(array_of_cells)
        expect(result).to eq(false)
      end
    end

    context 'when all cells in array are occupied' do
      let(:cell) { instance_double(Cell, state: 'r') }

      it 'returns false if array has at least 1 free cell' do
        array_of_cells = [cell, cell, cell]

        result = gameboard.totally_occupied?(array_of_cells)
        expect(result).to eq(true)
      end
    end
  end

  describe '#board_full?' do
    context 'when board is not full' do
      let(:gameboard) { described_class.new }

      it 'returns false' do
        allow(gameboard).to receive(:totally_occupied?).and_return(false)
        expect(gameboard.board_full?).to be(false)
      end
    end

    context 'when board is full' do
      let(:gameboard) { described_class.new }

      it 'returns true' do
        allow(gameboard).to receive(:totally_occupied?).and_return(true)
        expect(gameboard.board_full?).to be(true)
      end
    end
  end

  describe 'locate_free_cell' do
    let(:cell) { instance_double(Cell, state: ' ') }
    let(:gameboard) { described_class.new }


    it 'returns Cell object whose state is empty in given column' do
      col_number = 1
      array_of_cells = [cell, cell, cell]
      allow(gameboard).to receive(:retrieve_column).and_return(array_of_cells)

      result = gameboard.locate_free_cell(col_number)
      expect(result).to eq(cell)
    end
  end

  describe '#take_cell' do
    let(:cell) { instance_double(Cell) }
    let(:gameboard) { described_class.new }

    it 'calls change_state on a free cell' do
      color = 'b'
      expect(cell).to receive(:change_state).with(color)
      gameboard.take_cell(cell, color)
    end
  end

  describe '#any_4_in_a_row?' do
    it 'returns true if there are 4 consecutive colors' do

    end
  end

  describe check_row do
    context 'when there is a 4-in-a-row' do
      it 'returns true' do

      end
    end

    context 'when there is not a 4-in-a-row' do
      xit 'returns false' do
      end
    end
  end
end

describe Cell do
  let(:cell) { described_class.new(1) }

  describe '#change_state' do
    it "changes a Cell's state to given color" do
      color = 'r'
      expect { cell.change_state(color) }.to change(cell, :state).to('r')
    end
  end
end
