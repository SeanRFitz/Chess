require 'rook'

describe Rook do
	let(:r1) { Rook.new(:white,1,1) }
	let(:r2) { Rook.new(:white,8,1) }
	let(:r1b) { Rook.new(:black,1,8) }
	let(:r2b) { Rook.new(:black,8,8) }

	describe "#initialize" do
		context "white" do
			it "creates a rook at A1" do
				expect(r1.player).to eql(:white)
				expect(r1.file).to eql(1)
				expect(r1.rank).to eql(1)
			end
			it "creates a rook at H1" do
				expect(r2.player).to eql(:white)
				expect(r2.file).to eql(8)
				expect(r2.rank).to eql(1)
			end
		end

		context "black" do
			it "creates a rook at A8" do
				expect(r1b.player).to eql(:black)
				expect(r1b.file).to eql(1)
				expect(r1b.rank).to eql(8)
			end
			it "creates a rook at H8" do
				expect(r2b.player).to eql(:black)
				expect(r2b.file).to eql(8)
				expect(r2b.rank).to eql(8)
			end
		end
	end
end