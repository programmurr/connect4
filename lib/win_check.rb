# frozen_string_literal: true

require_relative 'array_maker'

# Contains and operates the logic for identifying win conditions
module WinCheck
  def win_detected?(active_player, grid)
    grid.each do |row|
      row.each do |cell|
        next unless cell.value

        x_co_ord = cell.co_ord[0] - 1
        y_co_ord = cell.co_ord[1] - 1
        # return true if win_check?(ArrayMaker.array(x_co_ord, y_co_ord, grid), active_player)
        return true if win_check?(ArrayMaker.horizontal_array(x_co_ord, y_co_ord, grid), active_player)
        return true if win_check?(ArrayMaker.vertical_array(x_co_ord, y_co_ord, grid), active_player)
        return true if win_check?(ArrayMaker.down_left_array(x_co_ord, y_co_ord, grid), active_player)
        return true if win_check?(ArrayMaker.down_right_array(x_co_ord, y_co_ord, grid), active_player)
      end
    end
    false
  end

  def win_check?(array, active_player, counter = 0)
    array.each do |position|
      next if position.value.nil?

      counter += 1 if position.value.color == active_player.piece.color
    end
    counter == 4
  end
end
