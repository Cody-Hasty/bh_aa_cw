
require "byebug"

class PolyTreeNode
    attr_reader :value, :parent
    attr_accessor :children
    def initialize(val)
        @value = val
        @parent = nil
        @children = []
    end

    def inspect
        "Node: #{value}, Parent: #{parent}, Children: #{children}"
    end

    def parent=(node)
        parent.children.delete(self) unless parent.nil?
        @parent = node
        if node != nil
            node.children << self unless node.children.include?(self)
        end 
    end

    def add_child(child)
        child.parent = self
        self.children << child if !self.children.include?(child)
    end

    def remove_child(child)
        child.parent = nil
        raise "error: not a child!" if !self.children.include?(child)
        self.children.reject! {|el| el == child}
    end


    def dfs(target_value)
        return nil if self == nil
        return self if self.value == target_value

        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end

        nil
    end

    def bfs(target_value) #[1,2]
        queue = []
        queue << self
        until queue.empty?
            curr_node = queue.shift
            return curr_node if curr_node.value == target_value
            queue += curr_node.children    
        end
        nil
    end


end


    