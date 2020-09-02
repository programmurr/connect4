# frozen_string_literal: true

# Makes arrays of grid cells for WinCheck module to verify winning patterns
class ArrayMaker
  def self.horizontal_array(x_co_ord, y_co_ord, grid)
    array = []
    4.times do
      break if y_co_ord > 6

      array << grid[x_co_ord][y_co_ord]
      y_co_ord += 1
    end
    array
  end

  def self.vertical_array(x_co_ord, y_co_ord, grid)
    array = []
    4.times do
      break if x_co_ord > 5

      array << grid[x_co_ord][y_co_ord]
      x_co_ord += 1
    end
    array
  end

  def self.down_left_array(x_co_ord, y_co_ord, grid)
    array = []
    4.times do
      break if x_co_ord > 5 || y_co_ord.negative?

      array << grid[x_co_ord][y_co_ord]
      x_co_ord += 1
      y_co_ord -= 1
    end
    array
  end

  def self.down_right_array(x_co_ord, y_co_ord, grid)
    array = []
    4.times do
      break if x_co_ord > 5 || y_co_ord > 6

      array << grid[x_co_ord][y_co_ord]
      x_co_ord += 1
      y_co_ord += 1
    end
    array
  end
end
