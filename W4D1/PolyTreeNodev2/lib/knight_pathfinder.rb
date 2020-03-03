require_relative "00_tree_node.rb"
require "byebug"

class KnightPathFinder
  attr_accessor :root_node, :considered_positions
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
  end

  def self.valid_moves(pos)
    arr = []
    row, col = pos
    pos_moves = [[2,1],[1,2],[-2,1],[-1,2],[-2,-1],[-1,-2],[1,-2],[2,-1]]
    pos_moves.each do |move|
      new_row = row + move[0]
      new_col = col + move[1]
      new_pos = [new_row,new_col]
      if KnightPathFinder.valid_position(new_pos)
        arr << new_pos
      end
    end
    arr
  end

  def self.valid_position(pos)
    row, col = pos
    too_big = row > 7 || col > 7
    too_small = row < 0 || col < 0
    !too_big && !too_small
  end

  def new_move_positions(pos)
    possible_positions = KnightPathFinder.valid_moves(pos)
    possible_positions.reject! {|position| @considered_positions.include?(position)}
    @considered_positions += possible_positions
    possible_positions
  end

  def build_move_tree
    queue = []
    queue << @root_node
    while queue.length > 0
      node = queue.shift
      child_positions = new_move_positions(node.value)
      child_positions.map! do |pos|
        child_node = PolyTreeNode.new(pos)
        node.add_child(child_node)
        child_node
      end
      queue += child_positions
    end
  end

  def find_path(end_pos)
    # end_node = PolyTreeNode.new(end_pos)
    end_node = root_node.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    result = rec_nodes(end_node)

    result.reverse
  end

  def rec_nodes(node) #node.value [4,5],[3,3], [2,1],[0,0]
    return [node.value] if node.value == @root_node.value #[0,0]
    arr = []
    arr += [node.value] + rec_nodes(node.parent) # [4,5] + r([3,3]), [3,3] + r([2,1]), [[2,1],0,0]
  end
end

# p KnightPathFinder.valid_moves([3,4])


