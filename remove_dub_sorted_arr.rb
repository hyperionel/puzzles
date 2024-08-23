require 'pry'
# Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once.
# The relative order of the elements should be kept the same.

# Example:
# Input: nums = [1,1,2]
# Output: 2, nums = [1,2]

def remove_duplicates(nums)
  return 0, [] if nums.empty?
  
  uniq = [nums[0]]

  nums[1..-1].each do |n|
    if n != uniq[-1]
      uniq.append(n)
    end
  end

  return uniq.size, uniq
end

puts 'Input your array elements sepparated by a comma:'
arr = gets
arr = arr.chomp.split(',').map(&:to_i)

result_len, result_arr = remove_duplicates(arr)

puts "New array: " + result_arr.to_s + "\n" + "Length: " + result_len.to_s


# Solution complexity: Time = O(n), Space = O(n)