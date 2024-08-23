# You are given an integer array arr. You can choose a set of integers and remove all the occurrences of these integers in the array.
# Return the minimum size of the set so that at least half of the integers of the array are removed.

# Example 1:

# Input: arr = [3,3,3,3,5,5,5,2,2,7]
# Output: 2
# Explanation: Choosing {3,7} will make the new array [5,5,5,2,2] which has size 5 (i.e equal to half of the size of the old array).
# Possible sets of size 2 are {3,5},{3,2},{5,2}.
# Choosing set {2,7} is not possible as it will make the new array [3,3,3,3,5,5,5] which has size greater than half of the size of the old array.

# Time O(n*log(n)) | Space O(n)
def min_set_size(arr)
  target_length = arr.length / 2
  count_hash = Hash.new(0)
  # O(n)
  arr.each { |num| count_hash[num] += 1 }

  res_set = []
  removed_elem_count = 0

  # O(n*log(n) + n)
  count_hash.sort_by{ |k , v| -v }.each do |k, v|
    break if removed_elem_count >= target_length

    res_set.append(k)
    removed_elem_count += v
  end

  res_set.length
end