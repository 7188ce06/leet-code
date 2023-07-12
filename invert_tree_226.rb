# Solution for leetcode problem 226
# https://leetcode.com/problems/invert-binary-tree/

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

def invert_tree(root)
    if root == nil
        return nil
    else
        TreeNode.new(root.val, invert_tree(root.right), invert_tree(root.left))
    end
end

def is_same_tree(p, q)
    if p == nil and q == nil
        return true
    elsif p == nil or q == nil
        return false
    else
        return (p.val == q.val and is_same_tree(p.left, q.left) and is_same_tree(p.right, q.right))
    end
end

raise "the roof" if !is_same_tree(invert_tree(nil), nil)

root = TreeNode.new(89)
raise "the roof" if !is_same_tree(invert_tree(root), root)

root = TreeNode.new(89, TreeNode.new(12))
inverted = TreeNode.new(89, nil, TreeNode.new(12))
raise "the roof" if !is_same_tree(invert_tree(root), inverted)

root = TreeNode.new(89, nil, TreeNode.new(12))
inverted = TreeNode.new(89, TreeNode.new(12))
raise "the roof" if !is_same_tree(invert_tree(root), inverted)

root = TreeNode.new(89, TreeNode.new(15), TreeNode.new(12))
inverted = TreeNode.new(89, TreeNode.new(12), TreeNode.new(15))
raise "the roof" if !is_same_tree(invert_tree(root), inverted)

root = TreeNode.new(4,
          TreeNode.new(2,
              TreeNode.new(1),
              TreeNode.new(3)),
          TreeNode.new(7,
              TreeNode.new(6),
              TreeNode.new(9)))
inverted = TreeNode.new(4,
              TreeNode.new(7,
                TreeNode.new(9),
                TreeNode.new(6)),
              TreeNode.new(2,
                TreeNode.new(3),
                TreeNode.new(1)))
raise "the root" if !is_same_tree(invert_tree(root), inverted)
