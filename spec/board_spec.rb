# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/game'

describe Board do
  context '#initialize' do
    it 'creates a 6x7 grid with values set as instances of the Cell object' do
      array = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil]
      ]
      board = Board.new(grid: array)
      expect(board.grid).to eq array
    end

    it 'can set each array element to be an instance of the Cell object class by default' do
      board = Board.new
      board.grid.each do |row|
        row.each do |cell|
          expect(cell).to be_instance_of(Cell)
        end
      end
    end
  end

  context '#set_cell_coordinates' do
    before(:each) do
      @board = Board.new
      @board.set_cell_coordinates
    end

    it 'assigns a coordinate to each cell on the board' do
      @board.grid.each do |row| # Law of Demeter? Look up refactoring pattern
        row.each do |cell|
          expect(cell.co_ord).to be_instance_of(Array)
        end
      end
    end
  end

  context '#get_column' do
    it 'can return the specified column' do
      @board = Board.new
      @board.set_cell_coordinates
      expect(@board.get_column(1).length).to eq 6
    end

    it 'returns a column with cells as the elements' do
      @board = Board.new
      @board.set_cell_coordinates
      expect(@board.get_column(1)[0]).to be_instance_of(Cell)
    end
  end

  context '#row_full?' do
    it 'returns true if the row is full of pieces' do
      game = Game.new
      game.board.set_cell_coordinates
      game.player1.assign_yellow_piece
      game.player2.assign_red_piece
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(2, game.player2)
      expect(game.board.column_full?(game.board.get_column(2))).to eq true
    end
  end

  context '#full?' do
    it 'returns true if the board is full of pieces' do
      game = Game.new
      game.board.set_cell_coordinates
      game.player1.assign_yellow_piece
      game.player2.assign_red_piece
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(1, game.player2)
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(1, game.player2)
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(1, game.player2)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(3, game.player1)
      game.put_piece_in_column(3, game.player2)
      game.put_piece_in_column(3, game.player1)
      game.put_piece_in_column(3, game.player2)
      game.put_piece_in_column(3, game.player1)
      game.put_piece_in_column(3, game.player2)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(5, game.player2)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(5, game.player2)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(5, game.player2)
      game.put_piece_in_column(6, game.player2)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(6, game.player2)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(6, game.player2)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(7, game.player2)
      game.put_piece_in_column(7, game.player1)
      game.put_piece_in_column(7, game.player2)
      game.put_piece_in_column(7, game.player1)
      game.put_piece_in_column(7, game.player2)
      game.put_piece_in_column(7, game.player1)
      expect(game.board.full?).to eq true
    end

    it 'returns false if the board is not full of pieces' do
      game = Game.new
      game.board.set_cell_coordinates
      game.player1.assign_yellow_piece
      game.player2.assign_red_piece
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(1, game.player2)
      game.put_piece_in_column(3, game.player1)
      game.put_piece_in_column(4, game.player2)
      expect(game.board.full?).to eq false
    end
  end
end
