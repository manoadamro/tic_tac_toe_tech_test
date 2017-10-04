require_relative('./turn_manager.rb')
#
class Game
  attr_reader :turn_manager, :win_condition

  def initialize(_player, board,
                 turn_manager = TurnManager, win_condition = WinCondition)
    @turn_manager = turn_manager.new(players, board)
    @win_condition = win_condition.new(board, @turn_manager)
  end

  def play(x, y)
    @turn_manager.turn(x, y)
    @win_condition.check_for_win(x, y)
  end

  private

  def players
    %w[X O]
  end
end
