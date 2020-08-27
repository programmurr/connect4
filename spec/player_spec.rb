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

  context '#calculate_winning_patterns' do
    before(:each) do
      @game = Game.new
      @game.board.set_cell_coordinates
      @game.player1.assign_yellow_piece
      @game.player2.assign_red_piece
    end

    it 'can calculate all of the winning pattens from one piece placed on the board' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(4, @game.player1)
      winning_coordinates = { [6, 4] => [[[5, 4], [4, 4], [3, 4]],
                                         [[5, 5], [4, 6], [3, 7]],
                                         [[6, 5], [6, 6], [6, 7]],
                                         [[6, 3], [6, 2], [6, 1]],
                                         [[5, 3], [4, 2], [3, 1]]] }
      expect(@game.active_player.winning_patterns(@game.board.grid)).to eq winning_coordinates
    end

    it 'can calculate all of the winning pattens if a rival piece is blocking another cell' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(5, @game.player2)
      winning_coordinates = { [6, 4] => [[[5, 4], [4, 4], [3, 4]],
                                         [[5, 5], [4, 6], [3, 7]],
                                         [[6, 3], [6, 2], [6, 1]],
                                         [[5, 3], [4, 2], [3, 1]]] }
      expect(@game.active_player.winning_patterns(@game.board.grid)).to eq winning_coordinates
    end
  end
end
