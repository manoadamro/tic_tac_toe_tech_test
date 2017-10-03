#
class TurnManager
  attr_reader :player_index, :board, :players

  def initialize(players, board)
    @players = players
    @board = board
    @player_index = 0
  end

  def turn(x, y)
    next_turn if @board.place(player_symbol, x, y)
    @player_index
  end

  private

  def player_symbol
    @players[@player_index]
  end

  def next_turn
    @player_index = (@player_index + 1) % 2
  end
end
