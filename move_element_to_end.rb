# Move element to end of the array
# [2, 1, 2, 2, 2, 3, 4, 2], 2
# Solution: [1, 3, 4, 2, 2, 2, 2, 2]

def move_element_to_end(array, to_move)
  i = 0
  j = arrray.length - 1

  while i < j
    while i < j && array[j] == to_move
      j -= 1
    end

    if array[i] == to_move
      array[i], array[j] = array[j], array[i]
    end
    i += 1
  end

  return array
end

# O(n) time | O(1) space