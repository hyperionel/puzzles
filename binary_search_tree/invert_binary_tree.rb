# Recursive
# O(n) time | O(d) space where d is the size of the longest branch
def invert_binary_tree(tree)
  unless tree.nil?
    tree.left, tree.right = tree.right, tree.left
    invert_binary_tree(tree.left)
    invert_binary_tree(tree.right)  
  end
end

# Iterative
# Time O(n) | Space O(n)
def invert_binary_tree(tree)
  queue = [tree]

  while queue.any?
    current = queue.first

    continue if current.none?
    swap_left_and_right(current)
    queue.append(current_node.left)
    queue.append(current_node.right)
  end
end

def swap_left_and_right(tree)
  tree.left, tree.right = tree.right, tree.left
end