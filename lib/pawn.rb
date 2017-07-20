require_relative 'chess_piece.rb'

class Pawn < Piece

	def initialize(player,file,rank)
		super(player,file,rank)
	end

	def move
		new_square, new_file, new_rank = get_input
		if valid_input?(new_square,rank)
			if @player == :white
				if w_possible_move?(new_file,new_rank)
					return new_file, new_rank	
				else
					puts "Not a valid move to #{(new_file + 96).chr.upcase + new_rank.to_s}"
				end
			else # player == :black
				if b_possible_move?(new_file,new_rank)
					return new_file, new_rank
				else
					puts "Not a valid move to #{(new_file + 96).chr.upcase + new_rank.to_s}"
				end
			end
		end
		false
	end

	private
	def get_input
		puts "Where do you want to move the #{(@file + 96).chr.upcase + @rank.to_s} pawn? "
		new_square = gets.chomp.downcase
		new_file = new_square[0].ord - 96
		new_rank = new_square[1].to_i
		return new_square, new_file, new_rank
	end

	def valid_input?(new_square,rank)
		files = ["a","b","c","d","e","f","g","h"]
		ranks = [1,2,3,4,5,6,7,8]
		if new_square.length != 2
			puts "Enter only a letter (A-H) and a number (1-8)."
		elsif !files.include?(new_square[0])
			puts "Only files A-H are valid."
		elsif !ranks.include?(rank)
			puts "Only ranks 1-8 are valid."
		else
			return true
		end
		false
	end

	def w_possible_move?(new_file,new_rank)
		if new_rank <= @rank
			puts "Pawns can only move forwards."
		elsif new_rank - @rank > 2
			puts "Pawns can only move forward 1 or 2 squares."
		elsif new_rank - @rank == 2 && new_file - @file != 0
			puts "Pawns can only move diagonally 1 square."
		elsif (new_file - @file).abs > 1
			puts "Pawns can only capture 1 space away diagonally."
		elsif new_rank - @rank == 2 && @rank != 2
			puts "You have already moved that pawn."
		else
			return true
		end
		false
	end

	def b_possible_move?(new_file,new_rank)
		if new_rank >= @rank
			puts "Pawns can only move forwards."
		elsif (new_rank - @rank).abs > 2
			puts "Pawns can only move forward 1 or 2 squares."
		elsif (new_rank - @rank).abs == 2 && new_file - @file != 0
			puts "Pawns can only move diagonally 1 square."
		elsif (new_file - @file).abs > 1
			puts "Pawns can only capture 1 space away diagonally."
		elsif (new_rank - @rank).abs == 2 && @rank != 7
			puts "You have already moved that pawn."
		else
			return true
		end
		false
	end

	# might not need
	def w_moves(new_file,new_rank)
		# 1. Forward 2 squares
		if (@rank == 2) && (new_file - @file == 0) && (new_rank == 4)
			return new_file, new_rank
		# 2. Forward 1 square
		elsif (new_rank - @rank == 1) && (new_file - @file == 0)
			# check if piece is in the way
			return new_file, new_rank
		# 3. Diagonal left 1 square
		elsif (new_file - @file == -1) && (new_rank - @rank == 1)
			# check_board_for_capture

			# if piece can be captured, check if it initiates a check on own king (pin?)
			# if no, then return something
			return new_file, new_rank
		# 4. Diagonal right 1 square
		elsif (new_file - @file == 1) && (new_rank - @rank == 1)
			# check_board_for_capture

			# if piece can be captured, check if it initiates a check on own king
			# if no, then return
			return new_file, new_rank
		# 5. Enpassant (TBD)
		elsif false
		end
	end


	
end