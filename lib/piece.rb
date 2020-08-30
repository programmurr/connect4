# frozen_string_literal: true

require 'colorize'
require 'pry'
require_relative 'cell'

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
