# [10, 15, 8, 12, 94, 81, 5, 2, 11]
# [10, 8, 5, 15, 2, 12, 11, 94, 81]

# Sol 1
# O(n^2) time | O(n^2) space
def same_bsts(array_one, array_two)
  return false if array_one.length != array_two.length

  return true if array_one.empty? && array_two.empty?

  return false if array_one[0] != array_two[0]

  left_one = get_smaller(array_one)
  left_two = get_smaller(array_two)
  right_one = get_bigger_or_equal(array_one)
  right_two = get_bigger_or_equal(array_two)

  return same_bsts(left_one, left_two)
  return same_bsts(right_one, right_two)
end

def get_smaller(array)
  array.select { |elem| elem < array[0] }
end

def get_bigger_or_equal(array)
  new_array = []
  (1..array.length - 1).each do |elem|
    new_array.append(elem) if elem >= array[0]
  end
  new_array
end

##############################################

# Sol 2
# O(n^2) time | O(d) space
def same_bsts(array_one, array_two)
  return are_same_bsts(array_one, array_two, 0, 0, Float::INFINITY, -Float::INFINITY)
end

def are_same_bsts(array_one, array_two, root_idx_one, root_idx_two, min_val, max_val)
  return false if array_one[root_idx_one] != array_two[root_idx_two]
  
  if root_idx_one == -1 || root_idx_two == -1
    return root_idx_one == root_idx_two
  end

  left_root_idx_one = get_idx_of_first_smaller(array_one, root_idx_one, min_val)
  left_root_idx_two = get_idx_of_first_smaller(array_two, root_idx_two, min_val)
  right_root_idx_one = get_idx_of_first_bigger_or_equal(array_one, root_idx_one, max_val)
  right_root_idx_two = get_idx_of_first_smaller(array_two, root_idx_two, max_val)

  current_value = array_one[root_idx_one]
  left_are_same = are_same_bsts(array_one, array_two, left_root_idx_one, left_root_idx_two, min_val, current_value)
  right_are_same = are_same_bsts(array_one, array_two, right_root_idx_one, right_root_idx_two, current_value, max_val)

  left_are_same && right_are_same
end

def get_idx_of_first_smaller(array, start, min_val)
  (start + 1..array.length - 1).each do |i|
    if array[i] < array[start] && array[i] >= min_val
      return i
    end
  end

  return -1
end

def get_idx_of_first_bigger_or_equal(array, start, max_val)
  (start + 1..array.length - 1).each do |i|
    if array[i] >= array[start] && array[i] < max_val
      return i
    end
  end

  return -1
end