# Binary Search
# [0, 1, 21, 33, 45, 45, 61, 71, 72, 73], 33

# Recursive implementation
# O(log(n)) time | O(log(n)) space

def binary_search(array, target)
  return binary_search_helper(array, target, 0, array.size - 1)
end

def binary_search_helper(array, target, left_pointer, right_pointer)
  return -1 if left_pointer > right_pointer

  middle_pointer = (left + right).floor
  potential_match = array[middle_pointer]

  if target == potential_match
    return middle_pointer
  elsif target < potential_match
    return binary_search_helper(array, target, left_pointer, middle - 1)
  else
    return binary_search_helper(array, target, middle + 1, right_pointer)
  end
end


# Iterative implementation
# O(log(n)) time | O(1) space

def binary_search(array, target)
  return binary_search_helper(array, target, 0, array.size - 1)
end

def binary_search_helper(array, target, left_pointer, right_pointer)
  while left <= right
    middle_pointer = (left + right).floor
    potential_match = array[middle_pointer]

    if target == potential_match
      return middle_pointer
    elsif target < potential_match
      right_pointer = middle - 1
    else
      left_pointer = middle + 1
    end
  end

  return -1
end