# [1, 11, 3, 0, 15, 5, 2, 4, 10, 7, 12, 6]
# Output: [0, 7]

def largest_range(array)
  best_range = []
  longest_length = 0
  nums = {}

  array.each do |num|
    nums[num] = true
  end

  array.each do |num|
    next unless nums[num]
    nums[num] = false

    current_length = 1
    left = num - 1
    right = num + 1

    while nums[left]
      nums[left] = false
      current_length += 1
      left -= 1
    end

    while nums[right]
      nums[right] = false
      current_length += 1
      right += 1
    end

    longest_length = current_length if current_length > longest_length
    best_range = [left + 1, right - 1]
  end

  return best_range
end

# O(n) time | O(n) space