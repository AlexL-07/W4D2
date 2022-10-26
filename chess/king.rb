require_relative "piece.rb"
require_relative "stepable.rb"
class King < Piece
    include Stepable

    def symbol
        if self.color == "white"
            return "♔"
        else
            return "♚"
        end
    end

    protected
    def move_diffs
        king_dirs
    end

end