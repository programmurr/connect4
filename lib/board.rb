# frozen_string_literal: true

require 'pry'
require_relative 'cell'

class Board
  COLUMNS = {
    1 => [[1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1]],
    2 => [[1, 2], [2, 2], [3, 2], [4, 2], [5, 2], [6, 2]],
    3 => [[1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3]],
    4 => [[1, 4], [2, 4], [3, 4], [4, 4], [5, 4], [6, 4]],
    5 => [[1, 5], [2, 5], [3, 5], [4, 5], [5, 5], [6, 5]],
    6 => [[1, 6], [2, 6], [3, 6], [4, 6], [5, 6], [6, 6]],
    7 => [[1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7]]
  }.freeze

  attr_accessor :grid
  def initialize(grid: default_grid)
    @grid = grid
  end

  def full?
    grid.each do |row|
      row.each do |cell|
        return false if cell.value.nil?
      end
    end
    true
  end

  def column_full?(column)
    if column[5].value.nil?
      false
    else
      true
    end
  end

  def get_column(num)
    stack = []
    COLUMNS.fetch(num).reverse.each do |position|
      grid.each do |row|
        row.each do |cell|
          stack << cell if cell.co_ord == position
        end
      end
    end
    stack
  end

  def display_board
    grid.each do |row|
      puts row.map { |cell| cell.value ? " #{cell.value.display} " : ' - ' }.join(' ')
    end
    puts ' 1   2   3   4   5   6   7 '
  end

  def default_grid
    Array.new(6) { Array.new(7) { Cell.new } }
  end

  def set_cell_coordinates
    x = 0
    while x < 6
      y = 0
      while y < 7
        grid[x][y].co_ord = [x + 1, y + 1]
        y += 1
      end
      x += 1
    end
  end
end
