# frozen_string_literal: true

require_relative '../lib/color'

require_relative '../lib/board'

describe Board do
  board = Board.new
  board.cell[4] = 'X'.magenta

  describe '#available?' do
    it 'returns nil if the cell available' do
      expect(board.available?(2)).to be nil
    end
    it 'returns true if the cell is taken' do
      expect(board.available?(5)).to be true
    end
  end
end
