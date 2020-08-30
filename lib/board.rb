# frozen_string_literal: true

require 'pry'
require_relative 'cell'
require_relative 'piece'
require_relative 'game'

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

  def make_down_right_array(x_co_ord, y_co_ord)
    down_right = []
    x_co_ord.upto(y_co_ord) do |num|
      break if num > 5

      down_right << grid[num][num + 1]
    end
    down_right
  end

  def make_down_left_array(x_co_ord, y_co_ord, z_co_ord)
    down_left = []
    x_co_ord.upto(y_co_ord) do
      break if x_co_ord > 5

      down_left << grid[x_co_ord][z_co_ord]
      x_co_ord += 1
      z_co_ord -= 1
    end
    down_left
  end

  def win_check?(array, active_player, counter)
    array.each do |position|
      if position.value.nil?
        next
      elsif position.value.color == active_player.piece.color
        counter += 1
      else
        next
      end
    end
    return true if counter == 4
  end

  def diagonal_win?(x_co_ord, y_co_ord, active_player)
    z_co_ord = x_co_ord + 1
    right_counter = 0
    left_counter = 0
    down_left = make_down_left_array(x_co_ord, y_co_ord, z_co_ord)
    down_right = make_down_right_array(x_co_ord, y_co_ord)

    return true if win_check?(down_right, active_player, right_counter) == true
    return true if win_check?(down_left, active_player, left_counter) == true
  end

  def scan_diagonal_cells(active_player)
    grid.each do |row|
      row.each do |cell|
        if cell.value
          return true if diagonal_win?(cell.co_ord[0] - 1, cell.co_ord[1] + 2, active_player) == true
        else
          next
        end
      end
    end
    false
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

  # BEWARE - I accidentally set the x and y coords in reverse.
  # So after the below function is run, y is actually first in all cell/board coords
  # Sorry. Was in too deep before realizing this
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
