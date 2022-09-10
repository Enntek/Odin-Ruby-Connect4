require './lib/connect_four'
require './lib/player'
require './lib/gameboard'
require './lib/cell'

describe ConnectFour do
  let(:game) { described_class.new }

  describe '#initialize' do
    # initialize -> No test necessary when only creating instance variables.
  end

  describe 'play_game' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end
end

describe Player do

end

describe GameBoard do
  let(:gameboard) { described_class.new }
  describe '#create_cells' do
    before do
      # allow(all_cells).to receive(:map)
    end

    it 'returns an array' do
      expect(gameboard.create_cells).to be_kind_of(Array)
    end
  end
end

describe Cell do

end

