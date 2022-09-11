require './lib/connect_four'
require './lib/player'
require './lib/gameboard'
require './lib/cell'

describe ConnectFour do
  let(:game) { described_class.new }

  describe '#initialize' do
    # initialize -> No test necessary when only creating instance variables.
  end

  describe '#play_game' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end

  describe '#choose_color' do
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
      it 'returns a column number' do
        valid_column_number = '1'
        allow(game).to receive(:puts)
        allow(game).to receive(:gets).and_return(valid_column_number)

        expect(game.input_column_number).to eq('1')
      end
    end

    context 'when user inputs an invalid column number, then a valid one' do
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

  describe '#move_piece' do
    context 'when player is blue' do
      it "changes one cell's state to blue" do

      end
    end
  end

  describe '#free_cells?' do
    it 'returns true when column has free cells' do
    end

    xit 'returns false when column is full' do
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
        expect { player.establish_color }.to change(player, :color).from(nil).to('red')
      end

      it 'sets player1 color to blue when input is b' do
        allow(player).to receive(:gets).and_return('b')
        expect { player.establish_color }.to change(player, :color).from(nil).to('blue')
      end
    end

    # context 'when player1 picks blue, player2 is red automatically' do
    # end
  end

  describe '#takes_other_color' do
    let(:player2) { described_class.new('Player Two') }

    it 'sets player2 as blue when player1 is red' do
      taken_color = 'red'
      player2.takes_other_color(taken_color)

      expect(player2.color).to eq('blue')
    end

    it 'sets player2 as red when player1 is blue' do
      taken_color = 'blue'
      player2.takes_other_color(taken_color)

      expect(player2.color).to eq('red')
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

  describe '#has_free_cells?' do
    context 'when given column has at least one free cell' do
      it 'returns true' do
        column_number = 1
        gameboard.has_free_cells?(column_number)
      end
    end

    context 'when given column has no free cells' do
      xit 'returns false' do

      end
    end
  end
end

describe Cell do
  # Cell contains no other method besides initialize
end
