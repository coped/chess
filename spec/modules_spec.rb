require "./lib/modules"

describe MoveHelper do
    let(:players) { [Player.new("white"), Player.new("black")] }
    let(:game) { GameBoard.new(players) }
    
    describe "get_children" do
        context "when piece is a pawn" do
            it "returns valid moves for white pawn on first move" do
                result = false
                pawn = game.all_pieces.find { |piece| piece.position == [1, 2] }
                expected = [[1, 3], [1, 4]]
                if expected.all? { |position| pawn.children.include?(position) }
                    if pawn.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
            it "returns valid moves for white pawn after first move" do
                pawn = Pawn.new(players.first, [1, 3])
                players.first.pieces << pawn
                game.update_board
                expect(pawn.children).to eql([[1, 4]])
            end
            it "can diagonally take an opponent piece" do
                result = false
                white_pawn = game.all_pieces.find { |piece| piece.position == [2, 2] }
                black_pawns = [Pawn.new(players.last, [3, 3]), Pawn.new(players.last, [1, 3])]
                black_pawns.each { |pawn| players.last.pieces << pawn }
                new_game = GameBoard.new(players)
                expected = [
                    [2, 3], [2, 4],
                    [1, 3], [3, 3]
                ]
                if expected.all? { |position| white_pawn.children.include?(position) }
                    if white_pawn.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
            it "returns valid moves for black pawn on first move" do
                result = false
                pawn = game.all_pieces.find { |piece| piece.position == [1, 7] }
                expected = [[1, 6], [1, 5]]
                if expected.all? { |position| pawn.children.include?(position) }
                    if pawn.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
            it "returns valid moves for black pawn after first move" do
                pawn = Pawn.new(players.last, [1, 6])
                players.last.pieces << pawn
                game.update_board
                expect(pawn.children).to eql([[1, 5]])
            end
        end
        context "when piece is a knight" do
            it "returns valid moves for a knight" do
                result = false
                knight = Knight.new(players.first, [4, 5])
                players.first.pieces << knight
                game.update_board
                expected = [
                    [5, 7], [6, 6],
                    [6, 4], [5, 3],
                    [3, 3], [2, 4],
                    [3, 7], [2, 6]
                ]
                if expected.all? { |position| knight.children.include?(position) }
                    if knight.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
        end
        context "when piece is a rook" do
            it "returns valid moves for a rook" do
                result = false
                rook = Rook.new(players.first, [4, 4])
                players.first.pieces << rook
                game.update_board
                expected = [
                    [1, 4], [2, 4], [3, 4], [5, 4],
                    [6, 4], [7, 4], [8, 4], [4, 3], 
                    [4, 5], [4, 6], [4, 7]
                ]  
                if expected.all? { |position| rook.children.include?(position) }
                    if rook.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
        end
        context "when piece is a bishop" do
            it "returns valid moves for a bishop" do
                result = false
                bishop = Bishop.new(players.first, [4, 4])
                players.first.pieces << bishop
                game.update_board
                expected = [
                    [3, 3], [5, 5], [6, 6], [7, 7], 
                    [3, 5], [2, 6], [1, 7], [5, 3], 
                ]
                if expected.all? { |position| bishop.children.include?(position) }
                    if bishop.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
        end
        context "when piece is a king" do
            it "returns valid moves for a king" do
                result = false
                king = King.new(players.first, [4, 4])
                players.first.pieces << king
                game = GameBoard.new(players)
                expected = [
                    [4, 5], [5, 5], 
                    [5, 4], [5, 3],
                    [4, 3], [3, 3],
                    [3, 4], [3, 5]
                ]
                if expected.all? { |position| king.children.include?(position) }
                    if king.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
            it "will not move into an opponent's path" do
                result = false
                opponent_rook = Rook.new(players.last, [2, 5])
                players.last.pieces << opponent_rook
                king = King.new(players.first, [4, 4])
                players.first.pieces << king
                game = GameBoard.new(players)
                expected = [
                    [5, 4], [5, 3],
                    [4, 3], [3, 3],
                    [3, 4]
                ]
                p king.children
                if expected.all? { |position| king.children.include?(position) }
                    if king.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
        end
        context "when piece is a queen" do
            it "returns valid moves for a queen" do
                result = false
                queen = Queen.new(players.first, [4, 4])
                players.first.pieces << queen
                game.update_board
                expected = [
                    [4, 3], [4, 5], [4, 6], [4, 7],
                    [1, 4], [2, 4], [3, 4], [5, 4],
                    [6, 4], [7, 4], [8, 4], [3, 3], 
                    [5, 5], [6, 6], [7, 7], [5, 3],
                    [3, 5], [2, 6], [1, 7]
                ]
                if expected.all? { |child| queen.children.include?(child) }
                    if queen.children.all? { |child| expected.include?(child) }
                        result = true
                    end
                end
                expect(result).to eql(true)
            end
        end
    end
end
describe ParseInput do
    let(:players) { [Player.new("white"), Player.new("black")] }
    let(:game) { GameBoard.new(players) }

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
        it "returns true if given a valid coordinate" do
            input = game.valid?([1, 2])
            expect(input).to eql(true)
        end
        it "returns false if given an invalid coordinate" do
            input = game.valid?([9, 9])
            expect(input).to eql(false)
        end
    end
end
