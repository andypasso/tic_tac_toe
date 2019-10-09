# frozen_string_literal: true

require_relative '../lib/color'
require_relative '../lib/game_logic'
require_relative '../lib/board'
require_relative '../lib/players'

describe GameLogic do
  board = Board.new
  player1 = Player.new('player1'.magenta, 'X'.magenta, [])
  player2 = Player.new('player2'.cyan, 'O'.cyan, [])
  game_logic = GameLogic.new(player1, player2, board.cell, player1)

  describe '#update_player' do
    it "updates a player's array with the cell that player selects" do
      game_logic.update_player(5)
      expect(player1.array[0]).to be 5
    end
  end

  describe '#update_cell' do
    it 'updates the board with the cell selected' do
      game_logic.update_cell(5)
      expect(board.cell[4]).to be player1.symbol
    end
  end

  describe '#switch' do
    it 'changes the current player' do
      game_logic.switch
      expect(game_logic.current).to be player2
    end
  end

  describe '#check_winner' do
    it 'returns nil if no player won' do
      expect(game_logic.check_winner).to be nil
    end
    it 'returns the winner' do
      player1.array = [1, 2, 3]
      expect(game_logic.check_winner).to be player1
    end
  end

  describe '#game_end' do
    it 'return true if a player wins' do
      expect(game_logic.game_end).to be true
    end
  end
end
