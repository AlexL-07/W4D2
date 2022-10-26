require_relative "piece.rb"
require_relative "stepable.rb"
class Pawn < Piece
    attr_reader :symbol

   

    def symbol
        if self.color == "white"
            return "♙"
        else
            return "♟"
        end
    end

    def moves
        res = []
        forward_steps.each do |step|
            dx, dy = step
            row, col = self.pos 
            if board[[dx + row, dy + col]].color == nil
                res << [dx + row, dy + col]
            end
        end
        side_attacks.each do |step|
            dx, dy = step
            row, col = self.pos 
            res << [dx + row, dy + col]
        end
        return res.select! { |pos| board.valid_pos?(pos) }
    end

    private
    
    def at_start_row?
        if self.color == "black" && self.pos[0] == 1
            return true
        elsif self.color == "white" && self.pos[0] == 6
            return true
        else
            return false
        end
    end

    def forward_dir
        # return 1 or -1 depending on color/what direction pawn is facing
        if self.color == "black" 
            return 1
        else
            return -1
        end
    end

    def forward_steps #the other pieces store valid moves. 
        if self.at_start_row? && self.forward_dir == 1
            return [[2,0], [1,0]]
        elsif self.at_start_row? && self.forward_dir == -1
            return [[-2,0], [-1,0]]
        elsif self.forward_dir == 1
            return [[1,0]]
        elsif self.forward_dir == -1
            return [[-1,0]]
        end
    end

    def side_attacks #check if !empty? && color != your color
        #black: 1,-1 and 1,1 
        #white: -1, -1 and -1, 1
        curr_pos = self.pos
        row, col = curr_pos
        side_attacks_arr = []
        if self.color == "black"
            if board[[row + 1, col - 1]].color == "white" && board[[row + 1, col + 1]].color == "white"
                side_attacks_arr << [1, -1] << [1, 1]
            elsif board[[row + 1, col - 1]].color == "white"
                side_attacks_arr << [1, -1]
            elsif board[[row + 1, col + 1]].color == "white"
                side_attacks_arr << [1, 1]
            end   
        elsif self.color == "white"
            if board[[row - 1, col - 1]].color == "black" && board[[row - 1, col + 1]].color == "black"
                side_attacks_arr << [-1, -1] << [-1, 1]
            elsif board[[row - 1, col - 1]].color == "black"
                side_attacks_arr << [-1, -1]
            elsif board[[row - 1, col + 1]].color == "black"
                side_attacks_arr << [-1, 1]
            end
        end
        side_attacks_arr
    end

    

end