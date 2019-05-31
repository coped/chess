require_relative "gameboard"
require_relative "pieces"

def play_game
    game = GameBoard.new
    player = [Player.new("white"), Player.new("black")]
end

play_game if __FILE__ == $0
