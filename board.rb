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

    def reveal(pos)
        if game_over == false
            arr_to_rev = []
            pos.each_with_index do |el, idx|
                if el != pos.length - 1 !neighbor(pos).include?(bomb)
                    arr_to_rev << pos[i] + pos[i+1]
                end
            end
        end
        arr_to_rev.flatten.populate
    end

    def render(reveal = false)
        # reveal is used to fully reveal the board at game end
        @grid.map do |row|
            row.map do |tile|
                reveal ? tile.reveal : tile.render
            end.join("")
        end.join("\n")
    end

    def neighbor(pos)
        pos.each_with_index do |row, col|
            row.each_with_index do |row2, col2|
                if col2 > col && row[col] == row2[col2]
                    reveal.pos[row][col]
                end
            end
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
            row.join("B") if reveal(pos).include?(reveal.arr_to_rev)
        end
    end
end