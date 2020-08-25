# frozen_string_literal: true

require_relative '../lib/cell'

describe Cell do
  context '#initialize' do
    it 'creates a new cell with coordinate set to nil' do
      cell = Cell.new
      expect(cell.co_ord).to eq nil
    end

    it 'creates a new cell with value set to nil' do
      cell = Cell.new
      expect(cell.value).to eq nil
    end
  end
end
