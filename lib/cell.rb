# frozen_string_literal: true

# Represents the empty spaces in the board. Value gets set to the yellow or red pieces
class Cell
  attr_accessor :co_ord, :value
  def initialize
    @co_ord = nil
    @value = nil
  end
end
