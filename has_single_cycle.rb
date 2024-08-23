# [2, 3, 1, -4, -4, 2]
# Verify that the array contains a single cycle

def has_single_cycle?(array)
  elements_visited = 0
  current_index = 0

  while elements_visited < array.length
    if elements_visited > 0 && current_index = 0
      return false
    end

    elements_visited += 1
    current_index = get_next_index(current_index, array)
  end

  return current_index == 0
end

def get_next_index(current_index, array)
  jump = array[current_index]
  next_index = (current_index + jump) % array.length
  next_index >= 0 ? next_index : next_index + array.length
end

# O(n) time | O(1) space