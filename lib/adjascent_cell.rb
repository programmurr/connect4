# frozen_string_literal: true

module AdjascentCells
  def self.scan_for_adjascent_cells(cell, grid)
    # adjascent_cells = array of adjascent_cells with VALID co_ords
    binding.pry
  end

  # adjacent cells
  # e.g. current cell co_ord = [3, 5]
  #  [2, 5]    [2, 4]    [3, 4]    [4, 4]    [4, 5]      [4, 6]      [3, 6]    [2, 6]
  # [y-1, x] [y-1, x-1] [y, x-1] [y+1, x-1] [y+1, x]   [y+1, x+1]   [y, x+1]  [y-1, x+1]
  # reject if adjascent co_ord < 1 or > 7
end
