# frozen_string_literal: true

require_relative '../lib/player'

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

  context '#assign_white_piece' do
    it 'can assign the white piece object to the piece of the player' do
      @player2.assign_white_piece
      expect(@player2.piece).to be_instance_of(WhitePiece)
    end
  end

  context '#assign_black_piece' do
    it 'can assign the black piece object to the piece of the player' do
      @player1.assign_black_piece
      expect(@player1.piece).to be_instance_of(BlackPiece)
    end
  end
end
