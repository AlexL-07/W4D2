require_relative "piece.rb"
require_relative "slideable.rb"
class Bishop < Piece
    include Slideable


    def symbol
        if self.color == "white"
            return "♗"
        else
            return "♝"
        end
    end

    private 
    def move_dirs
        diagonal_dirs
    end


end