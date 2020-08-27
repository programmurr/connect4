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
      @game.player1.assign_yellow_piece
      @game.player2.assign_red_piece
    end

    it 'can put a player piece to the bottom of the selected row if the row is empty' do
      @game.put_piece_in_column(1, @game.player1)
      expect(@game.board.grid[5][0].value).to be_instance_of(YellowPiece)
    end

    it 'can put a player piece on top of a piece already in the row' do
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(1, @game.player2)
      expect(@game.board.grid[4][0].value).to be_instance_of(RedPiece)
    end

    it 'does not place a piece and outputs a message if the column is full' do
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(2, @game.player1)
      expect { @game.put_piece_in_column(2, @game.player2) }.to output("The column is full!\n").to_stdout
    end
  end
end
