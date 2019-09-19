# frozen_string_literal: true

# wining contitions and checks
class GameLogic
  attr_reader :wining_compositions, :winner
  attr_reader :player1, :player2

  def initialize(player1, player2, cell)
    @winner = nil
    @player1 = player1
    @player2 = player2
    @cell = cell
  end

  def update_player1(mark)
    player1.array.push(mark)
  end

  def update_player2(mark)
    player2.array.push(mark)
  end

  def check_winner
    wining_compositions = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                           [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    (0...8).each do |i|
      if (wining_compositions[i] - @player1.array).empty?
        @winner = @player1
      elsif (wining_compositions[i] - @player2.array).empty?
        @winner = @player2
      end
    end
    @winner
  end

  def game_end
    return true unless @winner.nil?
  end
end
