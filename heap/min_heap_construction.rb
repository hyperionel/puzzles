# Conditions:                                  8
# Build heap                                 /   \
# Sift Down                                 12   23
# Sift up                                  /  \  /  \
# Insert                                  17  31 30  44
# Remove                                 /  \
#                                       102 18

#[8, 12, 23, 17, 31, 30, 44, 102, 18]

# current_node -> i
# child_one -> 2i + 1
# child_two -> 2i + 2
# parent_node -> ((i - 1) / 2).floor

class Minheap
  attr_accessor :heap
  
  def initialize(array)
    @heap = self.build_heap(array)
  end

  # O(n) time | O(1) space
  def build_heap(array)
    first_parent_index = (array.length - 2) / 2
    (first_parent_index..0).each do |current_index|
      sift_down(current_index, array.length - 1, array)
    end
  end

  # O(log(n)) | O(1) space
  def sift_down(current_index, end_index, heap)
    child_one_index = current_index * 2 + 1
    while child_one_index <= end_index
      child_two_index = current_index * 2 + 1 if current_index * 2 + 2 <= end_index
      if child_two_index != -1 && heap[child_two_index] < heap[child_one_index]
        index_to_swap = child_two_index
      else
        index_to_swap = child_one_index
      end
      if heap[index_to_swap] < heap[current_index]
        swap(current_index, index_to_swap, heap)
        current_index = index_to_swap
        child_one_index = current_index * 2 + 1
      else
        break
      end
    end
  end

  # O(log(n)) | O(1) space
  def sift_up(current_index, heap)
    parent_index = (current_index - 1) / 2
    while current_index > 0 && heap[current_index] < heap[parent_index]
      self.swap(current_index, parent_index, heap)
      current_index = parent_index
      parent_index = (current_index - 1) / 2
    end
  end

  def peek
    return @heap[0]
  end

  # O(log(n)) | O(1) space
  def remove
    swap(0, @heap.length - 1, @heap)
    value_to_remove = @heap.pop
    sift_down(0, @heap.length - 1, @heap)
    value_to_remove
  end

  # O(log(n)) | O(1) space
  def insert(value)
    @heap.append(value)
    self.sift_up(@heap.length - 1, @heap)
  end

  def swap(i, j, heap)
    heap[i], heap[j] = heap[j], heap[i]
  end
end