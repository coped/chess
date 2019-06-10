require "./lib/players.rb"

describe Player do
    let(:players) { [Player.new("white"), Player.new("black")] }

    describe "white?" do
        it "returns true if player is white" do
            expect(players.first.white?).to be_truthy
        end
        it "returns false if player is black" do
            expect(players.last.white?).to be_falsey
        end
    end
    describe "create_pieces" do
        context "when white" do
            it "creates pieces with white color" do
                result = true
                result = false unless players.first.pieces.all? { |piece| piece.color == "white" }
                expect(result).to be_truthy
            end
            it "creates 16 total pieces" do
                expect(players.first.pieces.length).to eql(16)
            end
        end
        context "when black" do
            it "creates pieces with black color" do
                result = true
                result = false unless players.last.pieces.all? { |piece| piece.color == "black" }
                expect(result).to be_truthy
            end
            it "creates 16 total pieces" do
                expect(players.first.pieces.length).to eql(16)
            end
        end
    end
end
