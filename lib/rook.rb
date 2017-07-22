require_relative 'chess_piece.rb'

class Rook < Piece
	attr_accessor :moved

	def initialize(player,file,rank)
		super(player,file,rank)
		@moved = false
	end

	def display
		if @player == :white
			print "\u{265C}"
		else
			print "\u{2656}"
		end
	end

	def move
		new_square, new_file, new_rank = get_input
		if valid_input?(new_square,new_rank)
			if possible_move?(new_file,new_rank)
				return new_file, new_rank	
			else
				puts "Not a valid move to #{(new_file + 96).chr.upcase + new_rank.to_s}"
			end
		end
		false
	end

	private
	def get_input
		puts "Where do you want to move the #{(@file + 96).chr.upcase + @rank.to_s} rook? "
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

	def possible_move?(new_file,new_rank)
		if @file == new_file && @rank == new_rank
			puts "Please pick a square the piece does not already occupy"
			return false
		elsif @file == new_file || @rank == new_rank
			return true
		end
		puts "Rooks can only move in non-diagonal straight lines."
		false
	end
end