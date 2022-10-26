require_relative "piece.rb"
require_relative "stepable.rb"
class Knight < Piece
    include Stepable

    def move_dirs
        knight_dirs
    end

end