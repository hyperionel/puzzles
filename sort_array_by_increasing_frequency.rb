# Given an array of integers nums, sort the array in increasing order based on the frequency of the values. If multiple values have the same frequency, sort them in decreasing order.

# Return the sorted array.

# Example 1:

# Input: nums = [1,1,2,2,2,3]
# Output: [3,1,1,2,2,2]
# Explanation: '3' has a frequency of 1, '1' has a frequency of 2, and '2' has a frequency of 3.

def frequency_sort(nums)
  frequency_hash = Hash.new(0)

  nums.each { |num| frequency_hash[num] += 1 }
  
  result = []
  frequency_hash.sort_by(&:last).group_by(&:last).each do |freq, nums|
    nums.sort_by { |nums| -nums.first }.each do |nums|
      freq.times do
        result.append(nums.first)
      end
    end
  end

  result
end