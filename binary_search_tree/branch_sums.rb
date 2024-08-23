# Calculate and return the sum of the nodes on each branch of a binary tree

class BinaryTree
  attr_accessor :value, :left, :right
  
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def branch_sums(root)
  sums = []

  calculate_branch_sums(root, 0, sums)
  sums
end

def calc_branch_sums(node, running_sum, sums)
  return if node.nil?
  new_running_sum = running_sum + node.value

  return sums.append(new_running_sum) if node.left.nil? && node.right.nil?
  calc_branch_sums(node.left, new_running_sum, sums)
  calc_branch_sums(node.right, new_running_sum, sums)
end

# Complexity: O(n) time | O(n) space