KNIGHT_DIRS = [[2,1], [1,2], [-2,-1], [-1,-2], [-2,1], [-1,2], [2,-1], [1,-2]]
KING_DIRS = [[0,1], [0,-1], [1,0], [-1,0], [1,1], [-1,1], [1,-1],[-1,-1]]
module Stepable

    def knight_dirs
        KNIGHT_DIRS
    end
    
    def king_dirs 
        KING_DIRS
    end

    def moves
        valid_moves = []
        move_dirs.each do |dir|
            dx, dy = dir
            row, col = self.pos
            valid moves << [dx + row, dy + col]
        end

        valid_moves
    end

    private

    def move_dirs
        raise 'not implemented'
    end


end