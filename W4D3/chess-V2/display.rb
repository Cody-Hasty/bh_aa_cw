require 'colorize'
require_relative "./cursor.rb"
require_relative "./board.rb"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    @cursor.blue
    @cursor.get_input
    @board.each do |row|
      row.each do |ele|
        p ele.to_s + " "
      end
      puts
    end
  end

end