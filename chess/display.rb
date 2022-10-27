require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0, 0], @board)
    end
    
    def render
        @board.rows.each do |row|
            str = ""
            row.each do |el|
                 str += "|" + el.symbol + " " 
            end
            p str
        end
    end
end