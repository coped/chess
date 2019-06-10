require_relative "gameboard"

module MoveHelper
    def get_children(piece, all_pieces)
        children = []
        position = piece.position
        if (piece.instance_of?(Bishop) or piece.instance_of?(Queen) or piece.instance_of?(Rook))
            piece.move_set.each do |moves|
                moves.each do |move|
                    result = [(position.first + move.first), (position.last + move.last)]
                    if result.all? { |i| (1..8).include?(i) }
                        result_piece = all_pieces.find { |x| x.position == result }
                        if result_piece.nil?
                            children << result
                        elsif result_piece.color == piece.color
                            break
                        else
                            children << result
                            break
                        end
                    end
                end
            end
        elsif piece.instance_of?(King)
            piece.move_set.each do |move|
                result = [(position.first + move.first), (position.last + move.last)]
                if result.all? { |i| (1..8).include?(i) }
                    result_piece = all_pieces.find { |x| x.position == result }
                    opponent_pieces = all_pieces.find_all { |opponent| opponent.color != piece.color }
                    if result_piece.nil?
                        if opponent_pieces.none? { |piece| piece.children.any?(result) }
                            children << result
                        end
                    else
                        children << result unless result_piece.color == piece.color
                    end
                end
            end
        elsif piece.instance_of?(Pawn)
            piece.move_set.each do |move|
                result = [(position.first + move.first), (position.last + move.last)]
                if result.all? { |i| (1..8).include?(i) }
                    result_piece = all_pieces.find { |x| x.position == result }
                    if result_piece.nil?
                        children << result
                    end
                    if piece.color == "white"
                        diagonal_right = [(position.first + 1), (position.last + 1)]
                        diagonal_left = [(position.first - 1), (position.last + 1)]
                        all_pieces.each do |diag_piece|
                            if diag_piece.position == diagonal_right
                                children << diag_piece.position
                            end
                            if diag_piece.position == diagonal_left
                                children << diag_piece.position
                            end
                        end
                    elsif piece.color == "black"
                        diagonal_right = [(position.first + 1), (position.last - 1)]
                        diagonal_left = [(position.first - 1), (position.last - 1)]
                        all_pieces.each do |diag_piece|
                            if diag_piece.position == diagonal_right
                                children << diag_piece.position
                            end
                            if diag_piece.position == diagonal_left
                                children << diag_piece.position
                            end
                        end
                    end
                end
            end
        else
            piece.move_set.each do |move|
                result = [(position.first + move.first), (position.last + move.last)]
                if result.all? { |i| (1..8).include?(i) }
                    result_piece = all_pieces.find { |x| x.position == result }
                    if result_piece.nil?
                        children << result
                    elsif result_piece.color != piece.color
                        children << result
                    end
                end
            end
        end
        children
    end
end

module ParseInput
    def parse(input)
        input = input.split("")
        case input[0]
        when "a" then input[0] = "1"
        when "b" then input[0] = "2"
        when "c" then input[0] = "3"
        when "d" then input[0] = "4"
        when "e" then input[0] = "5"
        when "f" then input[0] = "6"
        when "g" then input[0] = "7"
        when "h" then input[0] = "8"
        else return nil
        end
        return input = input.map { |i| i.to_i }
    end

    def valid?(input)
        if ((1..8).include?(input.first) and (1..8).include?(input.last))
            return true if input.length == 2
        end
        false
    end
end

module Serialization
end
