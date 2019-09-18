# frozen_string_literal: true

# just data for the board
class Board
  attr_accessor :cell
  def initialize(current_player)
    @cell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @current_player = current_player
  end

  def update_cell(mark)
    @cell[mark - 1] = 'X' if @current_player == 'player1'
    @cell[mark - 1] = 'O' if @current_player == 'player2'
  end

  def change
    @current_player = if @current_player == 'player1'
                        'player2'
                      else
                        'player1'
                      end
  end

  def available?(mark)
    @cell[mark - 1].is_a?(integer)
  end
end
