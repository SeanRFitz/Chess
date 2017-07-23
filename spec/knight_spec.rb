require 'knight'

describe Knight do

	let(:n1) { Knight.new(:white,2,1) }
	let(:n2) { Knight.new(:white,7,1) }
	let(:n1b) { Knight.new(:black,2,8) }
	let(:n2b) { Knight.new(:black,7,8) }

	describe "#initialize" do
		context "creates a white knight" do
			it "at B1" do
				expect(n1.player).to eql(:white)
				expect(n1.file).to eql(2)
				expect(n1.rank).to eql(1)
			end
			it "at G1" do
				expect(n2.player).to eql(:white)
				expect(n2.file).to eql(7)
				expect(n2.rank).to eql(1)
			end
		end

		context "creates a black knight" do
			it "at B8" do
				expect(n1b.player).to eql(:black)
				expect(n1b.file).to eql(2)
				expect(n1b.rank).to eql(8)
			end
			it "at G8" do
				expect(n2b.player).to eql(:black)
				expect(n2b.file).to eql(7)
				expect(n2b.rank).to eql(8)
			end
		end
	end

	describe ".move" do
		context "a white knight at B1" do
			it "returns [3,3] when it moves to C3" do
				allow(n1).to receive(:gets).and_return("c3")
				expect(n1.move).to eql([3,3])
			end
			it "returns false when it attempts to move to A1" do
				allow(n1).to receive(:gets).and_return("a1")
				expect(n1.move).to eql(false)
			end
			it "returns false when it receives invalid input Z8" do
				allow(n1).to receive(:gets).and_return("z8")
				expect(n1.move).to eql(false)	
			end
		end
		context "a black knight at G8" do
			it "returns [6,6] when it moves to F6" do
				allow(n2b).to receive(:gets).and_return("f6")
				expect(n2b.move).to eql([6,6])
			end
			it "returns [8,6] when it moves to H6" do
				allow(n2b).to receive(:gets).and_return("h6")
				expect(n2b.move).to eql([8,6])
			end
			it "returns [5,7] when it moves to E7" do
				allow(n2b).to receive(:gets).and_return("e7")
				expect(n2b.move).to eql([5,7])
			end
			it "returns false when it tries to move to D3" do
				allow(n2b).to receive(:gets).and_return("d3")
				expect(n2b.move).to eql(false)
			end
			it "returns false when it attempts to not move" do
				allow(n2b).to receive(:gets).and_return("g8")
				expect(n2b.move).to eql(false)
			end
		end
	end
end