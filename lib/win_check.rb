# frozen_string_literal: true

# Contains and operates the logic for identifying win conditions
module WinCheck
  def scan_vertical_cells(active_player, grid)
    grid.each do |row|
      row.each do |cell|
        if cell.value
          return true if vertical_win?(cell.co_ord[0] - 1, cell.co_ord[1] - 1, active_player, grid)
        else
          next
        end
      end
    end
    false
  end

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

  def vertical_win?(x_co_ord, y_co_ord, active_player, grid)
    vertical_array = make_vertical_array(x_co_ord, y_co_ord, grid)
    return true if win_check?(vertical_array, active_player)
  end

  def diagonal_win?(x_co_ord, y_co_ord, active_player, grid)
    down_left = make_down_left_array(x_co_ord, y_co_ord, grid)
    down_right = make_down_right_array(x_co_ord, y_co_ord, grid)

    return true if win_check?(down_right, active_player)
    return true if win_check?(down_left, active_player)
  end

  def make_vertical_array(x_co_ord, y_co_ord, grid, vertical_array = [], z_co_ord = x_co_ord + 3)
    x_co_ord.upto(z_co_ord) do
      break if x_co_ord > 5

      vertical_array << grid[x_co_ord][y_co_ord]
      x_co_ord += 1
    end
    vertical_array
  end

  def make_down_left_array(x_co_ord, y_co_ord, grid, z_co_ord = x_co_ord + 1, down_left = [])
    x_co_ord.upto(y_co_ord) do
      break if x_co_ord > 5

      down_left << grid[x_co_ord][z_co_ord]
      x_co_ord += 1
      z_co_ord -= 1
    end
    down_left
  end

  def make_down_right_array(x_co_ord, y_co_ord, grid, down_right = [])
    x_co_ord.upto(y_co_ord) do |num|
      break if num > 5

      down_right << grid[num][num + 1]
    end
    down_right
  end

  def win_check?(array, active_player, counter = 0)
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

    false
  end
end
