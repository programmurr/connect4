# frozen_string_literal: true

require 'pry'

module WinPositions
  def calculate_win_positions(position, grid)
    win_positions = []
    win_positions << up_combo(position)
    win_positions << up_right_combo(position)
    win_positions << right_combo(position)
    win_positions << down_right_combo(position)
    win_positions << down_combo(position)
    win_positions << down_left_combo(position)
    win_positions << left_combo(position)
    win_positions << up_left_combo(position)
    remove_invalid_positions(win_positions, grid)
  end

  def remove_invalid_positions(win_positions, grid)
    win_positions.each do |combo|
      combo.delete_if { |co_ord| co_ord[0] > 7 || co_ord[1] > 7 }
      combo.delete_if { |co_ord| co_ord[0] < 1 || co_ord[1] < 1 }
    end
    win_positions.delete_if { |combo| combo.length < 3 }
    remove_nil_or_opponent_pieces(win_positions, grid)
  end

  def remove_nil_or_opponent_pieces(_win_positions, grid)
    new_grid = grid.map do |row|
      row.reject { |cell| cell.value.nil? }
    end
    binding.pry
  end

  def up_combo(position)
    [[position[0] - 1, position[1]], [position[0] - 2, position[1]], [position[0] - 3, position[1]]]
  end

  def up_right_combo(position)
    [[position[0] - 1, position[1] + 1], [position[0] - 2, position[1] + 2], [position[0] - 3, position[1] + 3]]
  end

  def right_combo(position)
    [[position[0], position[1] + 1], [position[0], position[1] + 2], [position[0], position[1] + 3]]
  end

  def down_right_combo(position)
    [[position[0] + 1, position[1] + 1], [position[0] + 2, position[1] + 2], [position[0] + 3, position[1] + 3]]
  end

  def down_combo(position)
    [[position[0] + 1, position[1]], [position[0] + 2, position[1]], [position[0] + 3, position[1]]]
  end

  def down_left_combo(position)
    [[position[0] + 1, position[1] - 1], [position[0] + 2, position[1] - 2], [position[0] + 3, position[1] - 3]]
  end

  def left_combo(position)
    [[position[0], position[1] - 1], [position[0], position[1] - 2], [position[0], position[1] - 3]]
  end

  def up_left_combo(position)
    [[position[0] - 1, position[1] - 1], [position[0] - 2, position[1] - 2], [position[0] - 3, position[1] - 3]]
  end
end
