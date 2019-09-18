# frozen_string_literal: true

# where the player arrays are going to be stored
class Player
  attr_reader :name, :symbol
  attr_accessor :array
  def initialize(name, symbol, array)
    @name = name
    @symbol = symbol
    @array = array
  end
end
