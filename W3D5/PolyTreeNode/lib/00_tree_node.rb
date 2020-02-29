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
        "Node: #{value}, Parent: #{parent}, dChildren: #{children}"
    end

    def parent=(node)
        temp = []
        @parent.children.each do |child|
            if child != self
                temp << child
            end
        end
        @parent.children = temp
        # @parent.children.reject! {|child| child == self}
        @parent = node
        if @parent == nil
            return @parent = nil
        end
        
        if !node.children.include?(self)
            node.children << self
        end


    end

    # def parent=(node)



        # # we need grandparents to adopt??
        # if @parent != nil #&& node.parent != nil 
        #     # debugger
        #     # old_parent.children.select! {|child| child != self}
        #     @parent.children.reject! {|child| child == self} # sign over parental rights
        # end

        # if node == nil      # make the kid an orphan
        #     @parent = nil
        # end
        
        # if @parent != node    # adopt the child
        #     node.children << self
        # end

        # @parent = node
    # end

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
        #result = nil #not needed if using other approach
        # debugger
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        # result ||= self.children[0].dfs(target_value)
        # if result == nil && self.children.length > 1
        #     result ||= self.children[1].dfs(target_value)
        # end  
        nil
    end


end
    # child.parent is the old parent at the beginning (could be nil)
    # node is the new parent
    # we set node as the parent inside child
    # we remove child from the old parent


    