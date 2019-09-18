# frozen_string_literal: true

require_relative '../lib/game_logic.rb'
require_relative '../lib/board.rb'
require_relative '../lib/players.rb'
require_relative '../lib/ui.rb'

ui = Ui.new

ui.display_instructions

name1 = ui.prompt_player_name('player 1')
symbol1 = 'X'
array1 = []
player1 = Player.new(name1, symbol1, array1)
name2 = ui.prompt_player_name('player 2')
symbol2 = 'O'
array2 = []
player2 = Player.new(name2, symbol2, array2)
current_player = 'player1'

board = Board.new(current_player)
game_logic = GameLogic.new(player1, player2, board.cell)
ui.display_board board.cell

until game_logic.game_end

  mark = ui.get_mark(if current_player == 'player1'
                       player1.name
                     else
                       player2.name
                     end).to_i

  if current_player == 'player1'
    player1.array.push(mark)
  else
    player2.array.push(mark)
  end
  board.update_cell mark
  board.change

  ui.display_board board.cell

  current_player = if current_player == 'player1'
                     'player2'
                   else
                     'player1'
                   end

end
ui.winner_message
# name = Ui.prompt_player_name
# player1 = Player.new(name)

# // UI

# def prompt_player_name
# puts message
# gets.chompt

# # end
# player.mark = Ui.prompt('Choose a mark x/y')

# def prompt(message)
#     puts message

#     gets.cho,p

# end

# until game_logic.game_end

#   puts @player1.array

#   board.update_cell
#   ui.display_board
#
#   players.change_players
# # end
# @winner +=
# playagain?
# # ui.winner_message
# # ui.end_message

# winer=checkwinner
