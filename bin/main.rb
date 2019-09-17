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

