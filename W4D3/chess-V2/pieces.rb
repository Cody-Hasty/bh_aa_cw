require 'singleton'
# require_relative "./board.rb"
# require_relative "./slideable_pieces.rb"
# require_relative "./stepable_pieces.rb"



class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    p pos
  end

  def to_s
    self.symbol.to_s
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

class Pawn < Piece
  def initialize(color, board, pos)
    super
    @symbol = :P
  end
  def symbol
    @symbol
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
  
  def symbol
    @symbol = :N
  end
  def moves

  end
end
