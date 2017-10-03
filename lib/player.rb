#
class Player
  attr_reader :symbol, :plays

  def initialize(symbol)
    @symbol = symbol
    @plays = 0
  end

  def on_play
    @plays += 1
  end
end
