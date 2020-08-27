# frozen_string_literal: true

module WinPositions
  def calculate_win_positions(position)
    win_positions = []
    win_positions << up_combo(position)
    win_positions << up_right_combo(position)
    win_positions << right_combo(position)
    win_positions << down_right_combo(position)
    win_positions << down_combo(position)
    win_positions << down_left_combo(position)
    win_positions << left_combo(position)
    win_positions << up_left_combo(position)
    win_positions = remove_invalid_positions(win_positions)
  end

  def remove_invalid_positions(win_positions)
    # scan each win position
    # remove it if it contains any number less than 1 or greater than 7
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
