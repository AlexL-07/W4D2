class Piece
    attr_reader :color, :board
    attr_accessor :pos 
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end
    
    def valid_moves
        # checks if king is in check or not 
        # can't check yourself before you wreck yourself
    end

   

end