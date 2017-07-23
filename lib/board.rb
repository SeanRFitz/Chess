require_relative 'pawn.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'knight.rb'
require_relative 'queen.rb'
require_relative 'king.rb'

class Board
	attr_accessor :squares

	def initialize
		@squares = create_board
	end

	def create_board
		# white pawns
		p1 = Pawn.new(:white,1,2)
		p2 = Pawn.new(:white,2,2)
		p3 = Pawn.new(:white,3,2)
		p4 = Pawn.new(:white,4,2)
		p5 = Pawn.new(:white,5,2)
		p6 = Pawn.new(:white,6,2)
		p7 = Pawn.new(:white,7,2)
		p8 = Pawn.new(:white,8,2)

		# white rooks
		r1 = Rook.new(:white,1,1)
		r2 = Rook.new(:white,8,1)

		# white bishops
		b1 = Bishop.new(:white,3,1)
		b2 = Bishop.new(:white,6,1)

		# white knights

		n1 = Knight.new(:white,2,1)
		n2 = Knight.new(:white,7,1)

		# white queen
		q = Queen.new(:white,4,1)

		# white king
		k = King.new(:white,5,1)

		# black pawns
		p1b = Pawn.new(:black,1,7)
		p2b = Pawn.new(:black,2,7)
		p3b = Pawn.new(:black,3,7)
		p4b = Pawn.new(:black,4,7)
		p5b = Pawn.new(:black,5,7)
		p6b = Pawn.new(:black,6,7)
		p7b = Pawn.new(:black,7,7)
		p8b = Pawn.new(:black,8,7)

		# black rooks
		r1b = Rook.new(:black,1,8)
		r2b = Rook.new(:black,8,8)

		# black bishops
		b1b = Bishop.new(:black,3,8)
		b2b = Bishop.new(:black,6,8)

		# black knights
		n1b = Knight.new(:black,2,8)
		n2b = Knight.new(:black,7,8)

		# black queen
		qb = Queen.new(:black,4,8)

		# black king
		kb = King.new(:black,5,8)

		[
			[r1b,n1b,b1b,qb,kb,b2b,n2b,r2b],
			[p1b,p2b,p3b,p4b,p5b,p6b,p7b,p8b],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[p1,p2,p3,p4,p5,p6,p7,p8],
			[r1,n1,b1,q,k,b2,n2,r2],
		]
	end

	def display
		counter = 8
		@squares.each do |row|
			print "#{counter}|"
			counter -= 1
			row.each do |obj|
				if obj.is_a?(String)
					print "#{obj}|"
				else
					print "#{obj.display}|"
				end
			end
			puts
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