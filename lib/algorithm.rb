require('./lib/tile_matcher')

# Uses a tile matcher to determine if the game has finished or not
class Algorithm
  def initialize(board, matcher = TileMatcher)
    @board = board
    @matcher = matcher.new(board)
  end

  def run_pass
    iterate do |i|
      return true if @matcher.row_or_column?(i)
    end
    @matcher.diagonal?
  end

  private

  def iterate
    (0...@board.size).each do |i|
      yield(i)
    end
  end
end
