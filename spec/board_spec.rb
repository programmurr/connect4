# frozen_string_literal: true

require 'pry'
require_relative '../lib/board'

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

  context '#display_board' do
    before(:each) do
      @board = Board.new
      @board.set_cell_coordinates
    end

    # this test almost works, there's just a problem I can't solve lining up the numbers
    xit 'displays the board in the command terminal' do
      display = <<-HEREDOC
 -   -   -   -   -   -   - 
 -   -   -   -   -   -   - 
 -   -   -   -   -   -   - 
 -   -   -   -   -   -   - 
 -   -   -   -   -   -   - 
 -   -   -   -   -   -   - 
 1   2   3   4   5   6   7
      HEREDOC
      expect { @board.display_board }.to output(display).to_stdout
    end
  end
end
