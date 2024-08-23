require 'pry'
# Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

# You must write an algorithm that runs in O(n) time and without using the division operation.

# Example 1:

# Input: nums = [1,2,3,4]
# Output: [24,12,8,6]

# Example 2:

# Input: nums = [-1,1,0,-3,3]
# Output: [0,0,9,0,0]

# @param {Integer[]} nums
# @return {Integer[]}

def product_except_self(nums)
  return false if nums.empty?
  
  res = [1] * nums.size
  product_in_order = product_reverse = 1
  size = nums.size
  
  (0..nums.size).each do |i|
    res[i] *= product_in_order
    res[size - 1 - i] *= product_reverse
    
    product_in_order *= nums[i]
    product_reverse *= nums[size - 1 - i]
    binding.pry
  end
  
  return res
end

