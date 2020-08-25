# frozen_string_literal: true

require 'pry'
require_relative 'cell'

class Board
  attr_accessor :grid
  def initialize(grid: default_grid)
    @grid = grid
  end

  def display_board
    grid.each do |row|
      puts row.map { |cell| cell.value ? cell.value.display : ' - ' }.join(' ')
    end
    puts ' 1   2   3   4   5   6   7 '
  end

  def default_grid
    Array.new(6) { Array.new(7) { Cell.new } }
  end
end
