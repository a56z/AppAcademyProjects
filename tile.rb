class Tile
    DELTAS = [
        [-1, -1],
        [-1,  0],
        [-1,  1],
        [ 0, -1],
        [ 0,  1],
        [ 1, -1],
        [ 1,  0],
        [ 1,  1]
      ].freeze

      attr_reader :pos

      def initialize(board, pos)
        @board, @pos = board, pos
        @bombed, @explored, @flagged = false, false, false
      end

      def bombed?
        @bombed
      end

      def explored?
        @explored
      end

      def flagged?
        @flagged
      end

      def adjacent_bomb_count
        neighbors.select(&:bombed?).count
      end

      def explore
        #don't explore location user thinks is bombed
        return self if explored?

        #don't revisit previously explored tiles
        @explored = true
        if !bombed && adjacent_bomb_count == 0
            neighbors.each(&:explore)
        end
        self
    end
end