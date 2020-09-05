# frozen_string_literal: true

require 'pry'
require_relative '../lib/game'

describe Game do
  context '#initialize' do
    it 'generates a board on creation' do
      game = Game.new
      expect(game.board).to be_instance_of(Board)
    end

    it 'generates a player1 on creation' do
      game = Game.new
      expect(game.player1.name).to eq 'Player1'
    end

    it 'generates a player2 on creation' do
      game = Game.new
      expect(game.player2.name).to eq 'Player2'
    end

    it 'has an active player attribute initialized to nil' do
      game = Game.new
      expect(game.active_player).to eq nil
    end
  end

  context '#active_player' do
    it 'can be set to the player1 object' do
      game = Game.new
      game.active_player = game.player1
      expect(game.active_player).to be_instance_of(Player)
    end

    it 'can retrieve properties from the player object' do
      game = Game.new
      game.active_player = game.player2
      expect(game.active_player.name). to eq 'Player2'
    end
  end

  context '#switch_active_player' do
    it 'changes the active player from player1 to player 2' do
      game = Game.new
      game.active_player = game.player1
      game.next_player = game.player2
      expect { game.switch_active_player }.to change(game, :active_player).from(game.player1).to(game.player2)
    end

    it 'changes the active player from player2 to player 1' do
      game = Game.new
      game.active_player = game.player2
      game.next_player = game.player1
      expect { game.switch_active_player }.to change(game, :active_player).from(game.player2).to(game.player1)
    end
  end

  context '#put_piece_in_row' do
    before(:each) do
      @game = Game.new
      @game.board.set_cell_coordinates
      @game.player1.assign_yellow_piece
      @game.player2.assign_red_piece
    end

    it 'can put a player piece to the bottom of the selected row if the row is empty' do
      @game.put_piece_in_column(1, @game.player1)
      expect(@game.board.grid[5][0].value).to be_instance_of(YellowPiece)
    end

    it 'can put a player piece on top of a piece already in the row' do
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(1, @game.player2)
      expect(@game.board.grid[4][0].value).to be_instance_of(RedPiece)
    end
  end

  context '#winning_pattern_detected?' do
    before(:each) do
      @game = Game.new
      @game.board.set_cell_coordinates
      @game.player1.assign_yellow_piece
      @game.player2.assign_red_piece
    end

    it 'can detect a winning pattern in a vertical direction' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(2, @game.player2)
      expect(@game.winning_pattern_detected?).to eq true
    end

    it 'returns false if no vertical win pattern' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(2, @game.player2)
      expect(@game.winning_pattern_detected?).to eq false
    end

    it 'can detect a winning pattern in a horizontal direction' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(3, @game.player2)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(5, @game.player2)
      expect(@game.winning_pattern_detected?).to eq true
    end

    it 'returns false if no horizontal win pattern' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(5, @game.player2)
      @game.put_piece_in_column(6, @game.player2)
      @game.put_piece_in_column(7, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player1)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player1)
      expect(@game.winning_pattern_detected?).to eq false
    end

    it 'can detect a winning pattern in a diagonal direction' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(7, @game.player1)
      @game.put_piece_in_column(6, @game.player2)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(5, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(4, @game.player1)
      expect(@game.winning_pattern_detected?).to eq true
    end

    it 'can detect a winning pattern in a different diagonal direction' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(4, @game.player1)
      expect(@game.winning_pattern_detected?).to eq true
    end

    it 'does not error if checking a non-win combination near the edge of the board' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(7, @game.player1)
      @game.put_piece_in_column(6, @game.player2)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(5, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(5, @game.player1)
      expect(@game.winning_pattern_detected?).to eq false
    end

    it 'returns false if there is no diagonal win' do
      @game.active_player = @game.player1
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(7, @game.player1)
      expect(@game.winning_pattern_detected?).to eq false
    end

    it 'THE DUFUS TEST - only declares win if there are 4 in a row of the same color in any direction' do
      game = Game.new
      game.board.set_cell_coordinates
      game.player1.assign_yellow_piece
      game.player2.assign_red_piece
      game.active_player = game.player1
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(1, game.player2)
      game.put_piece_in_column(1, game.player2)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(3, game.player1)
      game.put_piece_in_column(3, game.player2)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(5, game.player2)
      game.put_piece_in_column(6, game.player2)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(7, game.player1)
      game.put_piece_in_column(7, game.player2)
      game.put_piece_in_column(7, game.player1)
      # binding.pry
      expect(game.winning_pattern_detected?).to eq false
    end
  end

  context '#draw?' do
    it 'returns true if the game board is fully occupied and no winning combination is detected' do
      game = Game.new
      game.board.set_cell_coordinates
      game.player1.assign_yellow_piece
      game.player2.assign_red_piece
      game.active_player = game.player1
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(3, game.player2)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(7, game.player2)
      game.put_piece_in_column(1, game.player2)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(3, game.player1)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(7, game.player1)
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(3, game.player1)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(6, game.player2)
      game.put_piece_in_column(7, game.player2)
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(3, game.player2)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(5, game.player2)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(7, game.player1)
      game.put_piece_in_column(1, game.player2)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(3, game.player2)
      game.put_piece_in_column(4, game.player1)
      game.put_piece_in_column(5, game.player2)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(7, game.player2)
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(2, game.player2)
      game.put_piece_in_column(3, game.player1)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(6, game.player2)
      game.put_piece_in_column(7, game.player1)
      expect(game.draw?).to eq true
    end

    it 'returns false if the game board is not fully occupied and no winning combination is detected' do
      game = Game.new
      game.board.set_cell_coordinates
      game.player1.assign_yellow_piece
      game.player2.assign_red_piece
      game.active_player = game.player1
      game.put_piece_in_column(1, game.player1)
      game.put_piece_in_column(2, game.player1)
      game.put_piece_in_column(3, game.player2)
      game.put_piece_in_column(4, game.player2)
      game.put_piece_in_column(5, game.player1)
      game.put_piece_in_column(6, game.player1)
      game.put_piece_in_column(7, game.player2)
      expect(game.draw?).to eq false
    end
  end

  context '#coin_toss' do
    let(:subject) { Game.new }
    it 'flips a virtual coin which will can return 0' do
      expect(subject).to receive(:rand).and_return(0)
      expect(subject.coin_toss).to eq 0
    end

    it 'flips a virtual coin which will can return 1' do
      expect(subject).to receive(:rand).and_return(1)
      expect(subject.coin_toss).to eq 1
    end

    it "if it returns 0, it will print 'Heads!' to console" do
      expect(subject).to receive(:rand).and_return(0)
      expect { subject.coin_toss }.to output("Tossing the coin...\nHeads!\n").to_stdout
    end

    it "if it returns 1, it will print 'Tails!' to console" do
      expect(subject).to receive(:rand).and_return(1)
      expect { subject.coin_toss }.to output("Tossing the coin...\nTails!\n").to_stdout
    end

    it 'will not receive unexpected numbers' do
      expect(subject).to receive(:rand).and_return(3)
      expect { subject.coin_toss }.to_not output("Tails!\n").to_stdout
    end

    it 'will not print a word that is not heads or tails' do
      expect(subject).to receive(:rand).and_return(1)
      expect { subject.coin_toss }.to_not output("Fries!!\n").to_stdout
    end
  end

  context '#display_header' do
    it 'displays the title of the game at the top' do
      game = Game.new
      expect { game.display_header }.to output("<<<< Connect4 v1.2 - \"Refactored Dufus\" >>>>\n").to_stdout
    end
  end

  context '#instruction' do
    it 'tells the active player to put their piece in a row column between 1 and 7' do
      game = Game.new
      game.active_player = game.player1
      expect { game.instruction(game.active_player.name) }.to output("\nPlayer1, enter the number of the column you want to place your piece, then press enter\n").to_stdout
    end
  end

  context '#end_game_checks' do
    before(:each) do
      @game = Game.new
      @game.board.set_cell_coordinates
      @game.player1.assign_yellow_piece
      @game.player2.assign_red_piece
      @game.active_player = @game.player1
    end

    it 'exits the game if #winning_patterns_detected? returns true' do
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player1)
      expect { @game.end_game_checks }.to raise_error(SystemExit)
    end

    it 'prints the victory message when #winning_patterns_detected? returns true' do
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player1)
      expect { @game.victory_message(@game.active_player.name) }.to output("WOO! Well done #{@game.active_player.name}! You won!\n").to_stdout
    end

    it 'does not run #win_process if #winning_patterns_detected? returns false' do
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      expect { @game.end_game_checks }.not_to raise_error
    end

    it 'exits the game if #draw? returns true' do
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player2)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player2)
      @game.put_piece_in_column(1, @game.player2)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player1)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player2)
      @game.put_piece_in_column(7, @game.player2)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player2)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(5, @game.player2)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player1)
      @game.put_piece_in_column(1, @game.player2)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player2)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(5, @game.player2)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player2)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player2)
      @game.put_piece_in_column(7, @game.player1)
      expect { @game.end_game_checks }.to raise_error(SystemExit)
    end

    it 'outputs the #draw_message if #draw? returns true' do
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player2)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player2)
      @game.put_piece_in_column(1, @game.player2)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player1)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player2)
      @game.put_piece_in_column(7, @game.player2)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player2)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(5, @game.player2)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player1)
      @game.put_piece_in_column(1, @game.player2)
      @game.put_piece_in_column(2, @game.player1)
      @game.put_piece_in_column(3, @game.player2)
      @game.put_piece_in_column(4, @game.player1)
      @game.put_piece_in_column(5, @game.player2)
      @game.put_piece_in_column(6, @game.player1)
      @game.put_piece_in_column(7, @game.player2)
      @game.put_piece_in_column(1, @game.player1)
      @game.put_piece_in_column(2, @game.player2)
      @game.put_piece_in_column(3, @game.player1)
      @game.put_piece_in_column(4, @game.player2)
      @game.put_piece_in_column(5, @game.player1)
      @game.put_piece_in_column(6, @game.player2)
      @game.put_piece_in_column(7, @game.player1)
      expect { @game.draw_message }.to output("OOF! Even Stevens! Well done. Play again to decide once and for all...\n").to_stdout
    end

    it 'does not run #draw_process if #draw? returns false' do
      @game.put_piece_in_column(7, @game.player1)
      expect { @game.end_game_checks }.not_to raise_error
    end
  end
end
