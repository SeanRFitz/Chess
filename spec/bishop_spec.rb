require 'bishop'

describe Bishop do

	let(:b1) { Bishop.new(:white,3,1) }
	let(:b2) { Bishop.new(:white,6,1) }
	let(:b1b) { Bishop.new(:black,3,8) }
	let(:b2b) { Bishop.new(:black,6,8) }

	describe "#initialize" do
		context "creates a white bishop" do
			it "at C1" do
				expect(b1.player).to eql(:white)
				expect(b1.file).to eql(3)
				expect(b1.rank).to eql(1)
			end
			it "at F1" do
				expect(b1.player).to eql(:white)
				expect(b2.file).to eql(6)
				expect(b2.rank).to eql(1)
			end
		end

		context "creates a black bishop" do
			it "at C8" do
				expect(b1b.player).to eql(:black)
				expect(b1b.file).to eql(3)
				expect(b1b.rank).to eql(8)
			end
			it "at F8" do
				expect(b2b.player).to eql(:black)
				expect(b2b.file).to eql(6)
				expect(b2b.rank).to eql(8)
			end
		end
	end
end