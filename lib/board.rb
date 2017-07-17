class Board
	attr_accessor :squares

	def initialize
		@squares = create_board
	end

	def create_board
		[
			["r","n","b","q","k","b","n","r"],
			["p","p","p","p","p","p","p","p"],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			["P","P","P","P","P","P","P","P"],
			["R","N","B","Q","K","B","N","R"],
		]
	end

	def display
		counter = 9
		@squares.each do |row|
			counter -= 1

			pretty_row = row.join("|")
			# replace white pieces with unicode symbols
			pretty_row.gsub!("R","\u{265C}")
			pretty_row.gsub!("N","\u{265E}")
			pretty_row.gsub!("B","\u{265D}")
			pretty_row.gsub!("Q","\u{265B}")
			pretty_row.gsub!("K","\u{265A}")
			pretty_row.gsub!("P","\u{265F}")

			# replace black pieces with unicode symbols
			pretty_row.gsub!("r","\u{2656}")
			pretty_row.gsub!("n","\u{2658}")
			pretty_row.gsub!("b","\u{2657}")
			pretty_row.gsub!("q","\u{2655}")
			pretty_row.gsub!("k","\u{2654}")
			pretty_row.gsub!("p","\u{2659}")
			puts "#{counter} " + pretty_row
		end
		puts "  A B C D E F G H"
	end

	def move_piece(start,finish,player)
		# E2 --> E4 pawn
		# convert E2 to row#/col#
		start.downcase!
		
		col = start[0].ord - 97
		row = 8 - start[1].to_i

		if col > 7
			puts "Please enter a valid file (A-H)."
			return false
		end
		
		piece = @squares[row][col]

		if piece == " "
			puts "Please select a square with a piece"
			return false
		end

		@squares[row][col] = " "

		# E2 --> E4 pawn
		# convert E2 to row#/col#
		finish.downcase!

		col = finish[0].ord - 97
		row = finish[1].to_i

		@squares[row][col] = piece
	end

end