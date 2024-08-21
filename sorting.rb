def quicksort(array)
  return array if array.length <= 1

  pivot = array[array.length / 2]  # Choosing the middle element as the pivot
  left = array.select { |x| x < pivot }
  middle = array.select { |x| x == pivot }
  right = array.select { |x| x > pivot }

  quicksort(left) + middle + quicksort(right)
end
