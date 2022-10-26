require_relative "piece.rb"
require_relative "slideable.rb"
class Queen < Piece
    include Slideable

    def symbol
        if self.color == "white"
            return "♕"
        else
            return "♛"
        end
    end

    private 
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end


end