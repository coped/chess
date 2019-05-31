require_relative "pieces"

class Player
    attr_reader
    def initialize(color)
        @color = color
        @pieces = create_pieces
    end

    def create_pieces
        
    end

    def white?
        @color == "white" ? true : false
    end
end

class GameBoard
    def initialize
        @coordinates = create_coordinates
        @board = create_board
    end

    def create_coordinates
        coordinates = []
        8.times do |row_index|
            8.times do |column_index|
                temp = []
                temp << (row_index + 1)
                temp << (column_index + 1)
                coordinates << temp
            end
        end
        coordinates
    end

    def create_board
    end
end
