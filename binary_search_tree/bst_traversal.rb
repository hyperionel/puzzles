#       10
#      /  \
#     5    15
#    / \     \
#   2   5     22
#  /
# 1 
# Output:
# In-order: [1, 2, 5, 5, 10, 15, 22]
# Pre-order: [10, 5, 2, 1, 5, 15, 22]
# Post-order: [1, 2, 5, 5, 22, 15, 10]

def in_order_traverse(tree, array)
  unless tree.nil?
    in_order_traverse(tree.left)
    array.append(tree.value)
    in_order_traverse(tree.right)
  end

  return array
end
# O(n) time | O(n) space

def pre_order_traverse(tree, array)
  unless tree.nil?
    array.append(tree.value)
    pre_order_traverse(tree.left)
    pre_order_traverse(tree.right)
  end

  return array
end
# O(n) time | O(n) space

def post_order_traverse(tree, array)
  unless tree.nil?
    post_order_traverse(tree.left)
    post_order_traverse(tree.right)
    array.append(tree.value)
  end

  return array
end
# O(n) time | O(n) space