# frozen_string_literal: true

require_relative 'piece'
require_relative 'board'
require_relative 'cell'

# Will represent players of the game. 2 objects of this class will be initialized for eveyr game
class Player
  attr_accessor :name, :piece, :placement

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
