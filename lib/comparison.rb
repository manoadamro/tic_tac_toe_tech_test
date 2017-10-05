# performs a three way equality comparison
class Comparison
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def match(a, b, c)
    a = @board.tile(*a)
    !a.nil? && equals(a, b) && equals(a, c)
  end

  private

  def equals(symbol, coords)
    symbol == @board.tile(*coords)
  end
end
