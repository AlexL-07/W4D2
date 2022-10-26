KNIGHT_DIFFS = [[2,1], [1,2], [-2,-1], [-1,-2], [-2,1], [-1,2], [2,-1], [1,-2]]
KING_DIFFS = [[0,1], [0,-1], [1,0], [-1,0], [1,1], [-1,1], [1,-1],[-1,-1]]
module Stepable

    def knight_diffs
        KNIGHT_DIFFS
    end
    
    def king_diffs 
        KING_DIFFS
    end

    def moves
        valid_moves = []
        move_diffs.each do |diff|
            dx, dy = diff
            row, col = self.pos
            valid moves << [dx + row, dy + col]
        end

        return valid_moves.select! { |pos| board.valid_pos?(pos) }
    end

    private

    def move_diffs
        raise 'not implemented'
    end


end