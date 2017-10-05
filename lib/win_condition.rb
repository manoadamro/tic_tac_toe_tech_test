require('./lib/algorithm')
require('./lib/messages')

# responsible for checking if the game was won by the last move
class WinCondition
  def initialize(board, turn_manager,
                 algorithm = Algorithm, messages = Messages.new)
    @max_turns = board.sqr_size
    @turn_manager = turn_manager
    @algorithm = algorithm.new(board)
    @messages = messages
  end

  def check_for_win(player)
    @messages.draw if board_full
    @messages.win(player) if @algorithm.run_pass
  end

  private

  def board_full
    @turn_manager.turns == @max_turns
  end
end
