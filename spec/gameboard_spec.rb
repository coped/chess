require "./lib/gameboard.rb"

describe Player do
    let(:player) { [Player.new("white"), Player.new("black")] }

    describe "white?" do
        it "returns true if player is white" do
            expect(player[0].white?).to be_truthy
        end
        it "returns false if player is black" do
            expect(player[1].white?).to be_falsey
        end
    end
    describe "create_pieces" do
        context "when white" do
            it "creates pieces with white unicode" do
                expect(player[0].pieces.last.symbol).to eql("\u2659")
            end
            it "creates 16 total pieces" do
                expect(player[0].pieces.length).to eql(16)
            end
        end
        context "when black" do
            it "creates pieces with black unicode" do
                expect(player[1].pieces.last.symbol).to eql("\u265F")
            end
            it "creates 16 total pieces" do
                expect(player[1].pieces.length).to eql(16)
            end
        end
    end
end
describe Square do
    
end
describe GameBoard do
    let(:game) { GameBoard.new([Player.new("white"), Player.new("black")]) }

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
