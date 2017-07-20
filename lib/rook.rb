require_relative 'chess_piece.rb'

class Rook < Piece

	def display
		if @player == :white
			print "\u{265C}"
		else
			print "\u{2656}"
		end
	end
end