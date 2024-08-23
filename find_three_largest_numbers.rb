# Find three largest numbers
# [18, 141, 541]
# [141, 1, 17, -7, -17, -27, 18, 541, 8, 7, 7]

def find_three_largest_numbers(array)
  three_largest = [nil, nil, nil]

  array.each do |num|
    update_largest(three_largest, num)
  end

  return three_largest
end

def update_largest(three_largest, num)
  if three_largest[2].nil? or num > three_largest[2]
    shift_and_update(three_largest, num, 2)
  elsif three_largest[1].nil? or num > three_largest[1]
    shift_and_update(three_largest, num, 1)
  elsif three_largest[0].nil? or num > three_largest[0]
    shift_and_update(three_largest, num, 0)
  end
end

def shift_and_update(array, num, index)
  (0..index + 1).each do |i|
    if i == index
      array[i] = num
    else
      array[i] = array[i + 1]
    end
  end
end