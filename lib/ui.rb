# frozen_string_literal: true

# user interface, all inputs and gets chomps
class Ui
  attr_reader :player1, :player2, :current_player, :mark, :again

  def intitialize; end

  def display_instructions
    puts '*' * 50
    puts 'Welcome To my Tic-Tac-Toe Game!'.center(50, '*')
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
    gets.chomp
  end

  # this code gets where the user marks

  def get_mark(player)
    puts "#{player}, where would you place your mark ?".center(40, ' ').center(50, '*')
    gets.chomp

    # while board.available? == false
    #   puts 'That cell has already been selected. Please choose another one.'
    #   @mark = gets.chomp
    # end
  end

  def end_message
    puts '*' * 50
    puts '*' * 50
    puts 'Thank you for playing!'.center(50, '*')
    puts '*' * 50
    puts '*' * 50
  end

  def winner_message
    puts '*' * 50
    puts '=' * 50
    if game_logic.check_winner.nil?
      puts 'the game is a draw'.center(50, '*')
    else
      puts "#{winner.name} wins".center(50, '*')
    end
    puts '=' * 50
    puts '*' * 50
  end

  def play_again
    puts 'do you want to play again? [y/n] ' .center(50, '*')
    @again = gets.chomp.upcase
    loop do
      break unless @again != Y && @again != N

      puts 'that is not a valid answer, please type y or n ' .center(50, '*')
      @again = gets.chomp.upcase
    end
    @again
  end

  def display_board(cells)
    puts '   |   |   '.center(40, ' ').center(50, '*')
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} ".center(40, ' ').center(50, '*')
    puts '----+----+----'.center(40, ' ').center(50, '*')
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} ".center(40, ' ').center(50, '*')
    puts '----+----+----'.center(40, ' ').center(50, '*')
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} ".center(40, ' ').center(50, '*')
    puts '   |   |   '.center(40, ' ').center(50, '*')
    puts '*' * 50
    puts '*' * 50
  end
end
