#
class Player
  attr_reader :symbol
  attr_accessor :plays

  def initialize(symbol)
    @symbol = symbol
    @plays = 0
  end
end
