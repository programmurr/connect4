# frozen_string_literal: true

require 'colorize'
require 'pry'
require_relative '../lib/cell'

class Piece
  attr_accessor :placement
  def initialize
    @placement = {}
  end

  def tag_piece(cell)
    placement[placement.length + 1] = cell
  end
end

class YellowPiece < Piece
  attr_reader :color
  def initialize
    super
    @color = 'yellow'
  end

  def display
    "\u25CF".colorize(:yellow)
  end
end

class RedPiece < Piece
  attr_reader :color
  def initialize
    super
    @color = 'red'
  end

  def display
    "\u25CF".colorize(:red)
  end
end
