require_relative "piece.rb"

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @rows.each_with_index do |row, i|
            if i == 0 || i == 1 || i == 6 || i == 7
                row.each_with_index do |el, i2|
                    # row[i2] = Piece.new
                    if i == 0 
                        # color = "black"
                        row[i2] = Rook.new("black", self, [i, i2]) if i2 == 0 || i2 == 7
                        row[i2] = Knight.new("black", self, [i, i2]) if i2 == 1 || i2 == 6
                        row[i2] = Bishop.new("black", self, [i, i2]) if i2 == 2 || i2 == 5
                        row[i2] = Queen.new("black", self, [i, i2]) if i2 == 3 
                        row[i2] = King.new("black", self, [i, i2]) if i2 == 4
                    elsif i == 1
                        row[i2] = Pawn.new("black", self, [i, i2])  
                    elsif i == 7
                        # color = "white"
                        row[i2] = Rook.new("white", self, [i, i2]) if i2 == 0 || i2 == 7
                        row[i2] = Knight.new("white", self, [i, i2]) if i2 == 1 || i2 == 6
                        row[i2] = Bishop.new("white", self, [i, i2]) if i2 == 2 || i2 == 5
                        row[i2] = Queen.new("white", self, [i, i2]) if i2 == 3 
                        row[i2] = King.new("white", self, [i, i2]) if i2 == 4
                    elsif i == 6
                        row[i2] = Pawn.new("white", self, [i, i2])
                    end
                end
           else
                row.each_with_index do |el, i2|
                    row[i2] = NullPiece.instance 
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
        raise 'there is no piece at start position' if piece.empty?
        raise 'the piece cannot move to end position' if !valid_pos?(end_pos) 
        self[end_pos] = piece
        self[start_pos] = NullPiece.instance
        piece.pos = end_pos
    end

    def empty?(pos)
        self[pos] == NullPiece.instance
    end

    def valid_pos?(end_pos)
        # row, col = end_pos
        # if (row < 0 || row > 7) && (col < 0 || col > 7) 
    
        # return false
        # #will check against moves array if it is a valid move or not
        # end
        # true
        end_pos.all? { |coord| coord.between?(0, 7) }
    end 

end
