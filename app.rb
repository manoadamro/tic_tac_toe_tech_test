require('./lib/board')
require('./lib/game')

board = Board.new(3)
game = Game.new(board)

puts "Player#{game.turn_manager.player_index + 1}s turn (1, 1)"
game.play(1, 0)

puts "Player#{game.turn_manager.player_index + 1}s turn (2, 2)"
game.play(2, 2)

puts "Player#{game.turn_manager.player_index + 1}s turn (1, 2)"
game.play(1, 1)

puts "Player#{game.turn_manager.player_index + 1}s turn (2, 2)"
game.play(2, 2)

puts "Player#{game.turn_manager.player_index + 1}s turn (0, 2)"
game.play(0, 2)

puts "Player#{game.turn_manager.player_index + 1}s turn (1, 3)"
game.play(1, 2)

puts('If i get printed, i failed')
