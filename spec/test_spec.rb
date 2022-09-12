require './lib/connect_four'
require './lib/player'
require './lib/gameboard'
require './lib/cell'

describe ConnectFour do
  

  describe '#initialize' do
    # context 'when we want to use class_double' do
    #   it 'creates an instance of GameBoard' do
    #     gameboard = class_double('GameBoard').as_stubbed_const
  
    #     expect(gameboard).to receive(:new).once
    #     ConnectFour.new
    #   end
  
    #   it 'creates two instances of Player' do
    #     player = class_double('Player').as_stubbed_const
  
    #     expect(player).to receive(:new).twice
    #     ConnectFour.new
    #   end
    # end

    # When we initialize ConnectFour, we want to be able to 
    # initialize Gameboard, and use our own instance variable here
    # in testing, to represent that instance of GameBoard, to spy on it.

    # We want to see our stubbed instance_double receive :columns

    context 'when we want to use instance_double' do
      let(:gameboard) { instance_double(GameBoard) }
      let(:p1) { instance_double(Player) }
      let(:p2) { instance_double(Player) }
      # let(:game) { described_class.new(gameboard) }

      it 'creates an instance of GameBoard' do
        # p1 = instance_double('Player')
        # p2 = instance_double('Player')

        # expect_any_instance_of(GameBoard).to receive(:columns)
        expect(gameboard).to receive(:columns)
        # expect(game.gameboard).to receive(:columns)
        described_class.new(gameboard)
      end
  
      # xit 'creates two instances of Player' do
      #   player = class_double('Player').as_stubbed_const
  
      #   expect(player).to receive(:new).twice
      #   ConnectFour.new
      # end
    end
  end

end