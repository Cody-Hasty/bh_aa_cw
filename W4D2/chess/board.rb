class Board
  attr_accessor :rows
  def initialize
    @rows= Array.new(8){Array.new(8)}
    @sentinel #NullPiece
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