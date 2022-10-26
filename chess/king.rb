require_relative "piece.rb"
require_relative "stepable.rb"
class King < Piece
    include Stepable

    def move_dirs
        king_dirs
    end

end