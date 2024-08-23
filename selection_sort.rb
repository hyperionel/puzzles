# Selection sort
# [8, 5, 2, 9, 5 ,6, 3]

def selection_sort(array)
  current_index = 0

  while current_index < array.size - 1
    smallest_index = current_index

    (current_index + 1..array.size - 1).each do |i|
      if array[smallest_index] > array[i]
        smallest_index = i
      end
    end
    swap(current_index, smallest_index, array)
    current_index += 1
  end

  return array
end

def swap(current_index, smallest_index, array)
  array[current_index], array[smallest_index] = array[smallest_index], array[current_index]
end