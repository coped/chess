require './lib/pieces.rb'

describe Pawn do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }

    context "when white player" do
        let(:pawn) { Pawn.new(player1, [4, 4]) }

        it "has white color" do
            expect(pawn.color).to eql(:white)
        end
        it "uses white pawn unicode" do
            expect(pawn.symbol).to eql("\u2659")
        end
    end
    context "when black player" do
        let(:pawn) { Pawn.new(player2, [4, 4]) }
        it "has black color" do
            expect(pawn.color).to eql(:black)
        end
        it "uses black pawn unicode" do
            expect(pawn.symbol).to eql("\u265F")
        end
    end
end
describe Knight do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }

    context "when white player" do
        let(:knight) { Knight.new(player1, [4, 4]) }

        it "has white color" do
            expect(knight.color).to eql(:white)
        end
        it "uses white knight unicode" do
            expect(knight.symbol).to eql("\u2658")
        end
    end
    context "when black player" do
        let(:knight) { Knight.new(player2, [4, 4]) }

        it "has black color" do
            expect(knight.color).to eql(:black)
        end
        it "uses black night unicode" do
            expect(knight.symbol).to eql("\u265E")
        end
    end
end
describe Rook do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }

    context "when white player" do
        let(:rook) { Rook.new(player1, [4, 4]) }

        it "has white color" do
            expect(rook.color).to eql(:white)
        end
        it "uses white rook unicode" do
            expect(rook.symbol).to eql("\u2656")
        end
    end
    context "when black player" do
        let(:rook) { Rook.new(player2, [4,4]) }

        it "has black color" do
            expect(rook.color).to eql(:black)
        end
        it "uses black rook unicode" do
            expect(rook.symbol).to eql("\u265C")
        end
    end
end
describe Bishop do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }

    context "when white player" do
        let(:bishop) { Bishop.new(player1, [4, 4]) }

        it "has white color" do
            expect(bishop.color).to eql(:white)
        end
        it "uses white bishop unicode" do
            expect(bishop.symbol).to eql("\u2657")
        end
    end
    context "when black player" do
        let(:bishop) { Bishop.new(player2, [4, 4]) }

        it "has black color" do
            expect(bishop.color).to eql(:black)
        end
        it "uses black bishop unicode" do
            expect(bishop.symbol).to eql("\u265D")
        end
    end
end
describe King do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }

    context "when white player" do
        let(:king) { King.new(player1, [4, 4]) }

        it "has white color" do
            expect(king.color).to eql(:white)
        end
        it "uses white king unicode" do
            expect(king.symbol).to eql("\u2654")
        end
    end
    context "when black player" do
        let(:king) { King.new(player2, [4, 4]) }

        it "has black color" do
            expect(king.color).to eql(:black)
        end
        it "uses black king unicode" do
            expect(king.symbol).to eql("\u265A")
        end
    end
end 
describe Queen do
    let(:player1) { Player.new(:white) }
    let(:player2) { Player.new(:black) }

    context "when white player" do
        let(:queen) { Queen.new(player1, [4, 4]) }

        it "has white color" do
            expect(queen.color).to eql(:white)
        end
        it "uses white queen unicode" do
            expect(queen.symbol).to eql("\u2655")
        end
    end
    context "when black player" do
        let(:queen) { Queen.new(player2, [4, 4]) }

        it "has black color" do
            expect(queen.color).to eql(:black)
        end
        it "uses black queen unicode" do
            expect(queen.symbol).to eql("\u265B")
        end
    end
end
