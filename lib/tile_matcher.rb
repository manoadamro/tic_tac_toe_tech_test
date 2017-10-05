require('./lib/patterns')
require('./lib/comparison')

# responsible for checking all tiles in a pattern are the same
class TileMatcher
  def initialize(board, patterns = Patterns, comparison = Comparison)
    @patterns = patterns
    @comparison = comparison.new(board)
  end

  def row_or_column?(i)
    @comparison.match(*@patterns.column(i)) ||
      @comparison.match(*@patterns.row(i))
  end

  def diagonal?
    @comparison.match(*@patterns.diagonal) ||
      @comparison.match(*@patterns.anti_diagonal)
  end
end
