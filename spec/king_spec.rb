require 'king'

describe King do
	let(:k) { King.new(:white,5,1) }
	let(:kb) { King.new(:black,5,8) }

	describe "#initialize" do
		it "creates a white king" do
			expect(k.player).to equal(:white)
			expect(k.file).to equal(5)
			expect(k.rank).to equal(1)
			expect(k.moved).to equal(false)
		end
		it "creates a black king" do
			expect(kb.player).to equal(:black)
			expect(kb.file).to equal(5)
			expect(kb.rank).to equal(8)
			expect(kb.moved).to equal(false)
		end
	end

	describe ".move" do
		context "a white king at E1" do
			it "returns [5,2] moves to E2" do
				allow(k).to receive(:gets).and_return("e2")
				expect(k.move).to eql([5,2])
			end
			it "returns [4,2] moves to E2" do
				allow(k).to receive(:gets).and_return("d2")
				expect(k.move).to eql([4,2])
			end
			it "returns [6,2] moves to F2" do
				allow(k).to receive(:gets).and_return("f2")
				expect(k.move).to eql([6,2])
			end
			it "returns [4,1] moves to E2" do
				allow(k).to receive(:gets).and_return("d1")
				expect(k.move).to eql([4,1])
			end
			it "returns [6,1] moves to F1" do
				allow(k).to receive(:gets).and_return("f1")
				expect(k.move).to eql([6,1])
			end
			it "returns false if it tries to not move from E1" do
				allow(k).to receive(:gets).and_return("e1")
				expect(k.move).to eql(false)
			end
		end
		context "a black king at E8" do
			it "returns [5,7] moves to E7" do
				allow(kb).to receive(:gets).and_return("e7")
				expect(kb.move).to eql([5,7])
			end
			it "returns [6,7] moves to F7" do
				allow(kb).to receive(:gets).and_return("f7")
				expect(kb.move).to eql([6,7])
			end
			it "returns [4,7] moves to D7" do
				allow(kb).to receive(:gets).and_return("d7")
				expect(kb.move).to eql([4,7])
			end
			it "returns false if it tries to move to A8" do
				allow(kb).to receive(:gets).and_return("a8")
				expect(kb.move).to eql(false)
			end
		end
	end
end