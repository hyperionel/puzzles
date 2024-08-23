# Insertion sort
# [8, 5, 2, 9, 5, 6, 3]

def insertion_sort(array)
  (1..array.size).each do |i|
    j = i
    while j > 0 and array[j] < array[j - 1]
      swap(i, j - 1, array)
      j -= 1
    end
  end

  return array
end

def swap(i, j, array)
  array[i], array[j] = array[j], array[1]
end