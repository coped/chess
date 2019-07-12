require './lib/gameboard.rb'

describe Square do
    let(:game) { GameBoard.new([Player.new(:white), Player.new(:black)]) }

    it "shows a piece symbol when a piece shares its position" do
        expect(game.board[0].show).to eql("\u2656")
    end
    it "is blank when no piece shares its position" do
        expect(game.board[20].show).to eql(" ")
    end
end
describe GameBoard do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }
    let(:game) { GameBoard.new([player1, player2]) }

    describe "make_move" do
        it "correctly moves a defined piece to a defined square" do
            allow(game).to receive(:gets).and_return("a2 a3")
            pawn = game.all_pieces.find { |piece| piece.position == [1, 2] }
            game.make_move(player1)
            expect(pawn.position).to eql([1, 3])
        end
        it "updates piece symbol if piece is on square" do
            pawn = game.all_pieces.find { |piece| piece.position == [1, 2] }
            square = game.board.find { |square| square.position == [1, 4] }
            allow(game).to receive(:gets).and_return("a2 a4")
            game.make_move(player1)
            expect(square.show).to eql(pawn.symbol)
        end
        it "square becomes empty when piece moved off of it" do
            square = game.board.find { |square| square.position == [1, 2] }
            allow(game).to receive(:gets).and_return("a2 a4")
            game.make_move(player1)
            expect(square.show).to eql(" ")
        end
    end
    describe "update_children" do
    end
    describe "display_board" do
        it "displays the board" do
            expect(game).to receive(:display_board)
            game.display_board
        end
    end
    describe "create_coordinates" do
        it "creates an array of 64 unique coordinates" do
            size = game.create_coordinates.reduce(0) { |size| size += 1 }
            expect(size).to eql(64)
        end
    end
    describe "create_board" do
        it "creates an array of 64 Square nodes" do
            size = game.create_board(game.create_coordinates).reduce(0) { |size| size += 1 }
            expect(size).to eql(64)
        end
    end
end
