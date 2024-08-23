require 'pry'
# Given an array, rotate the array to the right by k steps, where k is non-negative.

# Example 1:

# Input: nums = [1,2,3,4,5,6,7], k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

def rotate(nums, k)
  k = k % nums.size
  new_arr = []
  current_index = 0
  
  while current_index <= nums.length - 1
    new_index = (current_index + k) % nums.length
    new_arr[new_index] = nums[current_index]
    current_index += 1
  end
  
  new_arr
end