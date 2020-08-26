# frozen_string_literal: true

require_relative 'piece'

class Player
  attr_accessor :name, :piece
  def initialize(num)
    @name = "Player#{num}"
    @piece = nil
  end

  def assign_yellow_piece
    self.piece = YellowPiece.new
  end

  def assign_red_piece
    self.piece = RedPiece.new
  end
end
