require_relative "./board.rb"

module Slideable
  HORIZONTAL_DIRS = [
    [0, 1]
    [0, -1]
    [1, 0]
    [-1, 0]
  ]
  DIAGONAL_DIRS = [
    [1,1]
    [-1, -1]
    [-1, 1]
    [1, -1]

  ]
  def horizontal_dirs


  end
  def diagonal_dirs

  end
  def grow_unblocked_moves_in_dir(dx, dy)

  end
  def moves(direction)

  end
  def move_dirs

  end

end

module Stepable
  def moves

  end
  def move_diffs

  end

end


class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end



  def to_s
  end

  def empty?
  end

  def valid_moves
  end

  def position=(val)
  end

  def symbol
  end

  def move_into_check?(end_pos)
  end

end
class Rook < Piece
  include Slideable
  def symbol

  end
  def move_dirs

  end
end
class Bishop < Piece
  include Slideable
  def symbol

  end
  def move_dirs

  end
end
class Queen < Piece
  include Slideable
  def symbol

  end
  def move_dirs

  end
end
class King < Piece
  include Stepable
  def symbol

  end
  def move_diffs

  end
end
class Knight < Piece
  include Stepable
  def symbol

  end
  def move_diffs

  end
end
class Pawn < Piece
  def symbol

  end
  def move_dirs

  end
  def at_start_row?

  end
  def forward_dir

  end
  def forward_steps

  end
  def side_attacks

  end
end
class NullPiece < Piece
  include Singleton
  def initialize

  end
  def symbol

  end
  def moves

  end
end
class