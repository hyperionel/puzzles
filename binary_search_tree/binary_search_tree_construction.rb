class Bst
  attr_accessor :value, :left, :right
  
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  # Average: O(log(n)) time | O(1) space
  # Worst: O(n) time | O(1) space
  def insert(value)
    current_node = self

    while true
      if value < current_node.value
        if current_node.left.nil?
          current_node.left = Node.new(value)
          break
        else
          current_node = current_node.left
        end
      else
        if current_node.right.nil?
          current_node.right = Node.new(value)
          break
        else
          current_node = current_node.right
        end
      end
    end

    return self
  end

  # Average: O(log(n)) time | O(1) space
  # Worst: O(n) time | O(1) space
  def contains?(value)
    current_node = self

    while !current_node.nil?
      if value < current_node.value
        current_node = current_node.left
      elsif value > current_node.value
        current_node = current_node.right
      else
        return true
      end
    end

    false
  end
 
  def remove(value, parent_node = nil)
    current_node = self

    while !current_node.nil?
      if value < current_node.value
        parent_node = current_node
        current_node = current_node.left
      elsif value > current_node.value
        parent_node = current_node
        current_node = current_node.right
      else
        unless current_node.left.nil? && current_node.right.nil?
          current_node.value = current_node.right.get_min_value
          current_node.right.remove(current_node.value, current_node)
        elsif parent_node.nil?
          unless current_node.left.nil?
            current_node.value = current_node.left.value
            current_node.right = current_node.left.right
            current_node.left = current_node.left.left
          elsif !current_node.right.nil?
            current_node.value = current_node.right.value
            current_node.right = current_node.right.right
            current_node.left = current_node.right.left
          end
        elsif parent_node.left == current_node
          parent_node.left = current_node.left.nil? ? current_node.right : current_node.left 
        elsif parent_node.right == current_node
          parent_node.right = current_node.left.nil? ? current_node.right : current_node.left
        end
        break
      end
    end

    self
  end

  def get_min_value
    current_node = self

    while !current_node.left.nil
      current_node = current_node.left
    end

    current_node.value
  end
end