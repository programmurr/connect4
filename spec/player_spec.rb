# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/game'

describe Player do
  before(:each) do
    @player1 = Player.new(1)
    @player2 = Player.new(2)
  end
  # @player1 and @player2 will be used randomly between tests

  context '#initialize' do
    it 'creates the first player with default name of Player1' do
      expect(@player1.name).to eq 'Player1'
    end

    it 'creates the second player with default name of Player2' do
      expect(@player2.name).to eq 'Player2'
    end

    it 'creates a piece for the player with default value set to nil' do
      expect(@player1.piece).to eq nil
    end
  end

  context '#assign_yellow_piece' do
    it 'can assign the yellow piece object to the piece of the player' do
      @player2.assign_yellow_piece
      expect(@player2.piece).to be_instance_of(YellowPiece)
    end
  end

  context '#assign_red_piece' do
    it 'can assign the red piece object to the piece of the player' do
      @player1.assign_red_piece
      expect(@player1.piece).to be_instance_of(RedPiece)
    end
  end

  context '#change_name' do
    before do
      $stdin = StringIO.new("Steve\n")
    end

    after do
      $stdin = STDIN
    end

    it 'lets player1 change their name' do
      expect { @player1.change_name }.to change(@player1, :name).from('Player1').to('Steve')
    end

    it 'lets player2 change their name' do
      expect { @player2.change_name }.to change(@player2, :name).from('Player2').to('Steve')
    end
  end
end
