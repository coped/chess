require "./lib/gameboard.rb"

describe Player do
end

describe GameBoard do
    let(:game) { GameBoard.new }

    describe "create_coordinates" do
        it "creates an array of 64 unique coordinates" do
            size = 0
            game.create_coordinates.each { size += 1 }
            expect(size).to eql(64)
        end
    end

end
