require "chess_piece"

class Pawn < Piece
	attr_accessor :moved

	def initialize(player,rank,file)
		super(player,rank,file)
		@moved = false
	end

	def move(new_square)
		file = new_square[0].ord - 97
		rank = 8 - new_square[1].to_i

		if ![0..7].include?(file) || ![0..7].include?(rank)
			return false
		end	
	end
end