require_relative "pieces"

class Player
    attr_reader :pieces

    def initialize(color)
        @color = color
        @pieces = create_pieces
    end

    def make_turn
        # To define later...
    end
    
    def white?
        @color == "white" ? true : false
    end

    def create_pieces
        if self.white?
            pieces = [
                Rook.new(self, [1, 1]),
                Rook.new(self, [8, 1]),
                Knight.new(self, [2, 1]),
                Knight.new(self, [7, 1]),
                Bishop.new(self, [3, 1]),
                Bishop.new(self, [6, 1]),
                King.new(self, [5, 1]),
                Queen.new(self, [4, 1])
            ]
            (1..8).each { |i| pieces << Pawn.new(self, [i, 2]) }
            return pieces
        else
            pieces = [
                Rook.new(self, [1, 8]),
                Rook.new(self, [8, 8]),
                Knight.new(self, [2, 8]),
                Knight.new(self, [7, 8]),
                Bishop.new(self, [3, 8]),
                Bishop.new(self, [6, 8]),
                King.new(self, [5, 8]),
                Queen.new(self, [4, 8])
            ]
            (1..8).each { |i| pieces << Pawn.new(self, [i, 7]) }
            return pieces
        end
    end
end

class Square
    attr_reader :position
    attr_accessor :symbol

    def initialize(position)
        @position = position
        @symbol = " "
    end

end

class GameBoard
    attr_reader :board
    attr_accessor :turn
    
    def initialize(players)
        @players = players
        @all_pieces = players[0].pieces + players[1].pieces
        @board = create_board(create_coordinates)
        @turn = 0
    end

    def update_board
        @board.each do |square|
            piece = @all_pieces.find { |piece| piece.position == square.position }
            unless piece.nil?
                square.symbol = piece.symbol
            else
                square.symbol = " "
            end
        end
    end


    def display_board
        update_board
        horizontal = "   |-----|-----|-----|-----|-----|-----|-----|-----|"
        lines = [
            "      A     B     C     D     E     F     G     H",
            " 1 |", " 2 |",
            " 3 |", " 4 |",
            " 5 |", " 6 |",
            " 7 |", " 8 |",
        ]
        @board[0..7].each { |square| lines[1] += "  #{square.symbol}  |" }
        @board[8..15].each { |square| lines[2] += "  #{square.symbol}  |" }
        @board[16..23].each { |square| lines[3] += "  #{square.symbol}  |" }
        @board[24..31].each { |square| lines[4] += "  #{square.symbol}  |" }
        @board[32..39].each { |square| lines[5] += "  #{square.symbol}  |" }
        @board[40..47].each { |square| lines[6] += "  #{square.symbol}  |" }
        @board[48..55].each { |square| lines[7] += "  #{square.symbol}  |" }
        @board[56..63].each { |square| lines[8] += "  #{square.symbol}  |" }
        puts ""
        lines.reverse.each do |line|
            puts horizontal
            puts line
        end
        puts ""
    end
    
    def create_coordinates
        return (1..8).reduce([]) do |coordinates, column_index|
            (1..8).each { |row_index| coordinates << [row_index, column_index] }
            coordinates
        end
    end

    def create_board(coordinates)
        all_pieces = @players[0].pieces + @players[1].pieces
        return coordinates.reduce([]) do |board, coordinate|
                board << Square.new(coordinate)
        end
    end
end
