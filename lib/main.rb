require_relative "gameboard"
require_relative "pieces"
require_relative "players"
require_relative "modules"

def play_new_game
    players = [Player.new("white"), Player.new("black")]
    game = GameBoard.new(players)
    game.display_board
    until game.over
        if game.turn % 2 == 0
            puts "Player 1's turn (white):"
            game.make_move(players.first)
        else
            puts "Player 2's turn (black):"
            game.make_move(players.last)
        end
    end
end

play_new_game if __FILE__ == $0
