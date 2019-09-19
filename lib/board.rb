# frozen_string_literal: true

# just data for the board
class Board
  attr_accessor :cell
  def initialize
    @cell = ['1'.gray, '2'.gray, '3'.gray, '4'.gray, '5'.gray, '6'.gray, '7'.gray, '8'.gray, '9'.gray]
  end

  def update_cell(mark, symbol)
    @cell[mark - 1] = symbol
  end

  def available?(mark)
    return true if @cell[mark - 1] == 'X'.magenta || @cell[mark - 1] == 'O'.cyan
  end
end
