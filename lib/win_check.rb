# frozen_string_literal: true

# Contains and operates the logic for identifying win conditions
module WinCheck
  def scan_diagonal_cells(active_player, grid)
    grid.each do |row|
      row.each do |cell|
        if cell.value
          return true if diagonal_win?(cell.co_ord[0] - 1, cell.co_ord[1] + 2, active_player, grid)
        else
          next
        end
      end
    end
    false
  end

  def diagonal_win?(x_co_ord, y_co_ord, active_player, grid)
    z_co_ord = x_co_ord + 1
    right_counter = 0
    left_counter = 0
    down_left = make_down_left_array(x_co_ord, y_co_ord, z_co_ord, grid)
    down_right = make_down_right_array(x_co_ord, y_co_ord, grid)

    return true if win_check?(down_right, active_player, right_counter)
    return true if win_check?(down_left, active_player, left_counter)
  end

  def make_down_left_array(x_co_ord, y_co_ord, z_co_ord, grid)
    down_left = []
    x_co_ord.upto(y_co_ord) do
      break if x_co_ord > 5

      down_left << grid[x_co_ord][z_co_ord]
      x_co_ord += 1
      z_co_ord -= 1
    end
    down_left
  end

  def make_down_right_array(x_co_ord, y_co_ord, grid)
    down_right = []
    x_co_ord.upto(y_co_ord) do |num|
      break if num > 5

      down_right << grid[num][num + 1]
    end
    down_right
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
end
