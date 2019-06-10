require_relative "gameboard"
require_relative "players"

class Pawn
    attr_reader :symbol, :move_set, :color
    attr_accessor :position, :children

    def initialize(player, position)
        if player.white?
            @symbol = "\u2659"
            @color = "white"
            position.last > 2 ? @move_set = [[0, 1]] : @move_set = [[0, 2], [0, 1]]
        else
            @symbol = "\u265F"
            @color = "black"
            position.last < 7 ? @move_set = [[0, -1]] : @move_set = [[0, -2], [0, -1]]
        end
        @position = position
        @children = []
    end
end

class Knight
    attr_reader :symbol, :move_set, :color
    attr_accessor :position, :children

    def initialize(player, position)
        if player.white?
            @symbol = "\u2658"
            @color = "white"
        else
            @symbol = "\u265E"
            @color = "black"
        end
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

class Rook
    attr_reader :symbol, :move_set, :color
    attr_accessor :position, :children

    def initialize(player, position)
        if player.white?
            @symbol = "\u2656"
            @color = "white"
        else
            @symbol = "\u265C"
            @color = "black"
        end 
        @move_set = get_move_set
        @position = position
        @children = []
    end

    def get_move_set
        move_set = [[], [], [], []]
        (1..8).each do |i|
            unless i == 0
                temp = [[i, 0], [-i, 0], [0, i], [0, -i]]
                temp.each_with_index { |move, index| move_set[index] << move }
            end
        end
        move_set
    end
end

class Bishop
    attr_reader :symbol, :move_set, :color
    attr_accessor :position, :children

    def initialize(player, position)
        if player.white?
            @symbol = "\u2657"
            @color = "white"
        else
            @symbol = "\u265D"
            @color = "black"
        end
        @move_set = get_move_set
        @position = position
        @children = []
    end

    def get_move_set
        move_set = [[], [], [], []]
        (1..8).each do |i|
            unless i == 0
                temp = [[i, i], [-i, -i], [-i, i], [i, -i]]
                temp.each_with_index { |move, index| move_set[index] << move }
            end
        end
        move_set
    end
end

class King 
    attr_reader :symbol, :move_set, :color
    attr_accessor :position, :children

    def initialize(player, position)
        if player.white?
            @symbol = "\u2654"
            @color = "white"
        else
            @symbol = "\u265A"
            @color = "black"
        end
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

class Queen
    attr_reader :symbol, :move_set, :color
    attr_accessor :position, :children

    def initialize(player, position)
        if player.white?
            @symbol = "\u2655"
            @color = "white"
        else
            @symbol = "\u265B"
            @color = "black"
        end
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
            unless i == 0
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
