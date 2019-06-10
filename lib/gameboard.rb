require_relative "pieces"
require_relative "players"
require_relative "modules"

class Square
    attr_reader :position
    attr_accessor :symbol

    def initialize(position)
        @position = position
        @symbol = " "
    end
end

class GameBoard
    include ParseInput
    include MoveHelper
    attr_reader :board, :turn, :over, :all_pieces
    
    def initialize(players)
        @players = players
        @all_pieces = players.first.pieces + players.last.pieces
        @board = create_board(create_coordinates)
        update_board
        @turn = 0
        @over = false
    end

    def make_move(player)
        valid_input = false
        input = gets.chomp.strip.downcase
        if input.empty?
            puts "Put something, nerd."
            make_move(player)
        end
        input = input.split(" ")
        from = parse(input.first)
        to = parse(input.last)

        if valid?(from) and valid?(to)
            piece = @all_pieces.find { |piece| piece.position == from }
            taken_piece = @all_pieces.find { |piece| piece.position == to }
            if player.pieces.include?(piece) and piece.children.include?(to)
                valid_input = true
                taken_piece.position = "taken" unless taken_piece.nil?
                piece.position = to
                @turn += 1
                update_board
                display_board
            elsif player.pieces.include?(piece) and !piece.children.include?(to)
                puts "Illegal move"
            elsif !player.pieces.include?(piece)
                puts "That's not your piece"
            end
        else
            puts "Invalid command"
        end
        unless valid_input
            make_move(player)
        end
    end

    def update_board
        @board.each do |square|
            piece = @all_pieces.find { |piece| piece.position == square.position }
            unless piece.nil?
                square.symbol = piece.symbol
                piece.children = get_children(piece, @all_pieces)
            else
                square.symbol = " "
            end
        end
    end

    def display_board
        taken_pieces = @all_pieces.find_all { |piece| piece.position == "taken" }
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
        return coordinates.reduce([]) do |board, coordinate|
                board << Square.new(coordinate)
        end
    end
end
