# [3, 5, -9, |1, 3, -2, 3, 4, 7, 2, -9, 6, 3, 1|, -5, 4]
# highest sum of a sub-array == 19

def kadanes_algorithm(array)
  max_ending_here = array[0]
  max_so_far = array[0]

  array.each do |num|
    max_ending_here = Math.max(max_ending_here + num, num)
    max_so_far = Math.max(max_so_far, max_ending_here)
  end

  return max_so_far
end