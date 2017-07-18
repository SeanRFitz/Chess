class Piece
	attr_accessor :player, :rank, :file

	def initialize(player,file,rank)
		@player = player
		@rank = rank
		@file = file
	end

end