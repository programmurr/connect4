# frozen_string_literal: true

require_relative 'piece'
require_relative 'win_positions'

class Player
  include WinPositions

  attr_accessor :name, :piece, :win_combos

  def initialize(num)
    @name = "Player#{num}"
    @piece = nil
    @win_combos = {}
  end

  def calculate_winning_patterns
    current_positions = []
    piece.placement.each_value { |cell| current_positions << cell.co_ord }
    current_positions.each do |position|
      win_combos[position] = calculate_win_positions(position)
    end
  end

  def assign_yellow_piece
    self.piece = YellowPiece.new
  end

  def assign_red_piece
    self.piece = RedPiece.new
  end
end
