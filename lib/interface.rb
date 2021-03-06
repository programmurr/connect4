# frozen_string_literal: true

# Contains strings and triggers for user interaciton
module UserInterface
  def display_header
    system 'clear'
    puts '<<<< Connect4 v1.2 - "Refactored Dufus" >>>>'
  end

  def coin_toss_message(name)
    puts "\nWe're going to start off with a coin toss. #{name}, please write 'heads' or 'tails' then press enter"
  end

  def instruction(name)
    puts "\n#{name}, enter the number of the column you want to place your piece, then press enter"
  end

  def coin_toss_choice
    loop do
      choice = gets.chomp.to_s.downcase
      return 0 if choice == 'heads'
      return 1 if choice == 'tails'

      puts "Please write either 'heads' or 'tails' then press enter"
      sleep 3
    end
  end

  def player1_coin_win(player1_name, player2_name)
    sleep 3
    puts "\nNice #{player1_name}! You're the yellow piece and you go first! #{player2_name}, you're the red piece!"
  end

  def player2_coin_win(player1_name, player2_name)
    sleep 3
    puts "\nWrong #{player1_name}! That means you're the red piece so you go second."
    puts "#{player2_name}, yay! You're the yellow piece and you go first!"
  end

  def enter_ready_to_proceed
    puts "Write 'ready' then press enter when you're ready to play"
    loop do
      choice = gets.chomp.to_s.downcase
      break if choice == 'ready'

      puts "Write 'ready' then press enter when you're ready to play"
    end
  end

  def choose_column_number
    loop do
      column_number = gets.chomp.to_i
      return column_number if column_number.positive? && column_number < 8

      puts 'Please write a number between 1 and 7, then press enter'
    end
  end

  def victory_message(name)
    puts "WOO! Well done #{name}! You won!"
  end

  def draw_message
    puts 'OOF! Even Stevens! Well done. Play again to decide once and for all...'
  end
end
