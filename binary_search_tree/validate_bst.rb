def validate_bst(tree)
  return validate_bst_helper(tree, Float::INFINITY, Float::INFINITY)
end

def validate_bst_helper(tree, min_val, max_val)
  return nil if tree.nil?

  return false if tree.value < min_val || tree.value >= max_val

  left_is_valid = validate_bst_helper(tree.left, min_val, tree.value)
  right_is_valid = validate_bst_helper(tree.right, tree.value, max_val)

  return left_is_valid && right_is_valid
end