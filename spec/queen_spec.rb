require 'queen'

describe Queen do
	let(:q) { Queen.new(:white,4,1) }
	let(:qb) { Queen.new(:black,4,8) }
	
	describe "#initialize" do
		it "creates a white queen" do
			expect(q.player).to eql(:white)
			expect(q.file).to eql(4)
			expect(q.rank).to eql(1)
		end
		it "creates a black queen" do
			expect(qb.player).to eql(:black)
			expect(qb.file).to eql(4)
			expect(qb.rank).to eql(8)
		end
	end

	describe ".move" do
		context "a white queen at D1" do
			it "returns [4,2] when it moves to D2" do
				allow(q).to receive(:gets).and_return("d2")
				expect(q.move).to eql([4,2])
			end
			it "returns [3,2] when it moves to C2" do
				allow(q).to receive(:gets).and_return("c2")
				expect(q.move).to eql([3,2])
			end
			it "returns [4,8] when it moves to D8" do
				allow(q).to receive(:gets).and_return("d8")
				expect(q.move).to eql([4,8])
			end
			it "returns [1,4] when it moves to A4" do
				allow(q).to receive(:gets).and_return("a4")
				expect(q.move).to eql([1,4])
			end
			it "returns [5,1] when it moves to E1" do
				allow(q).to receive(:gets).and_return("e1")
				expect(q.move).to eql([5,1])
			end
			it "returns [8,5] when it moves to H5" do
				allow(q).to receive(:gets).and_return("h5")
				expect(q.move).to eql([8,5])
			end
			it "returns false when it attempts to not move" do
				allow(q).to receive(:gets).and_return("d1")
				expect(q.move).to eql(false)
			end
			it "returns false when it attempts to move to E5" do
				allow(q).to receive(:gets).and_return("e5")
				expect(q.move).to eql(false)
			end
			it "returns false when it attempts to move to H8" do
				allow(q).to receive(:gets).and_return("h8")
				expect(q.move).to eql(false)
			end
			it "returns false when it attempts to move to C3" do
				allow(q).to receive(:gets).and_return("c3")
				expect(q.move).to eql(false)
			end
		end
	end
end