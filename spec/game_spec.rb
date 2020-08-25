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

  context '#set_cell_coordinates' do
    before(:each) do
      @game = Game.new
      @game.set_cell_coordinates
    end

    it 'assigns a coordinate to each cell on the board' do
      @game.board.grid.each do |row| # Law of Demeter? Look up refactoring pattern
        row.each do |cell|
          expect(cell.co_ord).to be_instance_of(Array)
        end
      end
    end
  end

  context '#put_piece_in_row' do
    before(:each) do
      @game = Game.new
      @game.set_cell_coordinates
      @game.player1.assign_white_piece
    end

    it 'can put a player piece to the bottom of the selected row if the row is empty' do
      @game.put_piece_in_row(1, @game.player1.piece)
      expect(@game.board.grid[0][0].value).to eq 'white'
    end

    xit 'can put a player piece on top of a piece already in the row' do
      @game.put_piece_in_row(1, @game.player1.piece)
      expect(@game.board.grid[0][1].value).to eq 'white'
    end
  end
end
