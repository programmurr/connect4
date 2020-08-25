# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'piece'
require_relative 'cell'

class Game
  attr_accessor :board, :player1, :player2, :active_player

  def initialize(board: Board.new, player1: Player.new(1), player2: Player.new(2))
    @board = board
    @player1 = player1
    @player2 = player2
    @active_player = nil
  end

  def put_piece_in_row(row_num, piece); end

  def set_cell_coordinates
    x = 0
    while x < 6
      y = 0
      while y < 7
        board.grid[x][y].co_ord = [x + 1, y + 1]
        y += 1
      end
      x += 1
    end
  end
end
