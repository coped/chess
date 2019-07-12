require_relative 'pieces'
require_relative 'players'
require_relative 'modules'

class Square
    attr_reader :position
    attr_accessor :piece

    def initialize(position, piece = nil)
        @position = position
        @piece = piece
    end

    def show
        @piece ? @piece.symbol : " "
    end
end

class GameBoard
    include ParseInput
    include MoveHelper
    attr_reader :board, :turn, :over, :all_pieces
    
    def initialize(players)
        @all_pieces = players[0].pieces + players[1].pieces
        @board = create_board(create_coordinates)
        update_children
        @turn = 0
        @over = false
    end

    def make_move(player)
        input = gets.chomp.strip.downcase

        if input.empty?
            puts "Put something, nerd."
            make_move(player)
        end

        input = input.split(" ")
        from_where = parse(input.first)
        to_where = parse(input.last)

        if valid?(from_where) and valid?(to_where)
            from = @board.find { |square| square.position == from_where }
            to = @board.find { |square| square.position == to_where }
            if player.pieces.include?(from.piece) and from.piece.children.include?(to_where)
                to.piece.position = :taken if to.piece
                from.piece.position = to.position
                to.piece = from.piece
                from.piece = nil
                update_children
                @turn += 1
            elsif player.pieces.include?(from.piece) and !from.piece.children.include?(to_where)
                puts "Illegal move"
                make_move(player)
            elsif !player.pieces.include?(from.piece)
                puts "That's not your piece"
                make_move(player)
            end
        else
            puts "Invalid command"
            make_move(player)
        end
    end

    def update_children
        # Run twice because king's children are dependent on other children
        2.times do
            @all_pieces.each { |piece| piece.children = get_children(piece, @all_pieces) }
        end
    end

    def display_board
        horizontal = "   |-----|-----|-----|-----|-----|-----|-----|-----|"
        lines = [
            "      A     B     C     D     E     F     G     H",
            " 1 |", " 2 |",
            " 3 |", " 4 |",
            " 5 |", " 6 |",
            " 7 |", " 8 |",
        ]
        @board[0..7].each { |square| lines[1] += "  #{square.show}  |" }
        @board[8..15].each { |square| lines[2] += "  #{square.show}  |" }
        @board[16..23].each { |square| lines[3] += "  #{square.show}  |" }
        @board[24..31].each { |square| lines[4] += "  #{square.show}  |" }
        @board[32..39].each { |square| lines[5] += "  #{square.show}  |" }
        @board[40..47].each { |square| lines[6] += "  #{square.show}  |" }
        @board[48..55].each { |square| lines[7] += "  #{square.show}  |" }
        @board[56..63].each { |square| lines[8] += "  #{square.show}  |" }
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
            piece = @all_pieces.find { |piece| piece.position == coordinate }
            board << Square.new(coordinate, piece)
        end
    end
end
