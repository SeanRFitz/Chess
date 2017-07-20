require "pawn"

describe Pawn do
	# player, file(1-8), rank(1-8)
	let(:bpawn) { Pawn.new(:black,5,7) }
	let(:wpawn) { Pawn.new(:white,5,2) }

	describe ".initialize" do
		context "a black pawn" do
			it "creates the black E7 pawn" do
				expect(bpawn.player).to eql(:black)
				expect(bpawn.rank).to eql(7)
				expect(bpawn.file).to eql(5)
			end
		end
		context "a white pawn" do
			it "creates the white E2 pawn" do
				expect(wpawn.player).to eql(:white)
				expect(wpawn.file).to eql(5)
				expect(wpawn.rank).to eql(2)
			end
		end
	end
	
	describe "#move" do
		context "the E2 white pawn" do
			it "attempts a valid move to E4" do
				allow(wpawn).to receive(:gets).and_return("e4")
				expect(wpawn.move).to eql([5,4])
			end
			it "attempts a valid move to E3" do
				allow(wpawn).to receive(:gets).and_return("e3")
				expect(wpawn.move).to eql([5,3])
			end

			it "attmepts a valid move to D3" do
				allow(wpawn).to receive(:gets).and_return("d3")
				expect(wpawn.move).to eql([4,3])
			end
			it "attempts a valid move to F3" do
				allow(wpawn).to receive(:gets).and_return("f3")
				expect(wpawn.move).to eql([6,3])
			end

			it "attempts an invalid move to E5" do
				allow(wpawn).to receive(:gets).and_return("e5")
				expect(wpawn.move).to eql(false)
			end

			it "attempts an invalid move to E6" do
				allow(wpawn).to receive(:gets).and_return("e6")
				expect(wpawn.move).to eql(false)
			end
			it "attempts an invalid move to A7" do
				allow(wpawn).to receive(:gets).and_return("a7")
				expect(wpawn.move).to eql(false)
			end
			it "attempts an invalid move to D4" do
				allow(wpawn).to receive(:gets).and_return("d4")
				expect(wpawn.move).to eql(false)
			end
			it "attempts an invalid move to F2" do
				allow(wpawn).to receive(:gets).and_return("f2")
				expect(wpawn.move).to eql(false)
			end
			it "attempts an invalid move to A1" do
				allow(wpawn).to receive(:gets).and_return("a1")
				expect(wpawn.move).to eql(false)
			end
			it "attempts to not move (E2)" do
				allow(wpawn).to receive(:gets).and_return("e2")
				expect(wpawn.move).to eql(false)
			end
		end

		context "the E7 black pawn" do
			it "attempts a valid move to E5" do
				allow(bpawn).to receive(:gets).and_return("e5")
				expect(bpawn.move).to eql([5,5])
			end

			it "attempts a valid move to E6" do
				allow(bpawn).to receive(:gets).and_return("e6")
				expect(bpawn.move).to eql([5,6])
			end
			it "attempts a valid move to F6" do
				allow(bpawn).to receive(:gets).and_return("f6")
				expect(bpawn.move).to eql([6,6])
			end
			it "attempts a valid move to D6" do
				allow(bpawn).to receive(:gets).and_return("d6")
				expect(bpawn.move).to eql([4,6])
			end
			it "attempts an invalid move to E4" do
				allow(bpawn).to receive(:gets).and_return("e4")
				expect(bpawn.move).to eql(false)
			end
			it "attempts a invalid move to E3" do
				allow(bpawn).to receive(:gets).and_return("e3")
				expect(bpawn.move).to eql(false)
			end

			it "attmepts a invalid move to D3" do
				allow(bpawn).to receive(:gets).and_return("d3")
				expect(bpawn.move).to eql(false)
			end
			it "attempts a invalid move to F3" do
				allow(bpawn).to receive(:gets).and_return("f3")
				expect(bpawn.move).to eql(false)
			end
			it "attempts an invalid move to A7" do
				allow(bpawn).to receive(:gets).and_return("a7")
				expect(bpawn.move).to eql(false)
			end
			it "attempts an invalid move to D4" do
				allow(bpawn).to receive(:gets).and_return("d4")
				expect(bpawn.move).to eql(false)
			end
			it "attempts an invalid move to F2" do
				allow(bpawn).to receive(:gets).and_return("f2")
				expect(bpawn.move).to eql(false)
			end
			it "attempts an invalid move to A1" do
				allow(bpawn).to receive(:gets).and_return("a1")
				expect(bpawn.move).to eql(false)
			end
			it "attempts to not move (E2)" do
				allow(bpawn).to receive(:gets).and_return("e2")
				expect(bpawn.move).to eql(false)
			end
		end
	end
end