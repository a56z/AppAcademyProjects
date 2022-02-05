class Board
    attr_reader :grid_size, :num_bombs
    
    def initialize(grid_size, num_bombs)
        @grid_size, num_bombs = grid_size, num_bombs

        generate_board
    end

    def bombs
        @bomb = bomb
    end

    def choose_field
        puts "Please choose a square to reveal, eg '1,2'"
        response = gets.chomp.to_i
    end

    def won?
        @grid.flatten.all? { |tile| tile.bombed? != tile.explored? }
      end
     
    def lost?
        @grid.flatten.any? { |tile| tile.bombed? && tile.explored? }
    end

    def reveal
        render(true)
    end

    def render(reveal = false)
        # reveal is used to fully reveal the board at game end
        @grid.map do |row|
            row.map do |tile|
                reveal ? tile.reveal : tile.render
            end.join("")
        end.join("\n")
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end
end