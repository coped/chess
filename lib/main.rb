require_relative "gameboard"
require_relative "pieces"

def play_game
    player1 = Player.new("white")
    player2 = Player.new("black")
    game = GameBoard.new([player1, player2])
    game.display_board
end

play_game if __FILE__ == $0
