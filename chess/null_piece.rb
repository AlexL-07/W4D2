require_relative "piece.rb"
require "singleton"

class NullPiece 
    include Singleton
    attr_reader :color, :symbol
    
    def initialize
        @color = nil
        @symbol = "_"
    end


    def moves
        []
    end

   

end