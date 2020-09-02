# frozen_string_literal: true

require_relative 'piece'

# Will represent players of the game. 2 objects of this class will be initialized for every game
class Player
  attr_accessor :name, :piece

  def initialize(num)
    @name = "Player#{num}"
    @piece = nil
  end

  def change_name
    puts "\n#{name}, please enter your name"
    @name = $stdin.gets.chomp.to_s
  end

  def assign_yellow_piece
    self.piece = YellowPiece.new
  end

  def assign_red_piece
    self.piece = RedPiece.new
  end
end
