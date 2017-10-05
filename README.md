# Tic Tac Toe

## Usage:

  in irb:
    ```ruby
      require('./lib/board')
      require('./lib/game')

      board = Board.new(3)
      game = Game.new(board)

      # to place a piece

      game.place(1, 2) # 1 & 2 refer to the x, y coordinates of the target tile

      # you can get the current players symbol index with:
      game.players[game.turn_manager.player_index]

      # the game will exit when the board is full

    ```

## Testing:

  run ```rspec``` in console to run tests, linter, coverage and complexity checks

  you can also run a feature test with ```ruby app.rb```

## Specs

  - There are two players in the game (X and O)
  - Players take turns until the game is over
  - A player can claim a field if it is not already taken
  - A turn ends when a player claims a field
  - A player wins if they claim all the fields in a row, column or diagonal
  - A game is over if a player wins
  - A game is over when all fields are taken
