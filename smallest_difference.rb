# [-1, 5, 10, 20, 28, 3]
# [26, 134, 135, 15, 17]
# Solution [28, 26] - numbers with the smallest difference between the 2 arrays

def smallest_difference(array_one, array_two)
  array_one.sort!
  array_two.sort!
  
  index_one = 0
  index_two = 0

  smallest_difference = Float::INFINITY
  current_diff = Float::INFINITY
  smallest_pair = []

  while index_one < array_one.length && index_two < array_two.length
    first_num = array_one[index_one]
    second_num = array_two[index_two]

    if first_num < second_num
      current_diff = second_num - first_num
      index_one += 1
    elsif second_num < first_num
      current_diff = first_num - second_num
      index_two += 1
    else
      return [first_num, second_num]
    end

    if smallest_difference > current_diff
      smallest_difference = current_diff 
      smallest_pair = [first_num, second_num]
    end
  end

  return smallest_pair
end

# O(nlog(n) + mlog(m)) time | O(1) 