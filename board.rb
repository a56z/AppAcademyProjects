class Board
    def initialize
        @grid = Array.new(3){Array.new(3,"O")}
    end

    def choose_field
        puts "Please choose a square to reveal, eg '1,2'"
        response = gets.chomp.to_i
    end

    def game_over
        puts "Game Over!" if choose_field.include?("bomb")
        return true
    end

    def reveal(pos)
        if game_over == false
            row, col = pos
            puts @grid[row][col]
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos
        pos.all? do |i|
            0 <= i && i < @grid.length
        end
    end

    def empty_positions?
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.any? { |pos| empty?(pos)}
    end

    def populate
        @grid.each do |row|
            puts row.join("X")
        end
    end
end