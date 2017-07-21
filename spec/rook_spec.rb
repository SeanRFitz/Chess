require 'rook'

describe Rook do
	let(:r1) { Rook.new(:white,1,1) }
	let(:r2) { Rook.new(:white,8,1) }
	let(:r1b) { Rook.new(:black,1,8) }
	let(:r2b) { Rook.new(:black,8,8) }

	describe "#initialize" do
		context "creates a white rook" do
			it "at A1" do
				expect(r1.player).to eql(:white)
				expect(r1.file).to eql(1)
				expect(r1.rank).to eql(1)
				expect(r1.moved).to eql(false)
			end
			it "at H1" do
				expect(r2.player).to eql(:white)
				expect(r2.file).to eql(8)
				expect(r2.rank).to eql(1)
				expect(r2.moved).to eql(false)
			end
		end

		context "creates a black rook" do
			it "A8" do
				expect(r1b.player).to eql(:black)
				expect(r1b.file).to eql(1)
				expect(r1b.rank).to eql(8)
				expect(r1b.moved).to eql(false)
			end
			it "H8" do
				expect(r2b.player).to eql(:black)
				expect(r2b.file).to eql(8)
				expect(r2b.rank).to eql(8)
				expect(r2b.moved).to eql(false)
			end
		end
	end

	describe ".move" do
		context "a white rook at A1" do
			it "returns the rank and file for a valid move to A6" do
				allow(r1).to receive(:gets).and_return("a6")
				expect(r1.move).to eql([1,6])
			end
			it "returns false for an invalid move to C3" do
				allow(r1).to receive(:gets).and_return("c3")
				expect(r1.move).to eql(false)
			end
		end
		context "a white rook at H1" do
			it "returns the rank and file for a valid move to B1" do
				allow(r2).to receive(:gets).and_return("b1")
				expect(r2.move).to eql([2,1])
			end
			it "returns false for an invalid move to F7" do
				allow(r2).to receive(:gets).and_return("f7")
				expect(r2.move).to eql(false)
			end
		end
		context "a black rook at A8" do
			it "returns the rank and file for a valid move to A6" do
				allow(r1b).to receive(:gets).and_return("a6")
				expect(r1b.move).to eql([1,6])
			end
			it "returns false for an invalid move to C3" do
				allow(r1b).to receive(:gets).and_return("c3")
				expect(r1b.move).to eql(false)
			end
		end
		context "a black rook at H8" do
			it "returns the rank and file for a valid move to B8" do
				allow(r2b).to receive(:gets).and_return("b8")
				expect(r2b.move).to eql([2,8])
			end
			it "returns false for an invalid move to F7" do
				allow(r2b).to receive(:gets).and_return("f7")
				expect(r2b.move).to eql(false)
			end
		end
	end
end