# frozen_string_literal: true

require_relative 'piece'
require_relative 'board'
require_relative 'cell'

class Player
  attr_accessor :name, :piece, :possible_win_combos, :placement, :win_combo

  def initialize(num)
    @name = "Player#{num}"
    @piece = nil
    @placement = {}
  end

  def tag_piece(cell)
    placement[placement.length + 1] = cell
  end

  def assign_yellow_piece
    self.piece = YellowPiece.new
  end

  def assign_red_piece
    self.piece = RedPiece.new
  end
end
