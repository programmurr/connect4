# frozen_string_literal: true

require 'colorize'

# Represent the yellow counters from connect4 game
class YellowPiece
  attr_reader :color
  def initialize
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
    @color = 'red'
  end

  def display
    "\u25CF".colorize(:red)
  end
end
