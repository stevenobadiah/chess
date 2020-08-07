require 'pry'

class Player
    attr_reader :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end
end

class Tile
    attr_reader :x_cord, :y_cord
    attr_accessor :value

    def initialize(x_cord, y_cord, value)
        @x_cord = x_cord
        @y_cord = y_cord
        @value = value
    end
end

class Board
    attr_reader :board

    def initialize
        @board = []
    end

    def design_board
        self.create_board
        self.setup
        self.print_board
    end

    def create_board
        (1..8).to_a.each do |x|
            (1..8).to_a.each do |y|
                tile = Tile.new(x, y, '-')
                @board << tile
            end
        end
    end

    def find(x, y)
        @board.each do |tile|
            return tile if tile.x_cord == x && tile.y_cord == y
        end
    end

    def setup
        w_knight1 = Knight.new(2, 1)
        w_knight2 = Knight.new(7, 1)
        w_rook1 = Rook.new(1, 1)
        w_rook2 = Rook.new(8, 1)
        w_bishop1 = Bishop.new(3, 1)
        w_bishop2 = Bishop.new(6, 1)
        w_queen = Queen.new(4, 1)
        w_king = King.new(5, 1)
        w_pawn1 = W_Pawn.new(1, 2)
        w_pawn2 = W_Pawn.new(2, 2)
        w_pawn3 = W_Pawn.new(3, 2)
        w_pawn4 = W_Pawn.new(4, 2)
        w_pawn5 = W_Pawn.new(5, 2)
        w_pawn6 = W_Pawn.new(6, 2)
        w_pawn7 = W_Pawn.new(7, 2)
        w_pawn8 = W_Pawn.new(8, 2)

        $b_knight1 = Knight.new(2, 8)
        b_knight2 = Knight.new(7, 8)
        b_rook1 = Rook.new(1, 8)
        b_rook2 = Rook.new(8, 8)
        b_bishop1 = Bishop.new(3, 8)
        b_bishop2 = Bishop.new(6, 8)
        b_queen = Queen.new(4, 8)
        b_king = King.new(5, 8)
        b_pawn1 = B_Pawn.new(1, 7)
        b_pawn2 = B_Pawn.new(2, 7)
        b_pawn3 = B_Pawn.new(3, 7)
        b_pawn4 = B_Pawn.new(4, 7)
        b_pawn5 = B_Pawn.new(5, 7)
        b_pawn6 = B_Pawn.new(6, 7)
        b_pawn7 = B_Pawn.new(7, 7)
        b_pawn8 = B_Pawn.new(8, 7)

        $b_knight1.symbol = "\u265E"
        b_knight2.symbol = "\u265E"
        b_rook1.symbol = "\u265C"
        b_rook2.symbol = "\u265C"
        b_bishop1.symbol = "\u265D"
        b_bishop2.symbol = "\u265D"
        b_queen.symbol = "\u265B"
        b_king.symbol = "\u265A"
            
        self.find(2, 1).value = w_knight1.symbol
        self.find(7, 1).value = w_knight2.symbol
        self.find(1, 1).value = w_rook1.symbol
        self.find(8, 1).value = w_rook2.symbol
        self.find(3, 1).value = w_bishop1.symbol
        self.find(6, 1).value = w_bishop2.symbol
        self.find(4, 1).value = w_queen.symbol
        self.find(5, 1).value = w_king.symbol
        self.find(1, 2).value = w_pawn1.symbol
        self.find(2, 2).value = w_pawn2.symbol
        self.find(3, 2).value = w_pawn3.symbol
        self.find(4, 2).value = w_pawn4.symbol
        self.find(5, 2).value = w_pawn5.symbol
        self.find(6, 2).value = w_pawn6.symbol
        self.find(7, 2).value = w_pawn7.symbol
        self.find(8, 2).value = w_pawn8.symbol

        self.find(2, 8).value = $b_knight1.symbol
        self.find(7, 8).value = b_knight2.symbol
        self.find(1, 8).value = b_rook1.symbol
        self.find(8, 8).value = b_rook2.symbol
        self.find(3, 8).value = b_bishop1.symbol
        self.find(6, 8).value = b_bishop2.symbol
        self.find(5, 8).value = b_queen.symbol
        self.find(4, 8).value = b_king.symbol
        self.find(1, 7).value = b_pawn1.symbol
        self.find(2, 7).value = b_pawn2.symbol
        self.find(3, 7).value = b_pawn3.symbol
        self.find(4, 7).value = b_pawn4.symbol
        self.find(5, 7).value = b_pawn5.symbol
        self.find(6, 7).value = b_pawn6.symbol
        self.find(7, 7).value = b_pawn7.symbol
        self.find(8, 7).value = b_pawn8.symbol
    end

    def print_board
        separator = '  +---+---+---+---+---+---+---+---+'
        letters = '    A   B   C   D   E   F   G   H  '
        puts letters
        puts separator
        1.upto(8) do |y|
            puts "#{9 - y} | #{find(1, y).value} | #{find(2, y).value} | #{find(3, y).value} | #{find(4, y).value} | #{find(5, y).value} | #{find(6, y).value} | #{find(7, y).value} | #{find(8, y).value} | #{9 - y}"
            puts separator
        end
        puts letters
    end
end

class Pieces

    def initialize
        board = Board.new
        @@w_pieces_array = [$board.w_knight1.position,  $board.w_rook1.position, $board.w_rook1.position, $board.w_rook2.position, $board.w_queen.position, $board.w_king.position, $board.w_pawn1.position, $board.w_pawn2.position, $board.w_pawn3.position, $board.w_pawn4.position, $board.w_pawn5.position, $board.w_pawn6.position, $board.w_pawn7.position, $board.w_pawn8.position]
        @@b_pieces_array = [$board.b_knight1.position,  $board.b_rook1.position, $board.b_rook1.position, $board.b_rook2.position, $board.b_queen.position, $board.b_king.position, $board.b_pawn1.position, $board.b_pawn2.position, $board.b_pawn3.position, $board.b_pawn4.position, $board.b_pawn5.position, $board.b_pawn6.position, $board.b_pawn7.position, $board.b_pawn8.position]
    
    end

    def board_validity(x_cord, y_cord)
        $board.board.include?($board.find(x_cord, y_cord)) ? true : false
    end

    #fix
    def empty_validity(x_cord, y_cord)
        if $board.find(x_cord, y_cord).value != "-"
            return false
            puts "Invalid input, you have a piece there"
        else 
            return true
        end
    end

    #def find_white
#
 #   end

end

class Knight < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
  
    def initialize(x_cord, y_cord)
        @symbol = "\u2658"
        @x_cord = x_cord
        @y_cord = y_cord
        @position = [x_cord, y_cord]
        @valid_moves = self.valid_moves
    end

    def valid_moves
        available_moves = []
        available_moves << [@x_cord + 2, @y_cord + 1]
        available_moves << [@x_cord + 2, @y_cord - 1]
        available_moves << [@x_cord + 1, @y_cord - 2]
        available_moves << [@x_cord - 1, @y_cord - 2]
        available_moves << [@x_cord - 2, @y_cord - 1]
        available_moves << [@x_cord - 2, @y_cord + 1]
        available_moves << [@x_cord + 2, @y_cord - 1]
        available_moves << [@x_cord + 2, @y_cord + 1]

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.empty_validity(move[0], move[1])
        end
        @valid_moves
    end
end

class Rook < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
  
    def initialize(x_cord, y_cord)
        @symbol = "\u2656"
        @x_cord = x_cord
        @y_cord = y_cord
        @position = [x_cord, y_cord]
        @valid_moves = self.valid_moves
    end

    def valid_moves
        available_moves = []
        8.downto(1) do |i|
            available_moves << [@x_cord + i, @y_cord]
            available_moves << [@x_cord - i, @y_cord]
            available_moves << [@x_cord, @y_cord + i]
            available_moves << [@x_cord, @y_cord - i]
        end

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.empty_validity(move[0], move[1])
        end
        @valid_moves
    end
end

class Bishop < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
  
    def initialize(x_cord, y_cord)
        @symbol = "\u2657"
        @x_cord = x_cord
        @y_cord = y_cord
        @position = [x_cord, y_cord]
        @valid_moves = self.valid_moves
    end

    def valid_moves
        available_moves = []
        1.upto(8) do |i|
            available_moves << [@x_cord + i, @y_cord + i]
            available_moves << [@x_cord - i, @y_cord - i]
            available_moves << [@x_cord + i, @y_cord - i]
            available_moves << [@x_cord - i, @y_cord + i]
        end

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.empty_validity(move[0], move[1])
        end
        @valid_moves
    end
end

class King < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
  
    def initialize(x_cord, y_cord)
        @symbol = "\u2654"
        @x_cord = x_cord
        @y_cord = y_cord
        @position = [x_cord, y_cord]
        @valid_moves = self.valid_moves
    end

    def valid_moves
        available_moves = []
        available_moves << [@x_cord, @y_cord + 1]
        available_moves << [@x_cord + 1, @y_cord + 1]
        available_moves << [@x_cord + 1, @y_cord]
        available_moves << [@x_cord + 1, @y_cord - 1]
        available_moves << [@x_cord, @y_cord - 1]
        available_moves << [@x_cord - 1, @y_cord - 1]
        available_moves << [@x_cord - 1, @y_cord]
        available_moves << [@x_cord - 1, @y_cord + 1]

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.empty_validity(move[0], move[1])
        end
        @valid_moves
    end
end

class Queen < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
  
    def initialize(x_cord, y_cord)
        @symbol = "\u2655"
        @x_cord = x_cord
        @y_cord = y_cord
        @position = [x_cord, y_cord]
        @valid_moves = self.valid_moves
    end

    def valid_moves
        available_moves = []
        1.upto(8) do |i|
            available_moves << [@x_cord + i, @y_cord + i]
            available_moves << [@x_cord - i, @y_cord - i]
            available_moves << [@x_cord + i, @y_cord - i]
            available_moves << [@x_cord - i, @y_cord + i]
            available_moves << [@x_cord + i, @y_cord]
            available_moves << [@x_cord - i, @y_cord]
            available_moves << [@x_cord, @y_cord + i]
            available_moves << [@x_cord, @y_cord - i]
        end

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.empty_validity(move[0], move[1])
        end
        @valid_moves
    end
end

class W_Pawn < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position
    attr_reader :symbol
  
    def initialize(x_cord, y_cord)
        @symbol = "\u2659"
        @x_cord = x_cord
        @y_cord = y_cord
        @position = [x_cord, y_cord]
        @valid_moves = self.valid_moves
    end

    def valid_moves
        available_moves = []
        available_moves << [@x_cord, @y_cord + 1]
        available_moves << [@x_cord, @y_cord + 2]
        available_moves << [@x_cord + 1, @y_cord + 1]
        available_moves << [@x_cord - 1, @y_cord + 1]

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.empty_validity(move[0], move[1])
        end
        @valid_moves
    end
end

class B_Pawn < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position
    attr_reader :symbol
  
    def initialize(x_cord, y_cord)
        @symbol = "\u265F"
        @x_cord = x_cord
        @y_cord = y_cord
        @position = [x_cord, y_cord]
        @valid_moves = self.valid_moves
    end

    def valid_moves
        available_moves = []
        available_moves << [@x_cord, @y_cord - 1]
        available_moves << [@x_cord, @y_cord - 2]
        available_moves << [@x_cord + 1, @y_cord - 1]
        available_moves << [@x_cord - 1, @y_cord - 1]

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.empty_validity(move[0], move[1])
        end
        @valid_moves
    end
end

$player1 = Player.new('Steven', 'White')
$player2 = Player.new('Lauren', 'Black')
$board = Board.new
$board.design_board
p $b_knight1.valid_moves