require_relative 'gameboard'

class Array
    def x
        self.first
    end

    def y
        self.last
    end
end

module MoveHelper
    def get_children(piece, all_pieces)
        children = []
        position = piece.position
        return [] if position == :taken
        opponent_pieces = all_pieces.find_all { |o| o.color != piece.color }

        bishop_queen_rook_children = -> do
            piece.move_set.each do |moves|
                moves.each do |move|
                    result = [(position.x + move.x), (position.y + move.y)]
                    if result.all? { |i| (1..8).include?(i) }
                        result_piece = all_pieces.find { |r| r.position == result }
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
            children
        end
        
        king_children = -> do
            piece.move_set.each do |move|
                result = [(position.x + move.x), (position.y + move.y)]
                if result.all? { |i| (1..8).include?(i) }
                    result_piece = all_pieces.find { |r| r.position == result }
                    if result_piece.nil?
                        if opponent_pieces.none? { |o| o.children.include?(result) }
                            children << result
                        end
                    elsif result_piece.color != piece.color
                        children << result
                    end
                end
            end
            children
        end

        pawn_children = -> do
            piece.move_set.each do |move|
                result = [(position.x + move.x), (position.y + move.y)]
                if result.all? { |i| (1..8).include?(i) }
                    result_piece = all_pieces.find { |r| r.position == result }
                    if result_piece.nil?
                        children << result
                    end
                end
            end
            if piece.color == :white
                up_right = [(position.x + 1), (position.y + 1)] 
                up_left = [(position.x - 1), (position.y + 1)]
                if opponent_pieces.any? { |o| o.position == up_right }
                    children << up_right
                end
                if opponent_pieces.any? { |o| o.position == up_left } 
                    children << up_left
                end
            elsif piece.color == :black
                down_right = [(position.x + 1), (position.y - 1)]
                down_left = [(position.x - 1), (position.y - 1)]
                opponent_pieces.each do |o|
                    if o.position == down_right
                        children << down_right
                    end
                    if o.position == down_left
                        children << down_left
                    end
                end
            end
            children
        end
         
        other_piece_children = -> do
            piece.move_set.each do |move|
                result = [(position.x + move.x), (position.y + move.y)]
                if result.all? { |i| (1..8).include?(i) }
                    result_piece = all_pieces.find { |r| r.position == result }
                    if result_piece.nil?
                        children << result
                    elsif result_piece.color != piece.color
                        children << result
                    end
                end
            end
            children
        end

        if piece.is_a?(Bishop) or piece.is_a?(Queen) or piece.is_a?(Rook)
            return bishop_queen_rook_children.call
        elsif piece.is_a?(King)
            return king_children.call
        elsif piece.is_a?(Pawn)
            return pawn_children.call
        else 
            return other_piece_children.call
        end
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
        return input.map { |i| i.to_i }
    end

    def valid?(input)
        if (1..8).include?(input.first) and (1..8).include?(input.last)
            return true if input.length == 2
        end
        false
    end
end

module Serialization
end
