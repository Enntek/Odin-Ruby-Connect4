require './lib/connect_four'

describe ConnectFour do
  let(:game) { described_class.new }

  describe '#initialize' do
    # initialize -> No test necessary when only creating instance variables.
  end

  describe 'play_game' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end
  
  describe 'a #test_method' do
    it 'returns 42' do
      expect(game.test_method).to eq(42)
    end
  end
end
