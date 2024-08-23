# Two Number Sum
#
# Objective: Find 2 elements in a given array that add up to a given number
#
# E.g 
# array = [3, 5, -4, 8, 11, 1, -1, 6]
# sum = 10
# desired result would be [11, -1]

def two_sum(arr, sum)
  sorted_arr = arr.sort()

  lindex = 0
  rindex = arr.size - 1

  while sorted_arr[lindex] < sorted_arr[rindex]
    current_sum = sorted_arr[lindex] + sorted_arr[rindex]

    return [sorted_arr[lindex], sorted_arr[rindex]] if current_sum == sum

    sorted_arr[lindex] + sorted_arr[rindex] > sum ? rindex -= 1 : lindex += 1
  end
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

# Solution complexity:
# Time: O(nlog(n))
# Space: O(1)