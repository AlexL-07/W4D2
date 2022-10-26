require_relative "piece.rb"
require_relative "stepable.rb"
class Knight < Piece
    include Stepable

    def symbol
        if self.color == "white"
            return "♘"
        else
            return "♞"
        end
    end

    private
    def move_diffs
        knight_dirs
    end

end