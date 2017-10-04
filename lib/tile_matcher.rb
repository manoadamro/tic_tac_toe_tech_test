require('./lib/patterns')
#
class TileMatcher
  attr_reader :board

  def initialize(board, patterns = Patterns)
    @board = board
    @patterns = patterns
  end

  def row_or_column?(i)
    match(*@patterns.column(i)) || match(*@patterns.row(i))
  end

  def diagonal?
    match(*@patterns.diagonal) || match(*@patterns.anti_diagonal)
  end

  private

  def match(a, b, c)
    a = @board.tile[*a]
    a != '' && equals(a, b) && equals(a, c)
  end

  def equals(symbol, coords)
    symbol == @board.tile[*coords]
  end
end
