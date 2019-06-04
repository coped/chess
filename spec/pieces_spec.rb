require "./lib/pieces.rb"

describe Pawn do
    let(:player) { [Player.new("white"), Player.new("black")] }

    it "has a white and black pawn symbol" do
        player.each do |player| 
            pawn = Pawn.new(player, [4, 4])
            puts pawn.symbol
        end
    end
    describe "get_children" do
        context "when white" do
            it "returns all possible moves pawn can make on first move" do
                pawn = Pawn.new(player[0], [4, 2])
                results = [[4, 3], [4, 4]]
                expect(pawn.children.all? { |child| results.include?(child) }).to be_truthy
            end
            it "returns all possible moves pawn can make after first move" do
                pawn = Pawn.new(player[0], [4, 4])
                expect(pawn.children).to eql([[4, 5]])
            end
        end
        context "when black" do
            it "returns all possible moves pawn can make on first move" do
                pawn = Pawn.new(player[1], [4, 7])
                results = [[4, 6], [4, 5]]
                expect(pawn.children.all? { |child| results.include?(child) }).to be_truthy
            end
            it "returns all possible moves pawn can make after first move" do
                pawn = Pawn.new(player[1], [4, 5])
                expect(pawn.children).to eql([[4, 4]])
            end
        end
    end
end
describe Knight do
    let(:player) { [Player.new("white"), Player.new("black")] }

    it "has a white and black knight symbol" do
        player.each do |player|
            knight = Knight.new(player, [4, 4])
            puts knight.symbol
        end
    end
    describe "get_children" do
        it "returns all possible moves knight can make" do
            knight = Knight.new(player[0], [4, 4])
            results = [
                [5, 6], [6, 5],
                [6, 3], [5, 2],
                [3, 2], [2, 3],
                [3, 6], [2, 5]
            ]
            expect(knight.children.all? { |child| results.include?(child) }).to be_truthy
        end
    end
end
describe Rook do
    let(:player) { [Player.new("white"), Player.new("black")] }

    it "has a white and black rook symbol" do
        player.each do |player|
            rook = Rook.new(player, [4, 4])
            puts rook.symbol
        end
    end
    describe "get_children" do
        it "returns all possible moves rook can make" do
            rook = Rook.new(player[0], [4, 4])
            results = [
                [1, 4], [2, 4], [3, 4], [5, 4],
                [6, 4], [7, 4], [8, 4], [4, 1],
                [4, 2], [4, 3], [4, 5], [4, 6],
                [4, 7], [4, 8]
        ]
        expect(rook.children.all? { |child| results.include?(child) }).to be_truthy
        end
    end
end
describe Bishop do
    let(:player) { [Player.new("white"), Player.new("black")] }

    it "has a white and black bishop symbol" do
        player.each do |player|
            bishop = Bishop.new(player, [4, 4])
            puts bishop.symbol
        end
    end
    describe "get_children" do
        it "returns all possible moves bishop can make" do
            bishop = Bishop.new(player[0], [4, 4])
            results = [
                [1, 1], [2, 2], [3, 3], [5, 5],
                [6, 6], [7, 7], [8, 8], [3, 5],
                [2, 6], [1, 7], [2, 6], [3, 5],
                [5, 3], [6, 2], [7, 1]
            ]
            expect(bishop.children.all? { |child| results.include?(child) }).to be_truthy
        end
    end
end
describe King do
    let(:player) { [Player.new("white"), Player.new("black")] }

    it "has a white and black king symbol" do
        player.each do |player|
            king = King.new(player, [4, 4])
            puts king.symbol
        end
    end
    describe "get_children" do
        it "returns all possible moves king can make" do
            king = King.new(player[0], [4, 4])
            results = [
                [4, 5], [5, 5], 
                [5, 4], [5, 3],
                [4, 3], [3, 3],
                [3, 4], [3, 5]
            ]
            expect(king.children.all? { |child| results.include?(child) }).to be_truthy
        end
    end
end 
describe Queen do
    let(:player) { [Player.new("white"), Player.new("black")] }

    it "has a white and black queen symbol" do
        player.each do |player|
            queen = Queen.new(player, [4, 4])
            puts queen.symbol
        end
    end
    describe "get_children" do
        it "returns all possible moves queen can make" do
            queen = Queen.new(player[0], [4, 4])
            results = (-8..8).reduce([]) do |result, i|
                [[i, i], [-i, i], [0, i], [i, 0]].each do |move|
                    unless i == 0
                        temp = [(move[0] + queen.position[0]), (move[1] + queen.position[1])]
                        result << temp if temp.all? { |i| (1..8).include?(i) }
                    end
                end
                result
            end
            expect(queen.children.all? { |child| results.include?(child) }).to be_truthy
        end
    end
end
