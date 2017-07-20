require 'board'

describe Board do
	let(:board) {Board.new}

	describe "#initialize" do
		it "creates the starting squares" do
			expect(board.squares).to eql([
			["r","n","b","q","k","b","n","r"],
			["p","p","p","p","p","p","p","p"],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			["P","P","P","P","P","P","P","P"],
			["R","N","B","Q","K","B","N","R"],
			])
		end
	end

	describe "#move_piece" do

		context "a pawn" do
			it "attempts a valid move to E4" do
				board.move_piece("E2","E4",1)
				expect(board.squares[4][4]).to eql("P")
				expect(board.squares[6][4]).to eql(" ")
			end
		end
	end

end