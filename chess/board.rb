require_relative "piece.rb"

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @rows.each_with_index do |row, i|
            if i == 0 || i == 1 || i == 6 || i == 7
                row.each_with_index do |el, i2|
                    row[i2] = Piece.new
                end
           else
                row.each_with_index do |el, i2|
                    row[i2] = nil 
                end
           end
        end
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        raise 'there is no piece at start position' if piece.nil?
        raise 'the piece cannot move to end position' if !valid_pos?(end_pos)
        self[end_pos] = piece
        self[start_pos] = nil
    end

    def empty?(pos)
        self[pos].nil? #self[pos].is_a? instance of nil piece?
    end

    def valid_pos?(pos)
        row, col = pos
        if (row < 0 || row > 7) && (col < 0 || col > 7)
            return false
        end
        true
    end 

end

# x = Board.new
# p x
# p x.move_piece([0,0], [0,2])