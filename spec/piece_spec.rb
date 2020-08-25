# frozen_string_literal: true

require_relative '../lib/piece'

describe WhitePiece do
  before(:each) do
    @white_piece = WhitePiece.new
  end

  context '#initialize' do
    it 'has a color of white' do
      expect(@white_piece.color).to eq 'white'
    end
  end

  context '#display' do
    it 'can display a white circle in the command line representing the piece' do
      expect { puts @white_piece.display }.to output("\u25CF\n").to_stdout
    end
  end
end

describe BlackPiece do
  before(:each) do
    @black_piece = BlackPiece.new
  end
  context '#initialize' do
    it 'has a color of black' do
      expect(@black_piece.color).to eq 'black'
    end
  end

  context '#display' do
    it 'can display a black circle in the command line representing the piece' do
      expect { puts @black_piece.display }.to output("\u25CB\n").to_stdout
    end
  end
end
