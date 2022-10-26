require_relative "piece.rb"

class NullPiece 
    include Singleton
    attr_reader :color, :symbol
    
    def initialize
        @color
        @symbol
    end

    def moves
    end

end