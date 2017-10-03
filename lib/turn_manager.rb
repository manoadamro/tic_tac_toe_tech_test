#
class TurnManager
  attr_reader :current_turn, :board, :players

  def initialize(players, board)
    @players = players
    @board = board
    @current_turn = 0
  end

  def turn(x, y)
    next_turn if @board.place(x, y)
    @current_turn
  end

  private

  def next_turn
    @players[@current_turn].plays += 1
    @current_turn = (@current_turn + 1) % 2
  end
end
