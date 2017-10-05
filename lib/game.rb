require_relative('./turn_manager.rb')
require_relative('./win_condition.rb')

# The entry point for the program
class Game
  def initialize(board,
                 turn_manager = TurnManager, win_condition = WinCondition)
    @turn_manager = turn_manager.new(players, board)
    @win_condition = win_condition.new(board, @turn_manager)
  end

  def play(x, y)
    @turn_manager.turn(x, y, current_player)
    @win_condition.check_for_win(current_player)
  end

  private

  def players
    %w[X O]
  end

  def current_player
    players[@turn_manager.player_index]
  end
end
