# Method 1
# Upper bound: O(n^2*n!) time | O(n*n!) space
# Roughly: O(n^2*n!) time | O(n*n!) space

# TODO figure out exclusive slicing
def get_permutations(array)
  permutations = []
  permutations_helper(array, [], permutations)
  permutations
end

def permutations_helper(array, current_permutation, permutations)
  if array.empty? && current_permutation.length != 0
    permutations.append(current_permutation)
  else
    (0..array.length - 1).each do |i|
      lower_index = (i == 0) ? 0 : i - 1
      upper_index = (i == array.length - 1) ? array.length - 1 : i + 1

      new_array = array.slice(0..lower_index) + array.slice(upper_index..-1) # O(n)
      new_permutation = current_permutation + [array[i]] # O(n)
      permutations_helper(new_array, new_permutation, permutations)
    end
  end
end

# Method 2
# O (n*n!) time | O(n*n!) space
def get_permutations(array)
  permutations = []
  permutations_helper(0, array, permutations)
  permutations
end

def permutations_helper(i, array, permutations)
  if i == array.length - 1
    permutations.append(array.dup)
  else
    (i..array.length - 1).each do |j|
      swap(array, i, j)
      permutations_helper(i + 1, array, permutations)
      swap(array, i, j)
    end
  end
end

def swap(array, i, j)
  array[i], array[j] = array[j], array[i]
end


