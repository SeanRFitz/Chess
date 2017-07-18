require "pawn"

describe Pawn do
	let(:bpawn) { Pawn.new(2,4,6) }
	let(:wpawn) { Pawn.new(1,0,1) }	

	describe ".initialize" do
		context "a black pawn" do
			it "creates the black E7 pawn" do
				expect(bpawn.player).to eql(2)
				expect(bpawn.moved).to eql(false)
				expect(bpawn.rank).to eql(6)
				expect(bpawn.file).to eql(4)
			end
		end
		context "a white pawn" do
			it "creates the white A2 pawn" do
				expect(wpawn.player).to eql(1)
				expect(wpawn.moved).to eql(false)
				expect(wpawn.file).to eql(0)
				expect(wpawn.rank).to eql(1)
			end
		end
	end

	describe "#move" do
		context "a black pawn" do
			it "moves ahead 2 spaces" do
				expect(bpawn.move(2)).to eql(2)
			end
			it "moves ahead 1 space" do
				expect(bpawn.move(1)).to eql(1)
			end
		end
	end

end