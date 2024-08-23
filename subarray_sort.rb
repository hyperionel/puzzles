# [1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19]
# Output: [3, 9]
# Find the subarray that when sorted will make the entire array sorted
# Return subarray indices

# O(n) time | O(1) space
def subarray_sort(array)
  min_out_of_order = 1.0 / 0
  max_out_of_order = -1.0 / 0

  (0..array.size - 1).each do |i|
    num = array[i]
    if is_out_of_order?(i, num, array)
      min_out_of_order = [min_out_of_order, num]
      max_out_of_order = [max_out_of_order, num]
    end
  end

  return [-1, -1] if min_out_of_order == 1.0 / 0

  subaray_left_idx = 0 

  while min_out_of_order >= array[subaray_left_idx]
    subaray_left_idx += 1
  end

  subarray_right_idx = array.size - 1

  while max_out_of_order <= array[subarray_right_idx]
    subarray_right_idx -= 1
  end

  return [subaray_left_idx, subarray_right_idx]
end

def is_out_of_order?(i, num, array)
  if i == 0
    return num > array[i + 1]
  elsif i == array.size - 1
    return num < array[i - 1]
  else
    num > array[i + 1] || num < array[i - 1]
  end
end