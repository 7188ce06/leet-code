# Solution for leetcode.com problem #863
# https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val, left=nil,right=nil)
        @val = val
        @left, @right = left, right
    end
end

def distance_k(root, target, k)
    # Find @target and record the parent of each node.    
    target_node = nil
    parents = {}
    unvisited = [root]
    while unvisited != []
        node = unvisited.pop
        if node.val == target
            target_node = node
        end
        if node.left != nil
            parents[node.left] = node
            unvisited.push(node.left)
        end
        if node.right != nil
            parents[node.right] = node
            unvisited.push(node.right)
        end
    end

    # Search down from @target_node
    found = []
    unvisited = [[target_node, k]]
    while unvisited != []
        x = unvisited.pop
        node, remk = x[0], x[1]
        if remk == 0
            found.append(node.val)
        else
            raise "assert" if !(remk >= 1)
            if node.left != nil
                unvisited.push([node.left, remk-1])
            end
            if node.right != nil
                unvisited.push([node.right, remk-1])
            end
        end
    end

    # Search up from @target_node
    downhere = []
    curr = target_node
    remk = k
    while 1 <= remk and parents.has_key?(curr)
        parent = parents[curr]
        if remk == 1
            found.append(parent.val)
        else
            raise "assert" if !(remk >= 2)
            if parent.left == curr
                if parent.right != nil
                    downhere.append([parent.right, remk-2])
                end
            else
                raise "assert" if !(parent.right == curr)
                if parent.left != nil
                    downhere.append([parent.left, remk-2])
                end
            end
        end
        curr = parent
        remk -= 1
    end
            
    while downhere != []
        x = downhere.pop
        node, remk = x[0], x[1]
        if remk == 0
            found.append(node.val)
        else
            raise "assert" if !(remk >= 1)
            if node.left != nil
                downhere.push([node.left, remk-1])
            end
            if node.right != nil
                downhere.push([node.right, remk-1])
            end
        end
    end

    found
end

root = TreeNode.new(1)
raise "Hell" if !(distance_k(root, 1, 0) == [1])
raise "Hell" if !(distance_k(root, 1, 3) == [])

root = TreeNode.new(1,
          TreeNode.new(2),
          TreeNode.new(3))
raise "Hell" if !(distance_k(root, 1, 0) == [1])
raise "Hell" if !(distance_k(root, 1, 1).sort == [2,3].sort)
raise "Hell" if !(distance_k(root, 1, 2) == [])
raise "Hell" if !(distance_k(root, 2, 0) == [2])
raise "Hell" if !(distance_k(root, 2, 1) == [1])
raise "Hell" if !(distance_k(root, 2, 2) == [3])
raise "Hell" if !(distance_k(root, 3, 0) == [3])
raise "Hell" if !(distance_k(root, 3, 1) == [1])
raise "Hell" if !(distance_k(root, 3, 2) == [2])

root = TreeNode.new(8,
          TreeNode.new(3,
              TreeNode.new(2),
              TreeNode.new(47)),
          TreeNode.new(100,
              TreeNode.new(222)))
raise "Hell" if !(distance_k(root, 8, 0) == [8])
raise "Hell" if !(distance_k(root, 8, 1).sort == [3, 100].sort)
raise "Hell" if !(distance_k(root, 8, 2).sort == [2, 47, 222].sort)
raise "Hell" if !(distance_k(root, 8, 3).sort == [])
raise "Hell" if !(distance_k(root, 3, 0) == [3])
raise "Hell" if !(distance_k(root, 3, 1).sort == [8, 2, 47].sort)
raise "Hell" if !(distance_k(root, 3, 2) == [100])
raise "Hell" if !(distance_k(root, 3, 3) == [222])
raise "Hell" if !(distance_k(root, 3, 4) == [])
raise "Hell" if !(distance_k(root, 2, 0) == [2])
raise "Hell" if !(distance_k(root, 2, 1) == [3])
raise "Hell" if !(distance_k(root, 2, 2).sort == [47, 8].sort)
raise "Hell" if !(distance_k(root, 2, 3) == [100])
raise "Hell" if !(distance_k(root, 2, 4) == [222])
raise "Hell" if !(distance_k(root, 2, 5) == [])
raise "Hell" if !(distance_k(root, 47, 0) == [47])
raise "Hell" if !(distance_k(root, 47, 1) == [3])
raise "Hell" if !(distance_k(root, 47, 2).sort == [2, 8].sort)
raise "Hell" if !(distance_k(root, 47, 3) == [100])
raise "Hell" if !(distance_k(root, 47, 4) == [222])
raise "Hell" if !(distance_k(root, 47, 5) == [])
raise "Hell" if !(distance_k(root, 100, 0) == [100])
raise "Hell" if !(distance_k(root, 100, 1).sort == [8, 222].sort)
raise "Hell" if !(distance_k(root, 100, 2) == [3])
raise "Hell" if !(distance_k(root, 100, 3).sort == [2,47].sort)
raise "Hell" if !(distance_k(root, 100, 4) == [])
raise "Hell" if !(distance_k(root, 222, 0) == [222])
raise "Hell" if !(distance_k(root, 222, 1) == [100])
raise "Hell" if !(distance_k(root, 222, 2) == [8])
raise "Hell" if !(distance_k(root, 222, 3) == [3])
raise "Hell" if !(distance_k(root, 222, 4).sort == [2, 47].sort)
raise "Hell" if !(distance_k(root, 222, 5) == [])

root = TreeNode.new(3,
          TreeNode.new(5,
              TreeNode.new(6),
              TreeNode.new(2,
                  TreeNode.new(7),
                  TreeNode.new(4))),
          TreeNode.new(1,
              TreeNode.new(0),
              TreeNode.new(8)))
raise "Hell" if !(distance_k(root, 5, 2).sort == [7,4,1].sort)
