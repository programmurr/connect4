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
        return true if win_check?(ArrayMaker.new(x_co_ord, y_co_ord, grid).win_array, active_player)
      end
    end
    false
  end

  def win_check?(win_array, active_player)
    win_array.each do |sub_array|
      next if sub_array.length < 4

      counter = 0
      sub_array.each do |position|
        next if position.value.nil?

        counter += 1 if position.value.color == active_player.piece.color
        return true if counter == 4
      end
    end
    false
  end
end
