require_relative "./pieces.rb"
module Slideable
  HORIZONTAL_DIRS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]
  DIAGONAL_DIRS = [
    [1,1],
    [-1, -1],
    [-1, 1],
    [1, -1]

  ]
 
  def grow_unblocked_moves_in_dir(dx, dy)
    arr = []
    x, y = self.pos
    while x > -1 && y > -1 && x < 8 && y < 8
      move_to = [x + dx, y + dy]
      if self.board.valid_pos?(move_to)
      arr << move_to
      end
      x, y = move_to
    end
    arr
  end

  def moves
    horizontal_arr = HORIZONTAL_DIRS.each{|x,y| grow_unblocked_moves_in_dir(x,y)}
    diagonal_arr = DIAGONAL_DIRS.each{|x,y| grow_unblocked_moves_in_dir(x,y)}



  end
  def move_dirs
    raise "This move is not within your class!"

  end

end

class Rook < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @symbol = :R
  end
  def symbol
      @symbol
  end
  def move_dirs

  end
end

class Bishop < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @symbol = :B
  end
  def symbol
    @symbol
  end
  def move_dirs

  end
end

class Queen < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @symbol = :Q
  end
  def symbol
    @symbol
  end
  def move_dirs

  end
end