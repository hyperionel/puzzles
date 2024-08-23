# Bubble sort
# [8, 5, 2, 9, 5, 6, 3]

# O(n^2) time | O(1) space

def bubble_sort(array)
  is_sorted = false
  counter = 0

  while !is_sorted
    is_sorted = false

    (0..array.size - 1 - counter).each do |i|
      if array[i] > array[i + 1]
        swap(i, i + 1, array)
        is_sorted = false
      end
    end

    # each loop through will set the highest value in the array to the end of the array
    # this will optimize the speed of the algorithm by not having to loop through the whole array everytime
    counter += 1
  end

  return array
end

def swap(i, j, array)
  array[i], array[j] = array[j], array[i]
end