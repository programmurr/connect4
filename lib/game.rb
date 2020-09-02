# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'piece'
require_relative 'cell'
require_relative 'win_check'
require_relative 'interface'

# Will send messages to the other classes, triggering game logic checks
class Game
  include WinCheck
  include Interface

  attr_accessor :board, :player1, :player2, :active_player, :next_player

  def initialize(board: Board.new, player1: Player.new(1), player2: Player.new(2))
    @board = board
    @player1 = player1
    @player2 = player2
    @active_player = nil
    @next_player = nil
  end

  def setup
    display_header # Interface
    player1.change_name
    player2.change_name
    coin_toss_message(player1.name) # Interface
    player_setup
    set_player_pieces
    board.set_cell_coordinates
    enter_ready_to_proceed # Interface
    gameplay
  end

  def player_setup
    if coin_toss_choice == coin_toss # coin_toss_choice in Interface
      player1_coin_win(player1.name, player2.name) # Interface
      player1_as_active_player
    else
      player2_coin_win(player1.name, player2.name) # Interface
      player2_as_active_player
    end
  end

  def coin_toss(coin = rand(0...2))
    puts 'Tossing the coin...'
    sleep 3
    if coin.zero?
      puts 'Heads!'
      0
    elsif coin == 1
      puts 'Tails!'
      1
    end
  end

  def player1_as_active_player
    self.active_player = player1
    self.next_player = player2
  end

  def player2_as_active_player
    self.active_player = player2
    self.next_player = player1
  end

  def set_player_pieces
    active_player.assign_yellow_piece
    next_player.assign_red_piece
  end

  def gameplay
    loop do
      reset_display
      instruction(active_player.name) # Interface
      put_piece_in_column(column_choice, active_player)
      return win_process if winning_pattern_detected?
      return draw_process if draw?

      switch_active_player
    end
  end

  def reset_display
    system 'clear'
    board.display_board
  end

  def column_choice
    loop do
      choice = choose_column_number # Interface
      column = board.get_column(choice)
      return choice if board.column_full?(column) == false
    end
  end

  def put_piece_in_column(col_num, player)
    board.get_column(col_num).map do |cell|
      return cell.value = player.piece if cell.value.nil?
    end
  end

  def winning_pattern_detected?
    win_detected?(active_player, board.grid) ? true : false # WinCheck
  end

  def win_process
    system 'clear'
    board.display_board
    victory_message(active_player.name) # Interface
  end

  def draw?
    winning_pattern_detected? == false && board.full? ? true : false
  end

  def draw_process
    system 'clear'
    board.display_board
    draw_message # Interface
  end

  def switch_active_player
    temp = active_player
    self.active_player = next_player
    self.next_player = temp
  end
end
