require('./lib/algorithm')

# responsible for checking if the game was won by the last move
class WinCondition
  def initialize(board, turn_manager, algorithm = Algorithm)
    @board = board
    @turn_manager = turn_manager
    @algorithm = algorithm.new(board)
  end

  def check_for_win
    board_full || @algorithm.run_pass
  end

  private

  def board_full
    @turn_manager.turns == @board.sqr_size
  end
end
