require_relative "./pieces.rb"

module Stepable
  KNIGHT_ARR = [
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1]
  ]
  KING_ARR = [
    [0, 1],
    [1, 1],
    [1, 0],
    [-1, -1],
    [-1, 0],
    [0, -1],
    [-1, 1],
    [1, -1]
  ]

  def moves
    x, y = self.pos
    knight_move = []
    king_move = []
    KNIGHT_ARR.each{|dx, dy| knight_move << [x + dx, y + dy]}
    KING_ARR.each{|dx, dy| king_move << [x + dx, y + dy] }

  end

  def move_diffs
    raise "This move is not within your class!"
  end

end

class King < Piece
  include Stepable
  def initialize(color, board, pos)
    super
    @symbol = :K
  end
  def symbol
    @symbol
  end
  
  def move_diffs

  end
end

class Knight < Piece
  include Stepable
  def initialize(color, board, pos)
    super
    @symbol = :I
  end

  def symbol
    @symbol
  end

  def move_diffs

  end
end


