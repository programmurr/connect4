# frozen_string_literal: true

require_relative 'piece'
require_relative 'win_positions'
require_relative 'board'
require_relative 'cell'

class Player
  include WinPositions # Comes into play in calculate_win_positions

  attr_accessor :name, :piece, :win_combos, :placement

  def initialize(num)
    @name = "Player#{num}"
    @piece = nil
    @win_combos = {}
    @placement = {}
  end

  def tag_piece(cell)
    placement[placement.length + 1] = cell
  end

  def winning_patterns(grid)
    current_positions = []
    placement.each_value { |cell| current_positions << cell.co_ord }
    current_positions.each do |position|
      win_combos[position] = calculate_win_positions(position, grid, piece.color)
    end
    win_combos
  end

  def assign_yellow_piece
    self.piece = YellowPiece.new
  end

  def assign_red_piece
    self.piece = RedPiece.new
  end
end
