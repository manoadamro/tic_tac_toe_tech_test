require('./lib/algorithm')

#
class WinCondition
  def initialize(board, turn_manager, algorithm = Algorithm)
    @board = board
    @turn_manager = turn_manager
    @algorithm = algorithm.new(board)
  end

  def check_for_win(coord_x, coord_y)
    board_full || @algorithm.run_pass(coord_x, coord_y)
  end

  private

  def board_full
    @turn_manager.turns == @board.sqr_size
  end
end