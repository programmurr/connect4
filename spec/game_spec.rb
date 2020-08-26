# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  context '#initialize' do
    it 'generates a board on creation' do
      game = Game.new
      expect(game.board).to be_instance_of(Board)
    end

    it 'generates a player1 on creation' do
      game = Game.new
      expect(game.player1.name).to eq 'Player1'
    end

    it 'generates a player2 on creation' do
      game = Game.new
      expect(game.player2.name).to eq 'Player2'
    end

    it 'has an active player attribute initialized to nil' do
      game = Game.new
      expect(game.active_player).to eq nil
    end
  end

  context '#put_piece_in_row' do
    before(:each) do
      @game = Game.new
      @game.board.set_cell_coordinates
      @game.player1.assign_white_piece
      @game.player2.assign_black_piece
    end

    it 'can put a player piece to the bottom of the selected row if the row is empty' do
      @game.put_piece_in_column(1, @game.player1.piece)
      expect(@game.board.grid[5][0].value).to be_instance_of(WhitePiece)
    end

    it 'can put a player piece on top of a piece already in the row' do
      @game.put_piece_in_column(1, @game.player1.piece)
      @game.put_piece_in_column(1, @game.player2.piece)
      binding.pry
      expect(@game.board.grid[4][0].value).to be_instance_of(BlackPiece)
    end

    it 'does not place a piece and outputs a message if the column is full' do
      @game.put_piece_in_column(2, @game.player1.piece)
      @game.put_piece_in_column(2, @game.player2.piece)
      @game.put_piece_in_column(2, @game.player1.piece)
      @game.put_piece_in_column(2, @game.player2.piece)
      @game.put_piece_in_column(2, @game.player1.piece)
      @game.put_piece_in_column(2, @game.player2.piece)
      @game.put_piece_in_column(2, @game.player1.piece)
      expect { @game.put_piece_in_column(2, @game.player2.piece) }.to output("The column is full!\n").to_stdout
    end
  end

  context '#calculate_winning_patterns' do
    xit 'can calculate all of the winning pattens from one piece placed on the board' do
    end
  end
end
