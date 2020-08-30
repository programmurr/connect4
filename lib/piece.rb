# frozen_string_literal: true

require 'colorize'
require 'pry'
require_relative 'cell'

# Represent the yellow counters from connect4 game
class YellowPiece
  attr_reader :color
  def initialize
    super
    @color = 'yellow'
  end

  def display
    "\u25CF".colorize(:yellow)
  end
end

# Represent the red counters from connect4 game
class RedPiece
  attr_reader :color
  def initialize
    super
    @color = 'red'
  end

  def display
    "\u25CF".colorize(:red)
  end
end
