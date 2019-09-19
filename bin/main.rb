# frozen_string_literal: true

require_relative '../lib/game_logic.rb'
require_relative '../lib/board.rb'
require_relative '../lib/players.rb'
require_relative '../lib/color.rb'

class Ui
  
  def display_instructions
    puts '*' * 50
    puts 'Welcome To my Tic-Tac-Toe Game!'.green.center(59, '*')
    puts '*' * 50
    puts '=' * 50
    puts 'RULES'.center(50, '*')
    puts 'Two players can play this game'.center(46, ' ').center(50, '*')
    puts 'and they mark the 3x3 grid board.'.center(46, ' ').center(50, '*')
    puts 'The first player to get 3 positions in a row '.center(46, ' ').center(50, '*')
    puts '(up, down, across or diagonally) is the winner.'.center(46, ' ').center(50, '*')
    puts 'When no more available cells remain on '.center(46, ' ').center(50, '*')
    puts 'the board,the game is considered as a draw.'.center(46, ' ').center(50, '*')
    puts ' To place a mark on the grid, '.center(46, ' ').center(50, '*')
    puts 'type the number of an empty space'.center(46, ' ').center(50, '*')
    puts 'that you would like to mark.'.center(46, ' ').center(50, '*')
    puts '*' * 50
    puts '=' * 50
    puts '*' * 50
  end

  # this code defines each player
  def prompt_player_name(player)
    puts " Enter your name, #{player}:".center(40, ' ').center(50, '*')
    gets.chomp.capitalize
  end

  # this code gets where the user marks

  def get_mark(player)
    puts "#{player}, where would you place your mark ?".center(50, ' ').center(59, '*')
    gets.chomp

  end
  def display_available
    puts '*' * 50
      puts 'That cell has already been selected.'
      puts  'Please choose another one.'
      puts '*' * 50
      gets.chomp.to_i
  end

  def invalid_cell
    puts '*' * 50
    puts "that is not a valid cell"
    puts '*' * 50
    gets.chomp.to_i
  end

  def end_message
    puts '*' * 50
    puts '*' * 50
    puts 'Thank you for playing!'.green.center(59, '*')
    puts '*' * 50
    puts '*' * 50
  end

  def winner_message (winner)
      puts ("the winner is ".brown + "#{winner.name}").center(55," ").center(68, '*')
    puts '=' * 50
    puts '*' * 50
  end

  def draw_message

      puts '*' * 50
      puts '=' * 50
      puts ' Draw Game '.black.bg_brown.center(68, '*')
  end

  def play_again (again)
    puts 'do you want to play again? [y/n] '.brown.center(59, '*')
    again = gets.chomp.upcase
    while again != "Y" && again != "N"
      puts 'that is not a valid answer,'.brown.center(59, '*')
      puts ' please type y or n '.brown.center(59, '*')
      again = gets.chomp.upcase
    end
    again
  end

  def display_board(cells)
    puts '*' * 50
    puts '*' * 50
    puts '   |   |   '.center(40, ' ').center(50, '*')
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} ".center(69, ' ').center(77, '*')
    puts '----+----+----'.center(40, ' ').center(50, '*')
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} ".center(69, ' ').center(77, '*')
    puts '----+----+----'.center(40, ' ').center(50, '*')
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} ".center(69, ' ').center(77, '*')
    puts '   |   |   '.center(40, ' ').center(50, '*')
    puts '*' * 50
    puts '*' * 50
  end
end





ui = Ui.new

ui.display_instructions

name1 = ui.prompt_player_name('player 1')
symbol1 = 'X'
array1 = []
player1 = Player.new(name1.magenta, symbol1.magenta, array1)
name2 = ui.prompt_player_name('player 2')
symbol2 = 'O'
array2 = []
player2 = Player.new(name2.cyan, symbol2.cyan, array2)
again="Y"

  while again == "Y"
  current_player = 'player1'
  board = Board.new(current_player)
  game_logic = GameLogic.new(player1, player2, board.cell)
  ui.display_board board.cell
  moves = 0 
  until game_logic.game_end || moves >8

    mark = ui.get_mark(if current_player == 'player1'
                        player1.name
                      else
                        player2.name
                      end).to_i
      
    while mark==0 || mark > 9 || board.available?(mark)
      if mark==0 || mark > 9
        mark = ui.invalid_cell
      else
        mark = ui.display_available
      end
    end


    if current_player == 'player1'
      game_logic.update_player1 (mark)
    else
      game_logic.update_player2 (mark)
    end
    if current_player == "player1"
      board.update_cell(mark, player1.symbol)
    else
      board.update_cell(mark, player2.symbol)
    end

    ui.display_board board.cell
    winner = game_logic.check_winner

    current_player = if current_player == 'player1'
                      'player2'
                    else
                      'player1'
                    end
                  
    moves = moves+1

  end
  unless winner==nil
  ui.winner_message (winner)
  else
    ui.draw_message
  end
  again = ui.play_again (again)
  player1.array=[]
  player2.array=[]
end
ui.end_message