# Given an array of integers nums, half of the integers in nums are odd, and the other half are even.
# Sort the array so that whenever nums[i] is odd, i is odd, and whenever nums[i] is even, i is even.
# Return any answer array that satisfies this condition.

 
# Example 1:
# Input: nums = [4,2,5,7]
# Output: [4,5,2,7]
# Explanation: [4,7,2,5], [2,5,4,7], [2,7,4,5] would also have been accepted.

# Example 2:

# Input: nums = [2,3]
# Output: [2,3]

# O(n) time | O(n) space
def sort_array_by_parity(array)
  res_array = Array.new(array.length, 0)
  
  current_even_idx = 0
  current_odd_idx = 1
  until array.empty?
    num = array.pop
    if num.even?
      res_array[current_even_idx] = num
      current_even_idx += 2
    else
      res_array[current_odd_idx] = num
      current_odd_idx += 2
    end
  end

  res_array
end

# Follow up: Can you solve it in-place?

# O(n^2) time | O(1) space
def sort_array_by_parity(nums)
  nums.each_with_index do |num, i|
    if i.even? && num.odd?
      (i..nums.length - 1).each do |j|
        nums[i], nums[j] = nums[j], nums[i] if nums[j].even?
      end
    elsif i.odd? && num.even?
      (i..nums.length - 1).each do |j|
        nums[i], nums[j] = nums[j], nums[i] if nums[j].odd?
      end
    end
  end

  nums
end

# O(n) time | O(1) psace
def sort_array_by_parrity(nums)
  even_misplaced = 0
  odd_misplaced = 1
  arr_len = nums.length

  while even_misplaced < nums.length && odd_misplaced < nums.length
    if nums[even_misplaced].even?
      even_misplaced += 2
    elsif nums[odd_misplaced].odd?
      odd_misplaced += 2
    else
      nums[even_misplaced] , nums[odd_misplaced] = nums[odd_misplaced], nums[even_misplaced]
      even_misplaced += 2
      odd_misplaced += 2
    end
  end

  nums
end