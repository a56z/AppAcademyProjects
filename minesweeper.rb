require 'yaml'
require_relative 'board'

class MinesweeperGame
    LAYOUTS = {
        small: { grid_size: 9, num_bombs: 10 },
        medium: { grid_size: 16, num_bombs: 40 },
        large: { grid_size: 32, num_bombs: 160 } # whoa.
    }.freeze  
    
    def initialize(size)
        layout = LAYOUTS[size]
        @board = Board.new(layout[:grid_size], layout[:num_bombs])
    end

end