require_relative 'pieces'
require_relative 'gameboard'

class Player
    attr_reader :color, :pieces

    def initialize(color)
        @color = color
        @pieces = create_pieces
    end

    def white?
        @color == :white ? true : false
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
