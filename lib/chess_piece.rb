class Piece
	attr_accessor :player, :file, :rank

	def initialize(player,file,rank)
		@player = player
		@rank = rank
		@file = file
	end

end