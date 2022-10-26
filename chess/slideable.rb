module Slideable
    HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end


    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves
        valid_moves = []
        move_dirs.each do |dir|
            dx, dy = dir
            valid moves += grow_unblocked_moves_in_dir(dx, dy)
        end

        valid_moves
    end

    private
    def move_dirs
        #safety. the subclasses will implement this
        raise 'not implemented'
        #you haven't implemented this method for your subclass piece
    end

    def grow_unblocked_moves_in_dir(dx, dy)
      
        curr_x, curr_y = self.pos
        unblocked = []
        loop do
            curr_x, curr_y = curr_x + dx, curr_y + dy
            pos = [curr_x, curr_y]
            break unless @board.valid_pos?(pos)
            if @board.empty?(pos)
                unblocked << pos
            else 
                unblocked << pos if board[pos].color != self.color
                break
            end
        end
        unblocked

    end 

end