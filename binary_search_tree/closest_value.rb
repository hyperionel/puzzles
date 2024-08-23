# You are given a target value
# Find the closest value to your target value by searching the tree nodes


# BST as an object

class Node
  attr_accessor :value, :left, :right
  
  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end
end

class Bst
  attr_accessor :root, :size

  def initialize()
    @root = nil
    @size = 0
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    else
      curr_node = @root
      previous_node = @root

      while curr_node != nil
        previous_node = curr_node
        if value < curr_node.value
          curr_node = curr_node.left
        else
          curr_node = curr_node.right
        end
      end

      if value < previous_node.value
        previous_node.left = Node.new(value)
      else
        previous_node.right = Node.new(value)
      end
    end
    @size += 1
  end

  def print_in_order(node = tree)
    return 'NO NODES' if node.nil?

    puts '('
    print_in_order(node.left)
    puts ", #{node.value},"
    print_in_order(node.right)
    puts ')'
  end

  def invert_binary_tree(node = self.root)
    return if tree.nil?

    node.left, node.right = node.right, node.left
    invert_binary_tree(node.left)
    invert_binary_tree(node.right)
  end
end



# Recursive Method
# Average: Time - O(log(N)) | Time - O(log(n))
# Worst: Time - O(n) | Space - O(n)

def find_closest_value_bst(tree, target)
  return find_closest_value_bst_helper(tree, target, Float::INFINITY)
end

def find_closest_value_bst_helper(tree, target, closest)
  return closes if tree.nil?

  closest = tree.value if (target - closest).abs > (target - tree.value)

  return find_closest_value_bst_helper(tree.left, target, closest) if target < tree.value
  return find_closest_value_bst_helper(tree.right, target, closest) if target > tree.value
  return closest
end


# Iterative Method:

# Average: Time - O(log(N)) | Time - O(1)
# Worst: Time - O(n) | Space - O(1)

def find_closest_value_bst(tree, target)
  current_node = tree

  while !current_node.nil?
    closest = tree.value if (target - closest).abs > (target - current_node.value)

    if target < current_node.value
      current_node = current_node.left 
    elsif target > current_node.value
      current_node = current_node.right 
    else
      break
    end
  end

  return closest
end