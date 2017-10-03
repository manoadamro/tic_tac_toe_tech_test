require_relative('./player.rb')
require_relative('./turn_manager.rb')
#
class Game
  attr_reader :turn_manager

  def initialize(player, board, turn_manager)
    players = players(player)
    @turn_manager = turn_manager.new(players, board.new)
  end

  def play(x, y)
    next_turn = @turn_manager.turn(x, y)
    turn_info(next_turn)
  end

  private

  def turn_info(player)
    puts "Player#{player + 1}s turn!"
  end

  def players(player)
    [player.new('X'), player.new('O')]
  end
end
