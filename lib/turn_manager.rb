
# keeps a log of who's turn it is
class TurnManager
  attr_reader :board, :players, :turns

  def initialize(players, board)
    @players = players
    @board = board
    @turns = 0
  end

  def turn(x, y, current_player)
    next_turn if @board.place(current_player, x, y)
  end

  def player_index
    @turns % 2
  end

  private

  def next_turn
    @turns += 1
  end
end
