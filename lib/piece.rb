# frozen_string_literal: true

require 'colorize'

class YellowPiece
  attr_reader :color
  def initialize
    @color = 'yellow'
  end

  def display
    "\u25CF".colorize(:yellow)
  end
end

class RedPiece
  attr_reader :color
  def initialize
    @color = 'red'
  end

  def display
    "\u25CF".colorize(:red)
  end
end
