# frozen_string_literal: true

require_relative 'array_maker'
# I think array_maker might belong in grid?
# Contains and operates the logic for identifying win conditions
module WinCheck
  def win_detected?(active_player, grid)
    grid.each do |row|
      row.each do |cell|
        next unless cell.value
        if win_check?(ArrayMaker.new.horizontal_array(cell.co_ord[0] - 1, cell.co_ord[1] - 1, grid), active_player)
          return true
        end
        if win_check?(ArrayMaker.new.vertical_array(cell.co_ord[0] - 1, cell.co_ord[1] - 1, grid), active_player)
          return true
        end
        if win_check?(ArrayMaker.new.down_left_array(cell.co_ord[0] - 1, cell.co_ord[1] - 1, grid), active_player)
          return true
        end
        if win_check?(ArrayMaker.new.down_right_array(cell.co_ord[0] - 1, cell.co_ord[1] - 1, grid), active_player)
          return true
        end
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
