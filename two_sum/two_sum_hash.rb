# Two Number Sum
#
# Objective: Find 2 elements in a given array that add up to a given number
#
# E.g 
# array = [3, 5, -4, 8, 11, 1, -1, 6]
# sum = 10
# desired result would be [11, -1]


def two_sum(arr, sum)
  counterpart_hash = {} # hash will keep track of elements previously iterated

  arr.each do |elem|
    counterpart = sum - elem
    return [counterpart, elem] if counterpart_hash[counterpart] # check against the hash to see if the counterpart was already iterated through
    counterpart_hash[elem] = true
  end

  return []
end

puts 'Input your array elements sepparated by a comma:'
arr = gets
arr = arr.chomp.split(',').map(&:to_i)

puts 'Input sum:'
sum = gets
sum = sum.chomp.to_i

result = two_sum(arr, sum)

if result.any?
  puts 'Elements adding up to the sum are: ' + result.to_s
else
  puts 'No result was found'
end


# Solution complexity
# Time: O(n)
# Space: O(n)