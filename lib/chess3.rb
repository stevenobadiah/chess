require 'pry'

class Player
    attr_accessor :pieces, :in_check
    attr_reader :color, :piece_symbols

    def initialize(color, pieces, piece_symbols)
        @color = color
        @pieces = pieces
        @piece_symbols = piece_symbols
        @in_check = false
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
    attr_accessor :board, :w_knight1, :w_knight2, :w_rook1, :w_rook2, :w_bishop1, :w_bishop2, :w_queen, :w_king, :w_pawn1, :w_pawn2, :w_pawn3, :w_pawn4, :w_pawn5, :w_pawn6, :w_pawn7, :w_pawn8, :w_pieces, :w_pieces_symbols, :b_knight1, :b_knight2, :b_rook1, :b_rook2, :b_bishop1, :b_bishop2, :b_queen, :b_king, :b_pawn1, :b_pawn2, :b_pawn3, :b_pawn4, :b_pawn5, :b_pawn6, :b_pawn7, :b_pawn8, :b_pieces, :b_pieces_symbols
    @@board = []

    def initialize
        @w_knight1 = Knight.new(2, 1)
        @w_knight2 = Knight.new(7, 1)
        @w_rook1 = Rook.new(1, 1)
        @w_rook2 = Rook.new(8, 1)
        @w_bishop1 = Bishop.new(3, 1)
        @w_bishop2 = Bishop.new(6, 1)
        @w_queen = Queen.new(4, 1)
        @w_king = King.new(5, 1)
        @w_pawn1 = W_Pawn.new(1, 2)
        @w_pawn2 = W_Pawn.new(2, 2)
        @w_pawn3 = W_Pawn.new(3, 2)
        @w_pawn4 = W_Pawn.new(4, 2)
        @w_pawn5 = W_Pawn.new(5, 2)
        @w_pawn6 = W_Pawn.new(6, 2)
        @w_pawn7 = W_Pawn.new(7, 2)
        @w_pawn8 = W_Pawn.new(8, 2)


        @b_knight1 = Knight.new(2, 8)
        @b_knight2 = Knight.new(7, 8)
        @b_rook1 = Rook.new(1, 8)
        @b_rook2 = Rook.new(8, 8)
        @b_bishop1 = Bishop.new(3, 8)
        @b_bishop2 = Bishop.new(6, 8)
        @b_queen = Queen.new(4, 8)
        @b_king = King.new(5, 8)
        @b_pawn1 = B_Pawn.new(1, 7)
        @b_pawn2 = B_Pawn.new(2, 7)
        @b_pawn3 = B_Pawn.new(3, 7)
        @b_pawn4 = B_Pawn.new(4, 7)
        @b_pawn5 = B_Pawn.new(5, 7)
        @b_pawn6 = B_Pawn.new(6, 7)
        @b_pawn7 = B_Pawn.new(7, 7)
        @b_pawn8 = B_Pawn.new(8, 7)

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
                @@board << tile
            end
        end
    end

    def self.find(x, y)
        @@board.each do |tile|
            return tile if tile.x_cord == x && tile.y_cord == y
        end
    end

    def setup
        @b_knight1.symbol = "\u2658"
        @b_knight2.symbol = "\u2658"
        @b_rook1.symbol = "\u2656"
        @b_rook2.symbol = "\u2656"
        @b_bishop1.symbol = "\u2657"
        @b_bishop2.symbol = "\u2657"
        @b_queen.symbol = "\u2655"
        @b_king.symbol = "\u2654"
        @w_pieces = [@w_knight1, @w_knight2, @w_rook1, @w_rook2, @w_bishop1, @w_bishop2, @w_queen, @w_king, @w_pawn1, @w_pawn2, @w_pawn3, @w_pawn4, @w_pawn5, @w_pawn6, @w_pawn7, @w_pawn8]
        @w_pieces_symbols = [@w_knight1.symbol, @w_knight2.symbol, @w_rook1.symbol, @w_rook2.symbol, @w_bishop1.symbol, @w_bishop2.symbol, @w_queen.symbol, @w_king.symbol, @w_pawn1.symbol, @w_pawn2.symbol, @w_pawn3.symbol, @w_pawn4.symbol, @w_pawn5.symbol, @w_pawn6.symbol, @w_pawn7.symbol, @w_pawn8.symbol]
        @b_pieces = [@b_knight1, @b_knight2, @b_rook1, @b_rook2, @b_bishop1, @b_bishop2, @b_queen, @b_king, @b_pawn1, @b_pawn2, @b_pawn3, @b_pawn4, @b_pawn5, @b_pawn6, @b_pawn7, @b_pawn8]
        @b_pieces_symbols = [@b_knight1.symbol, @b_knight2.symbol, @b_rook1.symbol, @b_rook2.symbol, @b_bishop1.symbol, @b_bishop2.symbol, @b_queen.symbol, @b_king.symbol, @b_pawn1.symbol, @b_pawn2.symbol, @b_pawn3.symbol, @b_pawn4.symbol, @b_pawn5.symbol, @b_pawn6.symbol, @b_pawn7.symbol, @b_pawn8.symbol]

        Board.find(2, 1).value = @w_knight1.symbol
        Board.find(7, 1).value = @w_knight2.symbol
        Board.find(1, 1).value = @w_rook1.symbol
        Board.find(8, 1).value = @w_rook2.symbol
        Board.find(3, 1).value = @w_bishop1.symbol
        Board.find(6, 1).value = @w_bishop2.symbol
        Board.find(4, 1).value = @w_queen.symbol
        Board.find(5, 1).value = @w_king.symbol
        Board.find(1, 2).value = @w_pawn1.symbol
        Board.find(2, 2).value = @w_pawn2.symbol
        Board.find(3, 2).value = @w_pawn3.symbol
        Board.find(4, 2).value = @w_pawn4.symbol
        Board.find(5, 2).value = @w_pawn5.symbol
        Board.find(6, 2).value = @w_pawn6.symbol
        Board.find(7, 2).value = @w_pawn7.symbol
        Board.find(8, 2).value = @w_pawn8.symbol

        Board.find(2, 8).value = @b_knight1.symbol
        Board.find(7, 8).value = @b_knight2.symbol
        Board.find(1, 8).value = @b_rook1.symbol
        Board.find(8, 8).value = @b_rook2.symbol
        Board.find(3, 8).value = @b_bishop1.symbol
        Board.find(6, 8).value = @b_bishop2.symbol
        Board.find(4, 8).value = @b_queen.symbol
        Board.find(5, 8).value = @b_king.symbol
        Board.find(1, 7).value = @b_pawn1.symbol
        Board.find(2, 7).value = @b_pawn2.symbol
        Board.find(3, 7).value = @b_pawn3.symbol
        Board.find(4, 7).value = @b_pawn4.symbol
        Board.find(5, 7).value = @b_pawn5.symbol
        Board.find(6, 7).value = @b_pawn6.symbol
        Board.find(7, 7).value = @b_pawn7.symbol
        Board.find(8, 7).value = @b_pawn8.symbol
    end

    def print_board
        separator = '  +---+---+---+---+---+---+---+---+'
        letters = '    A   B   C   D   E   F   G   H  '
        puts letters
        puts separator
        8.downto(1) do |y|
            puts "#{y} | #{Board.find(1, y).value} | #{Board.find(2, y).value} | #{Board.find(3, y).value} | #{Board.find(4, y).value} | #{Board.find(5, y).value} | #{Board.find(6, y).value} | #{Board.find(7, y).value} | #{Board.find(8, y).value} | #{y}"
            puts separator
        end
        puts letters
        puts "Player 1 dead pieces: #{Game.class_variable_get(:@@player1_dead_pieces)}"
        puts "Player 2 dead pieces: #{Game.class_variable_get(:@@player2_dead_pieces)}"
    end
end

class Pieces

    def board_validity(x_cord, y_cord)
        Board.class_variable_get(:@@board).include?(Board.find(x_cord, y_cord)) ? true : false
    end

    def move_up(x_cord, y_cord); return [x_cord, y_cord + 1] end
    def move_down(x_cord, y_cord); return [x_cord, y_cord - 1] end
    def move_left(x_cord, y_cord); return [x_cord - 1, y_cord] end
    def move_right(x_cord, y_cord); return [x_cord + 1, y_cord] end
    def move_up_right(x_cord, y_cord); return [x_cord + 1, y_cord + 1] end
    def move_up_left(x_cord, y_cord); return [x_cord - 1, y_cord + 1] end
    def move_down_right(x_cord, y_cord); return [x_cord + 1, y_cord - 1] end
    def move_down_left(x_cord, y_cord); return [x_cord - 1, y_cord - 1] end

    def move_up_path(x_cord, y_cord)
        new_cord = self.move_up(x_cord, y_cord)
        if self.board_validity(new_cord[0], new_cord[1])
            if self.check_same_team(new_cord[0], new_cord[1]) == false
                @valid_moves << new_cord
                if self.check_other_team(new_cord[0], new_cord[1]) == false
                    move_up_path(new_cord[0], new_cord[1])
                end
            end
        end
    end

    def move_down_path(x_cord, y_cord)
        new_cord = self.move_down(x_cord, y_cord)
        if self.board_validity(new_cord[0], new_cord[1])
            if self.check_same_team(new_cord[0], new_cord[1]) == false
                @valid_moves << new_cord
                if self.check_other_team(new_cord[0], new_cord[1]) == false
                    move_down_path(new_cord[0], new_cord[1])
                end
            end
        end
    end

    def move_left_path(x_cord, y_cord)
        new_cord = self.move_left(x_cord, y_cord)
        if self.board_validity(new_cord[0], new_cord[1])
            if self.check_same_team(new_cord[0], new_cord[1]) == false
                @valid_moves << new_cord
                if self.check_other_team(new_cord[0], new_cord[1]) == false
                    move_left_path(new_cord[0], new_cord[1])
                end
            end
        end
    end

    def move_right_path(x_cord, y_cord)
        new_cord = self.move_right(x_cord, y_cord)
        if self.board_validity(new_cord[0], new_cord[1])
            if self.check_same_team(new_cord[0], new_cord[1]) == false
                @valid_moves << new_cord
                if self.check_other_team(new_cord[0], new_cord[1]) == false
                    move_right_path(new_cord[0], new_cord[1])
                end
            end
        end
    end

    def move_up_right_path(x_cord, y_cord)
        new_cord = self.move_up_right(x_cord, y_cord)
        if self.board_validity(new_cord[0], new_cord[1])
            if self.check_same_team(new_cord[0], new_cord[1]) == false
                @valid_moves << new_cord
                if self.check_other_team(new_cord[0], new_cord[1]) == false
                    move_up_right_path(new_cord[0], new_cord[1])
                end
            end
        end
    end

    def move_up_left_path(x_cord, y_cord)
        new_cord = self.move_up_left(x_cord, y_cord)
        if self.board_validity(new_cord[0], new_cord[1])
            if self.check_same_team(new_cord[0], new_cord[1]) == false
                @valid_moves << new_cord
                if self.check_other_team(new_cord[0], new_cord[1]) == false
                    move_up_left_path(new_cord[0], new_cord[1])
                end
            end
        end
    end

    def move_down_right_path(x_cord, y_cord)
        new_cord = self.move_down_right(x_cord, y_cord)
        if self.board_validity(new_cord[0], new_cord[1])
            if self.check_same_team(new_cord[0], new_cord[1]) == false
                @valid_moves << new_cord
                if self.check_other_team(new_cord[0], new_cord[1]) == false
                    move_down_right_path(new_cord[0], new_cord[1])
                end
            end
        end
    end

    def move_down_left_path(x_cord, y_cord)
        new_cord = self.move_down_left(x_cord, y_cord)
        if self.board_validity(new_cord[0], new_cord[1])
            if self.check_same_team(new_cord[0], new_cord[1]) == false
                @valid_moves << new_cord
                if self.check_other_team(new_cord[0], new_cord[1]) == false
                    move_down_left_path(new_cord[0], new_cord[1])
                end
            end
        end
    end

    def check_same_team(x_cord, y_cord)
        new_cords_symbol = Board.find(x_cord, y_cord).value

        if Game.class_variable_get(:@@round).odd?
            same_team_symbols = $game.player1.piece_symbols
        else
            same_team_symbols = $game.player2.piece_symbols
        end
        
        if same_team_symbols.include? new_cords_symbol
            return true
        else 
            return false
        end
    end

    def check_other_team(x_cord, y_cord)
        new_cords_symbol = Board.find(x_cord, y_cord).value
        
        if Game.class_variable_get(:@@round).odd?
            other_team_symbols = $game.player2.piece_symbols
        else
            other_team_symbols = $game.player1.piece_symbols
        end
        
        if other_team_symbols.include? new_cords_symbol
            return true
        else 
            return false
        end
    end

    def promote_piece(x_cord, y_cord)
        begin
            puts "Select a promotion: K - Knight ; R - Rook ; B - Bishop ; Q - Queen"
            selection = gets.chomp.upcase
            valid_promotions = ['K', 'R', 'B', 'Q']
            raise if valid_promotions.include? selection == false

            if Game.class_variable_get(:@@round).odd?
                if selection == 'K'
                    @w_knight3 = Knight.new(x_cord, y_cord)
                    new_piece = @w_knight3
                elsif selection == 'R'
                    @w_rook3 = Rook.new(x_cord, y_cord)
                    new_piece = @w_rook3
                elsif selection == 'B'
                    @w_bishop3 = Bishop.new(x_cord, y_cord)
                    new_piece = @w_bishop3
                elsif selection == 'Q'
                    @w_queen2 = Queen.new(x_cord, y_cord)
                    new_piece = @w_queen2
                end
                $game.instance_variable_get(:@player1).pieces.delete($game.find($game.instance_variable_get(:@player1).pieces, x_cord, y_cord))
                $game.instance_variable_get(:@player1).pieces.append(new_piece)
            else
                if selection == 'K'
                    @b_knight3 = Knight.new(x_cord, y_cord)
                    @b_knight3.symbol = "\u2658"
                    new_piece = @b_knight3
                elsif selection == 'R'
                    @b_rook3 = Rook.new(x_cord, y_cord)
                    @b_rook3.symbol = "\u2656"
                    new_piece = @b_rook3
                elsif selection == 'B'
                    @b_bishop3 = Bishop.new(x_cord, y_cord)
                    @b_bishop3.symbol = "\u2657"
                    new_piece = @b_bishop3
                elsif selection == 'Q'
                    @b_queen2 = Queen.new(x_cord, y_cord)
                    @b_queen2.symbol = "\u2655"
                    new_piece = @b_queen2
                end
                $game.instance_variable_get(:@player2).pieces.delete($game.find($game.instance_variable_get(:@player2).pieces, x_cord, y_cord))
                $game.instance_variable_get(:@player2).pieces.append(new_piece)
            end

            Board.find(x_cord, y_cord).value = new_piece.symbol
        rescue
            puts "Invalid selection\n\n"
            retry
        end
    end
end

class Knight < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
    attr_reader :type
  
    def initialize(x_cord, y_cord)
        @symbol = "\u265E"
        @x_cord = x_cord
        @y_cord = y_cord
        @type = 'knight'
    end

    def valid_moves_check(x_cord, y_cord)
        available_moves = []
        available_moves << [x_cord + 2, y_cord + 1]
        available_moves << [x_cord + 2, y_cord - 1]
        available_moves << [x_cord + 1, y_cord - 2]
        available_moves << [x_cord - 1, y_cord - 2]
        available_moves << [x_cord - 2, y_cord - 1]
        available_moves << [x_cord - 2, y_cord + 1]
        available_moves << [x_cord - 1, y_cord + 2]
        available_moves << [x_cord + 1, y_cord + 2]

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.check_same_team(move[0], move[1]) == false
        end
        @valid_moves
    end
end

class Rook < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
    attr_reader :type
  
    def initialize(x_cord, y_cord)
        @symbol = "\u265C"
        @x_cord = x_cord
        @y_cord = y_cord
        @type = 'rook'
    end

    def valid_moves_check(x_cord, y_cord)

        @valid_moves = []

        self.move_up_path(x_cord, y_cord)
        self.move_down_path(x_cord, y_cord)
        self.move_left_path(x_cord, y_cord)
        self.move_right_path(x_cord, y_cord)

        @valid_moves
    end
end

class Bishop < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
    attr_reader :type
  
    def initialize(x_cord, y_cord)
        @symbol = "\u265D"
        @x_cord = x_cord
        @y_cord = y_cord
        @type = 'bishop'
    end

    def valid_moves_check(x_cord, y_cord)

        @valid_moves = []

        self.move_up_right_path(x_cord, y_cord)
        self.move_up_left_path(x_cord, y_cord)
        self.move_down_right_path(x_cord, y_cord)
        self.move_down_left_path(x_cord, y_cord)

        @valid_moves
    end
end

class King < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol, :first_move
    attr_reader :type
  
    def initialize(x_cord, y_cord)
        @symbol = "\u265A"
        @x_cord = x_cord
        @y_cord = y_cord
        @type = 'king'
        @first_move = true
    end

    def valid_moves_check(x_cord, y_cord)
        available_moves = []
        available_moves << [x_cord, y_cord + 1]
        available_moves << [x_cord + 1, y_cord + 1]
        available_moves << [x_cord + 1, y_cord]
        available_moves << [x_cord + 1, y_cord - 1]
        available_moves << [x_cord, y_cord - 1]
        available_moves << [x_cord - 1, y_cord - 1]
        available_moves << [x_cord - 1, y_cord]
        available_moves << [x_cord - 1, y_cord + 1]

        #  DIS IS TO CASTLE KING, PATH CANT BE BLOCKED BY ROOK ON OPPOSING SIDE THO, ALSO THIS NEEDS TO BE ON THE KING AND ROOKS' FIRST MOVE
        if Game.class_variable_get(:@@round).odd?
            if self.first_move == true && Board.find(6, 1).value == "-" && Board.find(7, 1).value == "-" && Board.find(8, 1).value == "\u265C"
                available_moves << [x_cord + 2, y_cord]
            elsif self.first_move == true && Board.find(4, 1).value == "-" && Board.find(3, 1).value == "-" && Board.find(2, 1).value == "-" && Board.find(1, 1).value == "\u265C"
                available_moves << [x_cord - 2, y_cord]
            end
        else
            if self.first_move == true && Board.find(6, 8).value == "-" && Board.find(7, 8).value == "-" && Board.find(8, 8).value == "\u2656"
                available_moves << [x_cord + 2, y_cord]
            elsif self.first_move == true && Board.find(4, 8).value == "-" && Board.find(3, 8).value == "-" && Board.find(2, 8).value == "-" && Board.find(1, 8).value == "\u2656"
                available_moves << [x_cord - 2, y_cord]
            end
        end

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if self.board_validity(move[0], move[1]) && self.check_same_team(move[0], move[1]) == false
        end
        @valid_moves
    end
end

class Queen < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
    attr_reader :type
  
    def initialize(x_cord, y_cord)
        @symbol = "\u265B"
        @x_cord = x_cord
        @y_cord = y_cord
        @type = 'queen'
    end

    def valid_moves_check(x_cord, y_cord)

        @valid_moves = []

        self.move_up_path(x_cord, y_cord)
        self.move_down_path(x_cord, y_cord)
        self.move_left_path(x_cord, y_cord)
        self.move_right_path(x_cord, y_cord)
        self.move_up_right_path(x_cord, y_cord)
        self.move_up_left_path(x_cord, y_cord)
        self.move_down_right_path(x_cord, y_cord)
        self.move_down_left_path(x_cord, y_cord)

        @valid_moves
    end
end

class W_Pawn < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
    attr_reader :type
  
    def initialize(x_cord, y_cord)
        @symbol = "\u265F"
        @x_cord = x_cord
        @y_cord = y_cord
        @type = 'pawn'
    end

    def valid_moves_check(x_cord, y_cord)
        @valid_moves = []
        @valid_moves << [x_cord, y_cord + 1] if self.check_same_team(x_cord, y_cord + 1) == false && self.check_other_team(x_cord, y_cord + 1) == false
        @valid_moves << [x_cord, y_cord + 2] if y_cord == 2 && self.check_same_team(x_cord, y_cord + 2) == false && self.check_other_team(x_cord, y_cord + 1) == false
        @valid_moves << [x_cord + 1, y_cord + 1] if self.board_validity(x_cord + 1, y_cord + 1) && self.check_other_team(x_cord + 1, y_cord + 1)
        @valid_moves << [x_cord - 1, y_cord + 1] if self.board_validity(x_cord - 1, y_cord + 1) && self.check_other_team(x_cord - 1, y_cord + 1)
        @valid_moves
    end
end

class B_Pawn < Pieces
    attr_accessor :valid_moves, :x_cord, :y_cord, :position, :symbol
    attr_reader :type
  
    def initialize(x_cord, y_cord)
        @symbol = "\u2659"
        @x_cord = x_cord
        @y_cord = y_cord
        @type = 'pawn'
    end

    def valid_moves_check(x_cord, y_cord)
        @valid_moves = []
        @valid_moves << [x_cord, y_cord - 1] if self.check_same_team(x_cord, y_cord - 1) == false && self.check_other_team(x_cord, y_cord - 1) == false
        @valid_moves << [x_cord, y_cord - 2] if y_cord == 7 && self.check_same_team(x_cord, y_cord - 2) == false && self.check_other_team(x_cord, y_cord - 2) == false
        @valid_moves << [x_cord + 1, y_cord - 1] if self.board_validity(x_cord + 1, y_cord - 1) && self.check_other_team(x_cord + 1, y_cord - 1)
        @valid_moves << [x_cord - 1, y_cord - 1] if self.board_validity(x_cord - 1, y_cord - 1) && self.check_other_team(x_cord - 1, y_cord - 1)
        @valid_moves
    end
end

class Game
    attr_reader :round, :player1, :player2
    @@round = 1
    @@player1_dead_pieces = []
    @@player2_dead_pieces = []

    def initialize
        @board = Board.new
        @board.design_board
        @player1 = Player.new('White', @board.w_pieces, @board.w_pieces_symbols)
        @player2 = Player.new('Black', @board.b_pieces, @board.b_pieces_symbols)
    end

    def take_turn(player)
        letter_conversion = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8}

        if Game.class_variable_get(:@@round).odd?
            @current_player = @player1
            @current_opponent = @player2
        else
            @current_player = @player2
            @current_opponent = @player1
        end

        def valid_move?(x)
            if x < 1 || x > 8
                return false
            else
                return true
            end
        end

        def find(pieces, x, y)
            pieces.each do |piece|
                return piece if piece.x_cord == x && piece.y_cord == y
            end
        end

        def castling?(piece, new_x_cord)
            pieces = @current_player.pieces

            if piece.symbol == "\u265A"
                if new_x_cord == 7
                    rook = self.find(pieces, 8, 1)
                    Board.find(8, 1).value = "-"
                    rook.x_cord = 6
                    Board.find(6, 1).value = rook.symbol
                elsif new_x_cord == 3
                    rook = self.find(pieces, 1, 1)
                    Board.find(1, 1).value = "-"
                    rook.x_cord = 4
                    Board.find(4, 1).value = rook.symbol
                end
            elsif piece.symbol == "\u2654"
                if new_x_cord == 7
                    rook = self.find(pieces, 8, 8)
                    Board.find(8, 8).value = "-"
                    rook.x_cord = 6
                    Board.find(6, 8).value = rook.symbol
                elsif new_x_cord == 3
                    rook = self.find(pieces, 1, 8)
                    Board.find(1, 8).value = "-"
                    rook.x_cord = 4
                    Board.find(4, 8).value = rook.symbol
                end
            end      
        end

        def move_piece(piece, new_x_cord, new_y_cord)
            if piece.valid_moves.include? [new_x_cord, new_y_cord]
                if piece.check_other_team(new_x_cord, new_y_cord) == true
                    if @@round.odd?
                        @@player2_dead_pieces.append(find(@player2.pieces, new_x_cord, new_y_cord).symbol)
                        @player2.pieces.delete(find(@player2.pieces, new_x_cord, new_y_cord))
                    else
                        @@player1_dead_pieces.append(find(@player1.pieces, new_x_cord, new_y_cord).symbol)
                        @player1.pieces.delete(find(@player1.pieces, new_x_cord, new_y_cord))
                    end
                end

                if piece.symbol == "\u265A" || piece.symbol == "\u2654"
                    $game.castling?(piece, new_x_cord)
                    piece.first_move == false
                end

                Board.find(piece.x_cord, piece.y_cord).value = "-"
                piece.x_cord = new_x_cord
                piece.y_cord = new_y_cord
                Board.find(new_x_cord, new_y_cord).value = piece.symbol

                if (piece.symbol == "\u265F" && new_y_cord == 8) || (piece.symbol == "\u2659" && new_y_cord == 1)
                    piece.promote_piece(new_x_cord, new_y_cord)
                end
            else
                raise
            end
        end

        def check_incheck(attacker, defender)
            pieces = attacker.pieces
            other_pieces = defender.pieces
            num_in_check = 0

            king = nil
            other_pieces.each do |piece|
                if piece.type == 'king'
                    king = piece
                end
            end

            pieces.each do |piece|
                piece.valid_moves_check(piece.x_cord, piece.y_cord)
                if piece.valid_moves.include? [king.x_cord, king.y_cord]
                    num_in_check += 1
                end
            end

            if num_in_check > 0
                return true
            else
                return false
            end
        end

        def leave_check
            puts "Get out of check!"
            @valid_check_moves = {}
            pieces = @current_player.pieces
            pieces.each do |piece|
                piece.valid_moves_check(piece.x_cord, piece.y_cord)
                piece.valid_moves.each do |move|
                    target_value = Board.find(move[0], move[1]).value
                    x_save = piece.x_cord
                    y_save = piece.y_cord
    
                    Board.find(piece.x_cord, piece.y_cord).value = "-"
                    piece.x_cord = move[0]
                    piece.y_cord = move[1]
                    Board.find(piece.x_cord, piece.y_cord).value = piece.symbol

                    @@round += 1
                    if check_incheck(@current_opponent, @current_player) == false
                        if @valid_check_moves.key?([x_save, y_save])
                            @valid_check_moves[[x_save, y_save]] = [@valid_check_moves[[x_save, y_save]], [move[0], move[1]]]
                        else
                            @valid_check_moves[[x_save, y_save]] = [move[0], move[1]]
                        end
                    end
                    @@round -= 1

                    Board.find(piece.x_cord, piece.y_cord).value = target_value
                    piece.x_cord = x_save
                    piece.y_cord = y_save
                    Board.find(piece.x_cord, piece.y_cord).value = piece.symbol
                end
            end
            if @valid_check_moves.length == 0
                self.end_game
            end
            puts "\nYour available moves: #{@valid_check_moves}"

            #letter_conversion2 = {1 => 'a', 2 => 'b', 3 => 'c', 4 => 'd', 5 => 'e', 6 => 'f', 7 => 'g', 8 => 'h'}
            #@valid_check_moves.keys.map { |x, y| letter_conversion2[x]+ y.to_s}
            #@valid_check_moves.values.map { |x, y| letter_conversion2[x]+ y.to_s}
            #puts "\nYour available moves: #{@valid_check_moves}"
        end

        def end_game
            puts "#{@current_opponent.color} wins!"
            exit
        end

        begin
            if @current_player.in_check == true
                self.leave_check
                #p @valid_check_moves.keys

                puts "It is #{player.color}\'s turn. Which piece do you want? (ex. a5)"
                selected_piece = gets.chomp
                x_coordinate = letter_conversion[selected_piece[0].downcase]
                y_coordinate = selected_piece[1].to_i
                pieces = player.pieces
                piece = self.find(pieces, x_coordinate, y_coordinate)

                raise if @valid_check_moves.keys.include?([x_coordinate, y_coordinate]) == false
            else
                puts "It is #{player.color}\'s turn. Which piece do you want? (ex. a5)"
                selected_piece = gets.chomp
                x_coordinate = letter_conversion[selected_piece[0].downcase]
                y_coordinate = selected_piece[1].to_i
                pieces = player.pieces
                piece = self.find(pieces, x_coordinate, y_coordinate)

                letter_conversion2 = {1 => 'a', 2 => 'b', 3 => 'c', 4 => 'd', 5 => 'e', 6 => 'f', 7 => 'g', 8 => 'h'}
                puts "\nYour available moves: #{piece.valid_moves_check(piece.x_cord, piece.y_cord).map { |x, y| letter_conversion2[x]+ y.to_s}}"

                raise if self.valid_move?(x_coordinate) == false || self.valid_move?(y_coordinate) == false || pieces.include?(piece) == false || piece.valid_moves == []
            end
        rescue
            puts "Invalid selection\n\n"
            retry
        end

        begin
            puts "What coordinate do you want to move to? (ex. a5)"
            puts "Type \'back\' to choose a different piece"
            target = gets.chomp
            #CHECK THIS IF THE GAME NEVER ENDS
            if target.downcase == 'back'
                @board.print_board
                $game.play
            end
            x_coordinate = letter_conversion[target[0].downcase]
            y_coordinate = target[1].to_i

            if @current_player.in_check
                raise if @valid_check_moves[[piece.x_cord, piece.y_cord]].include?([x_coordinate, y_coordinate]) == false
            end

            self.move_piece(piece, x_coordinate, y_coordinate)
            if self.check_incheck(@current_player, @current_opponent)
                print "king is in check\n"
                @current_opponent.in_check = true
            end
            @current_player.in_check = false
            @@round += 1
        rescue
            puts "Invalid selection\n\n"
            retry
        end
    end

    def play
        while true
            if @@round.odd?
                take_turn(player1)
                @board.print_board
            else
                take_turn(player2)
                @board.print_board
            end
        end
    end
end

$game = Game.new
$game.play