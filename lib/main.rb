require_relative 'gameboard'
require_relative 'pieces'
require_relative 'players'
require_relative 'modules'

def play_new_game
    player1 = Player.new(:white)
    player2 = Player.new(:black)
    game = GameBoard.new([player1, player2])
    game.display_board
    while !game.over
        if game.turn % 2 == 0
            puts "Player 1's turn (white):"
            game.make_move(player1)
        else
            puts "Player 2's turn (black):"
            game.make_move(player2)
        end
    end
end

play_new_game if __FILE__ == $0
