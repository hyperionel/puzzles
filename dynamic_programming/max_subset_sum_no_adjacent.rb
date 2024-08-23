# [7, 10, 12, 7, 9, 14]
# 7 + 12 + 14 = 33

# O(n) time | O(n) space
def max_subset_sum_no_adjacent(array)
  return if array.empty?
  return array[0] if array.size == 1

  max_sums = array
  max_sums = max(array[0], array[1])
  (2..array.size).each do |i|
    max_sums[i] = max(max_sums[i - 1], max_sums[i - 2] + array[i])
  end

  return max_sums[-1]
end

# O(n) time | O(1) space
def max_subset_sum_no_adjacent(array)
  return if array.empty?
  return array[0] if array.size == 1

  second = array[0]
  first = max(array[0], array[1])
  (2..array.length).each do |i|
    current = max(first, second + array[i])
    second = first
    first = current
  end

  return first
end