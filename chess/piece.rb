
class Piece
    attr_reader :color, :board
    attr_accessor :pos 
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def symbol
        raise 'you forgot to set a symbol for your specific piece!'
    end
    
    def valid_moves
        # checks if king is in check or not 
        # can't check yourself before you wreck yourself
    end

    def empty?
        if self.color != nil
            return false
        else
            return true
        end
    end
   

end