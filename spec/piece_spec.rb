# frozen_string_literal: true

require_relative '../lib/piece'

describe YellowPiece do
  before(:each) do
    @yellow_piece = YellowPiece.new
  end

  context '#initialize' do
    it 'has a color of yellow' do
      expect(@yellow_piece.color).to eq 'yellow'
    end
  end

  context '#display' do
    it 'can display a yellow circle in the command line representing the piece' do
      yellow_dot = "\u25CF".colorize(:yellow)
      expect(@yellow_piece.display).to eq yellow_dot
    end
  end
end

describe RedPiece do
  before(:each) do
    @red_piece = RedPiece.new
  end
  context '#initialize' do
    it 'has a color of red' do
      expect(@red_piece.color).to eq 'red'
    end
  end

  context '#display' do
    it 'can display a red circle in the command line representing the piece' do
      red_dot = "\u25CF".colorize(:red)
      expect(@red_piece.display).to eq red_dot
    end
  end
end
