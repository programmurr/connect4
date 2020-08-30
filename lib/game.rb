# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'piece'
require_relative 'cell'
require_relative 'win_check'

# Will send messages to the other classes, triggering game logic checks
class Game
  include WinCheck
  attr_accessor :board, :player1, :player2, :active_player

  def initialize(board: Board.new, player1: Player.new(1), player2: Player.new(2))
    @board = board
    @player1 = player1
    @player2 = player2
    @active_player = nil
  end

  def winning_pattern_detected?
    return true if scan_diagonal_cells(active_player, board.grid) # WinCheck module method
    return true if scan_vertical_cells(active_player, board.grid) # WinCheck module method

    false
  end

  def put_piece_in_column(col_num, player)
    board.get_column(col_num).map do |cell|
      if cell.value.nil?
        cell.value = player.piece
        player.tag_piece(cell)
        break
      elsif board.column_full?(board.get_column(col_num)) == true
        puts 'The column is full!'
        break
      end
    end
  end
end
