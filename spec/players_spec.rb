require './lib/players.rb'

describe Player do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }

    describe "white?" do
        it "returns true if player is white" do
            expect(player1.white?).to be_truthy
        end
        it "returns false if player is black" do
            expect(player2.white?).to be_falsey
        end
    end
    describe "create_pieces" do
        context "when white" do
            it "creates pieces with white color" do
                result = true
                result = false if !player1.pieces.all? { |piece| piece.color == :white }
                expect(result).to be_truthy
            end
            it "creates 16 total pieces" do
                expect(player1.pieces.length).to eql(16)
            end
        end
        context "when black" do
            it "creates pieces with black color" do
                result = true
                result = false if !player2.pieces.all? { |piece| piece.color == :black }
                expect(result).to be_truthy
            end
            it "creates 16 total pieces" do
                expect(player2.pieces.length).to eql(16)
            end
        end
    end
end
