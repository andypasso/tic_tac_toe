# frozen_string_literal: true

# just data for the board
class Board
  attr_accessor :cell
  def initialize(current_player)
    @cell = ['1'.gray, '2'.gray, '3'.gray, '4'.gray, '5'.gray, '6'.gray, '7'.gray, '8'.gray, '9'.gray]
    @current_player = current_player
  end

  def update_cell(mark)
    @cell[mark - 1] = 'X'.magenta if @current_player == 'player1'
    @cell[mark - 1] = 'O'.cyan if @current_player == 'player2'
  end

  def change
    @current_player = if @current_player == 'player1'
                        'player2'
                      else
                        'player1'
                      end
  end

  def available?(mark)
    return true if @cell[mark-1] == 'X'.magenta ||  @cell[mark - 1] == 'O'.cyan
  end
end
