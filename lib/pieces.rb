require_relative 'gameboard'
require_relative 'players'

class Pieces
    attr_reader :symbol, :move_set, :color
    attr_accessor :position, :children
end

class Pawn < Pieces
    def initialize(player, position)
        if player.white?
            @symbol = "\u2659"
            position.last > 2 ? @move_set = [[0, 1]] : @move_set = [[0, 2], [0, 1]]
        else
            @symbol = "\u265F"
            position.last < 7 ? @move_set = [[0, -1]] : @move_set = [[0, -2], [0, -1]]
        end
        @color = player.color
        @position = position
        @children = []
    end
end

class Knight < Pieces
    def initialize(player, position)
        if player.white?
            @symbol = "\u2658"
        else
            @symbol = "\u265E"
        end
        @color = player.color
        @move_set = [
            [+1, +2], [+2, +1],
            [+2, -1], [+1, -2],
            [-1, -2], [-2, -1],
            [-2, +1], [-1, +2]
        ]
        @position = position
        @children = []
    end
end

class Rook < Pieces
    def initialize(player, position)
        if player.white?
            @symbol = "\u2656"
        else
            @symbol = "\u265C"
        end 
        @color = player.color
        @move_set = get_move_set
        @position = position
        @children = []
    end

    def get_move_set
        move_set = [[], [], [], []]
        (1..8).each do |i|
            if i != 0
                temp = [[i, 0], [-i, 0], [0, i], [0, -i]]
                temp.each_with_index { |move, index| move_set[index] << move }
            end
        end
        move_set
    end
end

class Bishop < Pieces
    def initialize(player, position)
        if player.white?
            @symbol = "\u2657"
        else
            @symbol = "\u265D"
        end
        @color = player.color
        @move_set = get_move_set
        @position = position
        @children = []
    end

    def get_move_set
        move_set = [[], [], [], []]
        (1..8).each do |i|
            if i != 0
                temp = [[i, i], [-i, -i], [-i, i], [i, -i]]
                temp.each_with_index { |move, index| move_set[index] << move }
            end
        end
        move_set
    end
end

class King < Pieces
    def initialize(player, position)
        if player.white?
            @symbol = "\u2654"
        else
            @symbol = "\u265A"
        end
        @color = player.color
        @move_set = [
            [+0, +1], [+1, +1],
            [+1, +0], [+1, -1],
            [+0, -1], [-1, -1],
            [-1, +0], [-1, +1]
        ]
        @position = position
        @children = []
    end
end

class Queen < Pieces
    def initialize(player, position)
        if player.white?
            @symbol = "\u2655"
        else
            @symbol = "\u265B"
        end
        @color = player.color
        @move_set = get_move_set
        @position = position
        @children = []
    end

    def get_move_set
        move_set = [
            [], [], [], [],
            [], [], [], [],
        ]
        (1..8).each do |i|
            if i != 0
                temp = [
                    [i, i], [-i, i], [0, i], [i, 0],
                    [-i, -i], [i, -i], [0, -i], [-i, 0]
                ]
                temp.each_with_index { |move, index| move_set[index] << move }
            end
        end
        move_set
    end
end
