class Board
    def initialize
        @grid = Array.new(3){Array.new(3,"O")}
    end

    def get_move
        puts "Please choose a square to reveal, eg '1,2'"
        response = gets.chomp.to_i
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
end