# frozen_string_literal: true

class WhitePiece
  attr_reader :color
  def initialize
    @color = 'white'
  end

  def display
    "\u25CF"
  end
end

class BlackPiece
  attr_reader :color
  def initialize
    @color = 'black'
  end

  def display
    "\u25CB"
  end
end
