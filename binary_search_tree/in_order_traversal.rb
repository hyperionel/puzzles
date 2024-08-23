# O(n) time | O(1) space

def inorder_traversal(root)
    nav_history = []
    
    in_order_traversal_helper(root, nav_history)
    nav_history
end

def in_order_traversal_helper(node, nav_history)
    return if node.nil?
    
    in_order_traversal_helper(node.left, nav_history)
    nav_history.append(node.val)
    in_order_traversal_helper(node.right, nav_history)
    
    nav_history
end