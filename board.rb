
class Board

    attr_accessor :board

    @@chrs = { # unicode chess characters. Might be useful later
        "b_checker"=> "\u25FB",
        "b_pawn"=> "\u265F",
        "b_rook"=> "\u265C",
        "b_knight"=> "\u265E",
        "b_bishop"=> "\u265D",
        "b_king"=> "\u265A",
        "b_queen"=> "\u265B",
        "w_checker"=> "\u25FC",
        "w_pawn"=> "\u2659",
        "w_rook"=> "\u2656",
        "w_knight"=> "\u2658",
        "w_bishop"=> "\u2657",
        "w_king"=> "\u2654",
        "w_queen"=> "\u2655"
    }

    @@knigh_jumps = [[2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, 2]] # valid knight moves

    def initialize
        @board = create_checker_board
        
    end

    def create_checker_board # create a checker board
        wb_row = @@chrs["b_checker"].prepend(@@chrs["w_checker"]) * 4
        wb_checkers = []
        8.times { |i| i % 2 == 0 ? wb_checkers << wb_row.split('') : wb_checkers << wb_row.reverse.split('')}
        wb_checkers
    end

    def print_board(b = board)
        b.each {|row| print "#{row} \n"}
    end

    def put_character(coords, character)
        board[coords[0]][coords[1]] = @@chrs[character]
    end

end    






