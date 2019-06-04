require_relative "gameboard"

module MoveHelper
    def get_children(position, move_set)
        return move_set.reduce([]) do |children, move|
            result = [(position[0] + move[0]), (position[1] + move[1])]
            children << result if result.all? { |i| (1..8).include?(i) }
            children
        end
    end
end

class Pawn
    include MoveHelper
    attr_reader :symbol, :children
    attr_accessor :position

    def initialize(player, position)
        @player = player
        if player.white?
            @symbol = "\u2659"
            position[1] > 2 ? @move_set = [[0, 1]] : @move_set = [[0, 2], [0, 1]]
        else
            @symbol = "\u265F"
            position[1] < 7 ? @move_set = [[0, -1]] : @move_set = [[0, -2], [0, -1]]
        end
        @position = position
        @children = get_children(@position, @move_set)
    end
end

class Knight
    include MoveHelper
    attr_reader :symbol, :children
    attr_accessor :position

    def initialize(player, position)
        @player = player
        player.white? ? @symbol = "\u2658" : @symbol = "\u265E"
        @move_set = [
            [+1, +2], [+2, +1],
            [+2, -1], [+1, -2],
            [-1, -2], [-2, -1],
            [-2, +1], [-1, +2]
        ]
        @position = position
        @children = get_children(@position, @move_set)
    end
end

class Rook
    include MoveHelper
    attr_reader :symbol, :children
    attr_accessor :position

    def initialize(player, position)
        @player = player
        player.white? ? @symbol = "\u2656" : @symbol = "\u265C"
        @move_set = get_move_set
        @position = position
        @children = get_children(@position, @move_set)
    end

    def get_move_set
        return (-8..8).reduce([]) do |move_set, i|
            unless i == 0
                move_set << [i, 0]
                move_set << [0, i]
            end
            move_set
        end
    end
end

class Bishop
    include MoveHelper
    attr_reader :symbol, :children
    attr_accessor :position

    def initialize(player, position)
        @player = player
        player.white? ? @symbol = "\u2657" : @symbol = "\u265D"
        @move_set = get_move_set
        @position = position
        @children = get_children(@position, @move_set)
    end

    def get_move_set
        return (-8..8).reduce([]) do |move_set, i| 
            unless i == 0
                move_set << [i, i]
                move_set << [-i, i]
            end
            move_set
        end
    end
end

class King 
    include MoveHelper
    attr_reader :symbol, :children
    attr_accessor :position

    def initialize(player, position)
        @player = player
        player.white? ? @symbol = "\u2654" : @symbol = "\u265A"
        @move_set = [
            [+0, +1], [+1, +1],
            [+1, +0], [+1, -1],
            [+0, -1], [-1, -1],
            [-1, +0], [-1, +1]
        ]
        @position = position
        @children = get_children(@position, @move_set)
    end
end

class Queen
    include MoveHelper
    attr_reader :symbol, :children
    attr_accessor :position

    def initialize(player, position)
        @player = player
        player.white? ? @symbol = "\u2655" : @symbol = "\u265B"
        @move_set = get_move_set
        @position = position
        @children = get_children(@position, @move_set)
    end

    def get_move_set
        return (-8..8).reduce([]) do |move_set, i|
            unless i == 0
                temp = [[i, i], [-i, i], [0, i], [i, 0]]
                temp.each { |move| move_set << move }
            end
            move_set
        end
    end
end
