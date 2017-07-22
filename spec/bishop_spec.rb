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

	describe ".move" do
		let (:e4bishop) { Bishop.new(:white,5,4) }
		context "a white bishop at C1" do
			it "returns [2,2] when it moves to B2" do
				allow(b1).to receive(:gets).and_return("b2")
				expect(b1.move).to eql([2,2])
			end
			it "returns false when it attempts to move to A1" do
				allow(b1).to receive(:gets).and_return("a1")
				expect(b1.move).to eql(false)
			end
			it "returns false when it receives invalid input Z8" do
				allow(b1).to receive(:gets).and_return("z8")
				expect(b1.move).to eql(false)	
		end	end
		context "a white bishop at E4" do
			

			it "returns [8,1] when it moves to H1" do
				allow(e4bishop).to receive(:gets).and_return("h1")
				expect(e4bishop.move).to eql([8,1])
			end
			it "returns [2,7] when it moves to B7" do
				allow(e4bishop).to receive(:gets).and_return("b7")
				expect(e4bishop.move).to eql([2,7])
			end
			it "returns [7,6] when it moves to G6" do
				allow(e4bishop).to receive(:gets).and_return("g6")
				expect(e4bishop.move).to eql([7,6])
			end
			it "returns [4,3] when it moves to D3" do
				allow(e4bishop).to receive(:gets).and_return("d3")
				expect(e4bishop.move).to eql([4,3])
			end
			it "returns false when it attempts to move to E8" do
				allow(e4bishop).to receive(:gets).and_return("e8")
				expect(e4bishop.move).to eql(false)
			end
			it "returns false when it attempts to move to F8" do
				allow(e4bishop).to receive(:gets).and_return("f8")
				expect(e4bishop.move).to eql(false)
			end
			it "returns false when it attempts to move to A5" do
				allow(e4bishop).to receive(:gets).and_return("a5")
				expect(e4bishop.move).to eql(false)
			end
			it "returns false when it attempts to move to G4" do
				allow(e4bishop).to receive(:gets).and_return("g4")
				expect(e4bishop.move).to eql(false)
			end

		end
	end

end