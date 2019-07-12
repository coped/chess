require './lib/modules'

describe MoveHelper do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }
    let(:game) { GameBoard.new([player1, player2]) }
    
    describe "get_children" do
        context "when piece is a pawn" do
            it "returns valid moves for white pawn on first move" do
                pawn = game.all_pieces.find { |piece| piece.position == [1, 2] }
                expected = [[1, 3], [1, 4]]
                expect(pawn.children.sort).to eql(expected.sort)
            end
            it "returns valid moves for white pawn after first move" do
                pawn = Pawn.new(player1, [1, 3])
                player1.pieces << pawn
                game.update_children
                expect(pawn.children).to eql([[1, 4]])
            end
            it "can diagonally take an opponent piece" do
                white_pawn = game.all_pieces.find { |piece| piece.position == [2, 2] }
                game.all_pieces << Pawn.new(player2, [3, 3])
                game.all_pieces << Pawn.new(player2, [1, 3])
                game.update_children
                expected = [
                    [2, 3], [2, 4],
                    [1, 3], [3, 3]
                ]
                expect(white_pawn.children.sort).to eql(expected.sort)
            end
            it "returns valid moves for black pawn on first move" do
                pawn = game.all_pieces.find { |piece| piece.position == [1, 7] }
                expected = [[1, 6], [1, 5]]
                expect(pawn.children.sort).to eql(expected.sort)
            end
            it "returns valid moves for black pawn after first move" do
                pawn = Pawn.new(player2, [1, 6])
                player2.pieces << pawn
                game.update_children
                expect(pawn.children).to eql([[1, 5]])
            end
        end
        context "when piece is a knight" do
            it "returns valid moves for a knight" do
                knight = Knight.new(player1, [4, 5])
                player1.pieces << knight
                game.update_children
                expected = [
                    [5, 7], [6, 6],
                    [6, 4], [5, 3],
                    [3, 3], [2, 4],
                    [3, 7], [2, 6]
                ]
                expect(knight.children.sort).to eql(expected.sort)
            end
        end
        context "when piece is a rook" do
            it "returns valid moves for a rook" do
                rook = Rook.new(player1, [4, 4])
                player1.pieces << rook
                game.update_children
                expected = [
                    [1, 4], [2, 4], [3, 4], [5, 4],
                    [6, 4], [7, 4], [8, 4], [4, 3], 
                    [4, 5], [4, 6], [4, 7]
                ]
                expect(rook.children.sort).to eql(expected.sort)
            end
        end
        context "when piece is a bishop" do
            it "returns valid moves for a bishop" do
                bishop = Bishop.new(player1, [4, 4])
                player1.pieces << bishop
                game.update_children
                expected = [
                    [3, 3], [5, 5], [6, 6], [7, 7], 
                    [3, 5], [2, 6], [1, 7], [5, 3], 
                ]
                expect(bishop.children.sort).to eql(expected.sort)
            end
        end
        context "when piece is a king" do
            it "returns valid moves for a king" do
                king = King.new(player1, [4, 4])
                player1.pieces << king
                game.update_children
                expected = [
                    [5, 4], [5, 3],
                    [4, 3], [3, 3],
                    [3, 4]
                ]
                expect(king.children.sort).to eql(expected.sort)
            end
            it "will not move into an opponent's path" do
                opponent_rook = Rook.new(player2, [2, 4])
                player2.pieces << opponent_rook
                king = King.new(player1, [4, 3])
                player1.pieces << king
                game.update_children
                expected = [
                    [5, 3], [3, 3]
                ]
                expect(king.children.sort).to eql(expected.sort)
            end
        end
        context "when piece is a queen" do
            it "returns valid moves for a queen" do
                queen = Queen.new(player1, [4, 4])
                player1.pieces << queen
                game.update_children
                expected = [
                    [4, 3], [4, 5], [4, 6], [4, 7],
                    [1, 4], [2, 4], [3, 4], [5, 4],
                    [6, 4], [7, 4], [8, 4], [3, 3], 
                    [5, 5], [6, 6], [7, 7], [5, 3],
                    [3, 5], [2, 6], [1, 7]
                ]
                expect(queen.children.sort).to eql(expected.sort)
            end
        end
    end
end
describe ParseInput do
    let(:game) { GameBoard.new([Player.new(:white), Player.new(:black)]) }

    describe "parse" do
        it "returns correct coordinate for a given input" do
            input = game.parse("a2")
            expect(input).to eql([1, 2])
        end
        it "rejects incorrect coordinate inputs" do
            input = game.parse("q3")
            expect(input).to eql(nil)
        end
    end
    describe "valid?" do
        it "returns true if given a valid coordinate pair" do
            input = game.valid?([1, 2])
            expect(input).to eql(true)
        end
        it "returns false if given an invalid x coordinate" do
            input = game.valid?([9, 1])
            expect(input).to eql(false)
        end
        it "returns false if given an invalid y coordinate" do
            input = game.valid?([1, 9])
            expect(input).to eql(false)
        end
    end
end
