# Solution for leetcode.com problem #104
# https://leetcode.com/problems/maximum-depth-of-binary-tree/

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
  
def max_depth(root)
    depth = 0
    # @root can be nil, which is a tree of depth 0.
    xs = [root]
    while xs.size > 0
        ys = []
        occupied = false
        i = 0
        while i < xs.size
            if xs[i] != nil
                occupied = true
                ys.push(xs[i].left)
                ys.push(xs[i].right)
            end
            i += 1
        end
        if occupied == true
            depth += 1
        end
        xs = ys
    end
    depth
end

raise "dead" if !(max_depth(nil) == 0)

root = TreeNode.new(8)
raise "dead" if !(max_depth(root) == 1)

root = TreeNode.new(7, TreeNode.new(2), nil)
raise "dead" if !(max_depth(root) == 2)

root = TreeNode.new(7, nil, TreeNode.new(2))
raise "dead" if !(max_depth(root) == 2)

root = TreeNode.new(7, TreeNode.new(3), TreeNode.new(2))
raise "dead" if !(max_depth(root) == 2)

root = TreeNode.new(3,
          TreeNode.new(9),
          TreeNode.new(20,
              TreeNode.new(15),
              TreeNode.new(7)))
raise "dead" if !(max_depth(root) == 3)
