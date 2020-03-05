require_relative "./pieces.rb"

class Board
  attr_accessor :rows
  ROOKS = [[0,7], [7,7], [0,0], [7,0]]
  KNIGHTS = [[7,1], [7,6], [0,1], [0,6]]
  BISHOPS = [[7,2], [7,5], [0,2], [0,5]]
  QUEENS = [[7,3], [0,3]]
  KINGS = [[7,4], [0,4]]

  def initialize
    @rows= Array.new(8){Array.new(8)}
    @sentinel #NullPiece
    
    color = ""
    @rows.each_with_index do |row, i|
      if i == 1 || i == 6
         i == 1 ? color = "white" : color = "black"
        row.each_with_index do |pos, j|
          self.add_piece(Pawn.new(color, self, [i, j]),[i,j])
        end
      elsif i == 2 || i == 3 || i == 4 || i == 5
          row.each_with_index do |pos, j|
            self.add_piece(NullPiece.instance,[i,j])
          end
      end
    end

    ROOKS.each do |pos| 
      if pos[0] == 0
        self.add_piece(Rook.new("white", self, pos), pos)
      else
        self.add_piece(Rook.new("black", self, pos), pos)
      end
    end

    BISHOPS.each do |pos| 
      if pos[0] == 0
        self.add_piece(Bishop.new("white", self, pos), pos)
      else
        self.add_piece(Bishop.new("black", self, pos), pos)
      end
    end

    KNIGHTS.each do |pos| 
      if pos[0] == 0
        self.add_piece(Knight.new("white", self, pos), pos)
      else
        self.add_piece(Knight.new("black", self, pos), pos)
      end
    end

    QUEENS.each do |pos| 
      if pos[0] == 0
        self.add_piece(Queen.new("white", self, pos), pos)
      else
        self.add_piece(Queen.new("black", self, pos), pos)
      end
    end

    KINGS.each do |pos| 
      if pos[0] == 0
        self.add_piece(King.new("white", self, pos), pos)
      else
        self.add_piece(King.new("black", self, pos), pos)
      end
    end



    # KNIGHTS.each{|pos| pos[0] == 0? Knight.new("white", self, pos) : Knight.new("black", self, pos)}
    # BISHOPS.each{|pos| pos[0] == 0? Bishop.new("white", self, pos) : Bishop.new("black", self, pos)}
    # QUEENS.each{|pos| pos[0] == 0? Queen.new("white", self, pos) : Queen.new("black", self, pos)}
    # KINGS.each{|pos| pos[0] == 0? King.new("white", self, pos) : King.new("black", self, pos)}


  end

  def [](pos)
    self.rows[pos[0]][pos[1]]
  end

  def []=(pos, val)
    row, col = pos
    self.rows[row][col] = val
  end

  def move_piece(start_pos, end_pos, color = nil)
    if self[start_pos] == nil? || !valid_pos?(end_pos)
      raise
    else
      self[end_pos] = self[start_pos] 
      self[start_pos] = nil
    end

  end

  def valid_pos?(pos)
    if (0..7).to_a.include?(pos[0]) &&
      (0..7).to_a.include?(pos[1]) &&
      self[pos] == nil
      return true
    else
      return false
    end
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end
end